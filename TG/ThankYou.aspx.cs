using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ClassLibraryProject;
using Newtonsoft.Json;
using TG.BL;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;

namespace TG
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SendImage("9987558850", "http://bouncingbunnyadmin.centralindia.cloudapp.azure.com/TG/Print/01-Mar-2022_BB001.png");
            return;
            TGEntity ent = clsData.Data;
            if (Request.QueryString["IsPaid"] != null)
            {
                ent.IsPaid = Convert.ToBoolean(Request.QueryString["IsPaid"]);
                clsData.Data = ent;
            }


            BBContextEntities OBJDB = new BBContextEntities();

            System.Data.Entity.Core.Objects.ObjectParameter tokenNumber = new System.Data.Entity.Core.Objects.ObjectParameter("TokenNumber", typeof(string));
            System.Data.Entity.Core.Objects.ObjectParameter TokenOrderID = new System.Data.Entity.Core.Objects.ObjectParameter("TokenOrderID", typeof(int));
            var json = string.Empty;
            if (ent.Services != null)
            {
                json = JsonConvert.SerializeObject(ent.Services);
            }

            var result = OBJDB.proc_TokenMaster_3(ent.CustomerID, ent.MobileNo, ent.ParentName, ent.ChildName, ent.PlayTimeTotalMinutes > 0 ? (ent.IsActiveMember == true ? 2 : 1) : 0, ent.PlayTimeTotalMinutes, ent.PlayHrsAndMinutes_Amount, ent.TotalNoOfChilds, json, ent.Final_Total, (ent.IsPaid ? ent.Final_Total : 0), ent.IsActiveMember, tokenNumber, TokenOrderID);

            ent.TokenNumber = tokenNumber.Value.ToString();
            ent.TokenOrderID = Convert.ToInt32(TokenOrderID.Value);
            clsData.Data = ent;

            // DBDataClassesDataContext DB = new DBDataClassesDataContext();
            // proc_TokenMasterResult result = DB.proc_TokenMaster(ent.ChildName, ent.MobileNo, Convert.ToInt32(ent.PlayTimeTotalMinutes), ent.IsChair, ent.IsVR, ent.IsZip, ent.IsPaid, Convert.ToInt32(ent.TotalNoOfChilds)).FirstOrDefault();

            idTokenNo.InnerText = tokenNumber.Value.ToString();
            idChildName.InnerText = string.Format("Child name : {0}", ent.ChildName);
            idMobileNo.InnerText = string.Format("Mobile no : {0}", ent.MobileNo);

            if (ent.PlayTimeMessage != null && ent.PlayTimeMessage.Trim().Length > 0)
            {
                string HTMLPlay = @"<li class=""text-left""><div class=""row""><div class=""col-9"">{0}</div><div class=""col-3"">Rs. {1}</div></div> <hr /></li>";
                ulTkt.Controls.Add(new LiteralControl(string.Format(HTMLPlay, ent.PlayTimeMessage, ent.PlayHrsAndMinutes_Amount)));
            }
            if (ent.Services.Count() > 0)
            {
                List<ServiceMaster_Entity> lstServices = ServiceBL.GetAllServices();

                var widgets1_in_widgets2 = from first in lstServices
                                           join second in ent.Services
                                           on first.ServiceID equals second.ServiceID
                                           select first;

                foreach (var item in widgets1_in_widgets2)
                {
                    var sm = ent.Services.Where(t => t.ServiceID == item.ServiceID).FirstOrDefault();
                    string HTMLChair = string.Format(@"<li class=""text-left""><div class=""row""><div class=""col-6"">{0}</div><div class=""col-3""> {1}*{2} </div><div class=""col-3"">Rs. {3}</div></div> <hr /></li>", item.ServiceDesc, sm.Amt, sm.Qty, sm.Amt * sm.Qty);
                    ulTkt.Controls.Add(new LiteralControl(HTMLChair));
                }
            }
            //if (ent.MassageChair > 0)
            //{
            //    string HTMLChair = @"<li class=""text-left""><div class=""row""><div class=""col-9"">Message chair : 20 mins</div><div class=""col-3"">Rs. 100</div></div> <hr /></li>";
            //    ulTkt.Controls.Add(new LiteralControl(HTMLChair));
            //}

            //if (ent.VRGame > 0)
            //{
            //    string HTMLVR = @"<li class=""text-left""><div class=""row""><div class=""col-9"">VR game :</div><div class=""col-3"">Rs. 100</div></div> <hr /></li>";
            //    ulTkt.Controls.Add(new LiteralControl(HTMLVR));
            //}

            //if (ent.ZipLine > 0)
            //{
            //    string HTMLZip = @"<li class=""text-left""><div class=""row""><div class=""col-9"">Zip line : 3 rounds</div><div class=""col-3"">Rs. 100</div></div> <hr /></li>";
            //    ulTkt.Controls.Add(new LiteralControl(HTMLZip));
            //}


            string HTMLTotal = @"<li class=""text-left""><div class=""row""><div class=""col-3 fw-bold"">Total : </div><div class=""col-9 fw-bold"">Rs. {0} ({1})</div></div> <hr /></li>";
            ulTkt.Controls.Add(new LiteralControl(string.Format(HTMLTotal, ent.Final_Total, ent.IsPaid == true ? "Paid" : "Payment Pending")));


            string htmlDateTime = @"<li class=""text-center""><span class=""sm-font"">Date Time : {0}</span><br /></li>";
            ulTkt.Controls.Add(new LiteralControl(string.Format(htmlDateTime, DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss"))));

            ulTkt.Controls.Add(new LiteralControl(@"<li class=""text-center""><span class=""sm-font"">Thank You</span><br /></li>"));

            // var Path = Server.MapPath(string.Format("~/Print/{0}_{1}.bmp", DateTime.Now.ToString("dd-MMM-yyyy"), tokenNumber.Value.ToString()));
            //   SendWhatsup.SendSMS("");


        }

        public static async Task SendImage(string mobileNo, string imageUrl)
        {
            string token = "YOUR_ACCESS_TOKEN";
            string phoneNumberId = "YOUR_PHONE_NUMBER_ID";

            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization =
                    new AuthenticationHeaderValue("Bearer", token);

                var json = $@"
            {{
              ""messaging_product"": ""whatsapp"",
              ""to"": ""{mobileNo}"",
              ""type"": ""image"",
              ""image"": {{
                 ""link"": ""{imageUrl}"",
                 ""caption"": ""Bouncing Bunny Play Ticket""
              }}
            }}";

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                await client.PostAsync(
                    $"https://graph.facebook.com/v20.0/{phoneNumberId}/messages",
                    content
                );
            }
        }


        //[System.Web.Services.WebMethod]
        //public static string TakeScreenshot(string name)
        //{
        //    //  var Path = System.Web.HttpContext.Current.Server.MapPath(string.Format("~/Print/{0}_{1}.bmp", DateTime.Now.ToString("dd-MMM-yyyy"), clsData.Data.TokenNumber));
        //    //  Bitmap bitmap = new Bitmap
        //    //(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);

        //    //  Graphics graphics = Graphics.FromImage(bitmap as System.Drawing.Image);
        //    //  graphics.CopyFromScreen(25, 25, 25, 25, bitmap.Size);

        //    //  bitmap.Save(Path, ImageFormat.Bmp);

        //    //  SendWhatsup.SendSMSAndImage(Path);
        //    return "Hello";
        //}

        [System.Web.Services.WebMethod]
        public static string SaveScreenShot(string base64Image)
        {
            try
            {

                var FileName = string.Format("{0}_{1}.png", DateTime.Now.ToString("dd-MMM-yyyy"), clsData.Data.TokenNumber);
                var Path = System.Web.HttpContext.Current.Server.MapPath(string.Format("~/Print/{0}", FileName));
                //  Bitmap bitmap = new Bitmap
                //(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);

                //  Graphics graphics = Graphics.FromImage(bitmap as System.Drawing.Image);
                //  graphics.CopyFromScreen(25, 25, 25, 25, bitmap.Size);
                string convert = base64Image.Replace("data:image/png;base64,", String.Empty);
                byte[] bytes = Convert.FromBase64String(convert);

                using (MemoryStream ms = new MemoryStream(bytes))
                {
                    System.Drawing.Image pic = System.Drawing.Image.FromStream(ms);
                    pic.Save(Path, ImageFormat.Png);
                }

                //   bitmap.Save(Path, ImageFormat.Bmp);
                // server path
                var ServerPath = string.Format("http://40.117.187.220/BBClient/Print/{0}", FileName);

                TGEntity ent = clsData.Data;
                //SendWhatsup.SendSMSAndImage(ent.MobileNo, ServerPath, ent.TokenNumber, ent.TokenOrderID);
            }
            catch (Exception ex)
            {
                clsErrorLog.CreateLog("SaveScreenShot" + ex.Message);
            }

            return "Hello";
        }

    }
}