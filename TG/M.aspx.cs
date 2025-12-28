using ClassLibraryProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class InputKeyboardMob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static bool GetData(string mobileno)
        {
            

            TGEntity ent = new TGEntity();
            ent.MobileNo = mobileno;

          


            var cd = CustomerBL.GetCustomerByMobileNumber(ent.MobileNo);

            if (cd != null)
            {
                ent.CustomerID = cd.CustomerID;
                ent.ParentName = cd.CustomerName;
                ent.ChildName = cd.ChildName;

                bool IsCheckINN, IsPlayingg;
                CustomerPackage objCP = null;

                CustomerBL.IsCustomerCheckINNAndPlaying(Convert.ToInt32(ent.CustomerID), out IsCheckINN, out IsPlayingg, out objCP);
                ent.IsCheckINN = IsCheckINN;
                ent.IsPlayingg = IsPlayingg;
                ent.custPackage = objCP;
            }

          
            clsData.Data = ent;
            return ent.IsCheckINN;
        }
    }
}