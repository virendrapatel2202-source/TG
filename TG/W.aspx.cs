using ClassLibraryProject;
using ClassLibraryProject.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class WalkinPlayTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TGEntity ent = clsData.Data;


            idChildName.InnerText = string.Format("Child name : {0}", ent.ChildName);
            idMobileNo.InnerText = string.Format("Mobile no. : {0}", ent.MobileNo);
            if (Request.QueryString["IsAdditionalService"] != null)
                ent.IsAdditionalService = true;
            else
                ent.IsAdditionalService = false;

            if (Request.QueryString["IsMember"] != null)
                ent.IsActiveMember = true;
            else
                ent.IsActiveMember = false;

            clsData.Data = ent;
        }

        [System.Web.Services.WebMethod]
        public static string GetRates(string name)
        {
            if (clsData.Data.IsActiveMember == true)
            {
                return "0,0";
            }
            else
            {
                var result = RatesBL.GetRates();
                return result.TodaysRate + "," + result.TodaysRateExtension;
            }
        }
    }
}