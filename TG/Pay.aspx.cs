using ClassLibraryProject;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class Pay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TGEntity ent = clsData.Data;
            List<Services> objS = new List<Services>();

            if (Request.QueryString["Food"] == null)
            {
                ent.PlayTimeMessage = Request.QueryString["PlayTimeMessage"];
                ent.PlayHrsAndMinutes_Amount = Convert.ToInt32(Request.QueryString["PlayHrsAndMinutes_Amount"]);
                ent.PlayTimeTotalMinutes = Convert.ToInt32(Request.QueryString["TotalPlayTimeMinutes"]);
                ent.TotalNoOfChilds = Convert.ToInt32(Request.QueryString["TotalNoOfChilds"]);


                //if (Convert.ToBoolean(Request.QueryString["IsChair"]))
                //{
                //    objS.Add(new Services() { ServiceID = 2, Qty = 1, Amt = 100 });
                //}

                //if (Convert.ToBoolean(Request.QueryString["IsVR"]))
                //{
                //    objS.Add(new Services() { ServiceID = 1, Qty = 1, Amt = 100 });
                //}

                //if (Convert.ToBoolean(Request.QueryString["IsZip"]))
                //{
                //    objS.Add(new Services() { ServiceID = 26, Qty = 1, Amt = 100 });
                //}
                //ent.TotalNoOfChilds = Convert.ToInt32(Request.QueryString["TotalNoOfChilds"]);

            }
            //else
            //{
            //    foreach (var item in Request.QueryString["Services"].Split(','))
            //    {

            //        if (item.Trim().Length > 0)
            //        {
            //            int ServiceID = Convert.ToInt32(item.Split('$')[0]);
            //            int Qty = Convert.ToInt32(item.Split('$')[1]);
            //            int Amount = Convert.ToInt32(item.Split('$')[2]);
            //            objS.Add(new Services() { ServiceID = ServiceID, Qty = Qty, Amt = Amount });
            //        }

            //    }
            //}

            foreach (var item in Request.QueryString["Services"].Split(','))
            {

                if (item.Trim().Length > 0)
                {
                    int ServiceID = Convert.ToInt32(item.Split('$')[0]);
                    int Qty = Convert.ToInt32(item.Split('$')[1]);
                    int Amount = Convert.ToInt32(item.Split('$')[2]);
                    objS.Add(new Services() { ServiceID = ServiceID, Qty = Qty, Amt = Amount });
                }

            }

            ent.Services = objS;
            ent.Final_Total = Convert.ToInt32(Request.QueryString["Final_Total"]);



            //testing
            //ent.PlayHrsAndMinutes_Amount = 1;

            clsData.Data = ent;
            if (ent.Final_Total == 0)
            {
                Response.Redirect("Thankyou.aspx?IsPaid=True");
            }
        }

        //protected void lnkPayHere_Click(object sender, EventArgs e)
        //{
        //    TGEntity ent = clsData.Data;
        //    string strGUID = Guid.NewGuid().ToString();
        //    Session["GUID"] = strGUID;
        //    string strImage = QRCode.GenerateCode(strGUID, 1);
        //    if (strImage != null)
        //    {
        //        byte[] bytes = Convert.FromBase64String(strImage);
        //        imgQRCode.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(bytes);
        //    }
        //}

        [System.Web.Services.WebMethod]
        public static string Payhere(string name)
        {
            TGEntity ent = clsData.Data;
            string strGUID = Guid.NewGuid().ToString();
            System.Web.HttpContext.Current.Session["GUID"] = strGUID;
            string strImage = QRCode.GenerateCode(strGUID, ent.Final_Total);
            //if (strImage != null)
            //{
            //    byte[] bytes = Convert.FromBase64String(strImage);
            //    imgQRCode.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(bytes);
            //}
            return strImage;
        }

        [System.Web.Services.WebMethod]
        public static string PaymentCheck(string name)
        {
            return PayTmPaymentCheck.CheckPayment(System.Web.HttpContext.Current.Session["GUID"].ToString()).ToString();

        }
    }
}