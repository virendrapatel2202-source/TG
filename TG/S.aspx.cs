using ClassLibraryProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class Services1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TGEntity ent = clsData.Data;

            // Iframe Admin
            var MobileNo = Request.QueryString["MobileNo"];
            if (MobileNo != null)
            {
                ent = new TGEntity();
                ent.MobileNo = MobileNo;
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
                    clsData.Data = ent;
                }
            }
            else
            {
                var Name = Request.QueryString["Name"];
                if (Name != null)
                {

                    ent.ChildName = Name;
                    clsData.Data = ent;
                }
            }

            //var Name = Request.QueryString["Name"];
            //if (Name != null)
            //{

            //    ent.ChildName = Name;
            //    clsData.Data = ent;
            //}
            if (ent.IsPlayingg)
            {
                PlayNow.InnerHtml = "Play More";
                //  checkout.Visible = true;
            }
            else
            {
                //  checkout.Visible = false;
                PlayNow.InnerHtml = " Play Now";
            }

            if (ent.custPackage != null)
            {
                //.bg-warning => about to expire
                //.bg-danger => expired
                //.bg-secondary //gray
                //.bg-info => OK 
                member.Visible = true;
                //if (!(DateTime.Today >= ent.custPackage.DateStart && DateTime.Today <= ent.custPackage.DateEnd && ent.custPackage.IsActive == true))
                if (DateTime.Today > ent.custPackage.DateEnd && ent.custPackage.IsActive == true)
                {
                    //member.Disabled = false;
                    member.Attributes.Add("class", "btn-green bg-danger");
                }

                //StringBuilder sb = new StringBuilder();
                //sb.Append("Your Package");
                //sb.Append(string.Format("{0}Total- {1} Minutes", Environment.NewLine, ent.custPackage.TotalDurationMins));
                //sb.Append(string.Format("{0}Used - {1} Minutes", Environment.NewLine, ent.custPackage.TotalDurationMinsUsed));
                //sb.Append(string.Format("{0}Start - {1}", Environment.NewLine, ent.custPackage.DateStart.Value.ToString("dd/MMM/yyyy")));
                //sb.Append(string.Format("{0}End - {1}", Environment.NewLine, ent.custPackage.DateEnd.Value.ToString("dd/MMM/yyyy")));

                else if ((ent.custPackage.TotalDurationMins - ent.custPackage.TotalDurationMinsUsed) < 120)
                {
                    member.Attributes.Add("class", "btn-green bg-warning");
                }
                else
                {
                    member.Attributes.Add("class", "btn-green bg-info");
                }

                member.InnerHtml = string.Format("Your Package <br/> ================== <br/> {0} Minutes <br/> Used - {1} Minutes <br/> Start - {2} <br/> End - {3}", ent.custPackage.TotalDurationMins, ent.custPackage.TotalDurationMinsUsed, ent.custPackage.DateStart.Value.ToString("dd/MMM/yyyy"), ent.custPackage.DateEnd.Value.ToString("dd/MMM/yyyy"));
            }
            else
            {
                member.Visible = false;
            }
        }
    }
}