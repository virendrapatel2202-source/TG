using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibraryProject;

namespace TG
{
    public partial class P : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (clsData.Data.ParentName != string.Empty)
            {
                txtName.Text = clsData.Data.ParentName;
            }

            //if (Request.QueryString["MobileNo"] != null)
            //{

            //    TGEntity ent = new TGEntity();
            //    ent.MobileNo = Request.QueryString["MobileNo"];



            //    var cd = CustomerBL.GetCustomerByMobileNumber(ent.MobileNo);

            //    if (cd != null)
            //    {
            //        ent.CustomerID = cd.CustomerID;
            //        txtName.Text = cd.CustomerName;
            //        ent.ChildName = cd.ChildName;
            //        ent.IsPlaying = CustomerBL.IsCustomerPlaying(Convert.ToInt32(ent.CustomerID));
            //    }

            //    clsData.Data = ent;
            //}
            //else if(clsData.Data.ParentName != string.Empty)
            //{
            //    txtName.Text = clsData.Data.ParentName;
            //}

        }
    }
}