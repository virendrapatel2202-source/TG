using ClassLibraryProject;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // DataSet ds = DashboardAdminBL.DashboardDataGetAll();

        }

        [WebMethod]
        public static string GetCounters(int LocationID)
        {
            //UserInfo.UserDetails objUser = new UserInfo.UserDetails();
            //objUser = (UserInfo.UserDetails)HttpContext.Current.Session["UserInfo"];

            DataSet ds = DashboardAdminBL.DashboardDataGetAll();

            DataTable dtCounter = new DataTable();
            try
            {
                // dtCounter = Counters.GetCounters(0, null, null, LocationID);
                HttpContext.Current.Session["ExportBranchCountersData"] = dtCounter;

            }
            catch (Exception ex)
            {
                //  Classes.Common.LogException(ex.Message, HttpContext.Current.Request.Url.AbsolutePath, System.Reflection.MethodInfo.GetCurrentMethod().ToString());
            }
            return GetJson(ds.Tables[1]);

        }

        public static string GetJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row = null;

            try
            {
                if (dt != null)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                            row.Add(col.ColumnName, dr[col]);
                        rows.Add(row);
                    }
                }
            }
            catch (Exception ex)
            {

                // Classes.Common.LogException(ex.Message, HttpContext.Current.Request.Url.AbsolutePath, System.Reflection.MethodInfo.GetCurrentMethod().ToString());
            }
            return serializer.Serialize(rows);


        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public static string GetCustomers()
        {
            DataSet ds = DashboardAdminBL.DashboardDataGetAll();
            System.Web.HttpContext.Current.Session["Data"] = ds.Tables[2];
            return GetJson(ds.Tables[1]);
        }

        
       

        [WebMethod]
        public static string GetOrderDetails(string TokenID)
        {
            DataSet ds = DashboardAdminBL.DashboardDataGetAll();

            DataTable dt = System.Web.HttpContext.Current.Session["Data"] as DataTable;
            DataTable tblFiltered = dt.AsEnumerable()
                             .Where(r => r.Field<int>("TokenID") == Convert.ToInt32(TokenID))
                             .CopyToDataTable();
            return GetJson(tblFiltered);
        }



    }
}