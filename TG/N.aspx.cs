using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibraryProject;

namespace TG
{
    public partial class N : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            TGEntity ent = clsData.Data;
            ent.ParentName = Request.QueryString["Name"];


            //  var cd = CustomerBL.GetCustomerByMobileNumber(ent.MobileNo);

            if (ent.ChildName != string.Empty)
            {
                txtName.Text = ent.ChildName;
                
            }

            clsData.Data = ent;

        }
    }
}