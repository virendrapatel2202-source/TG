using ClassLibraryProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class FD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //var Name = Request.QueryString["Name"];
            //if (Name != null)
            //{
            //    TGEntity ent = clsData.Data;
            //    ent.ChildName = Name;
            //    clsData.Data = ent;
            //}
        }

        [System.Web.Services.WebMethod]
        public static List<ServiceMaster_Entity> GetFoodItems(string name)
        {
            ServiceBL BL = new ServiceBL();
            var result = ServiceBL.GetAllServices();
            return result.Where(tmp => tmp.CategoryID == 2 && tmp.IsActive == true).OrderBy(tmp => tmp.OrderBy).ToList();
        }
    }
}