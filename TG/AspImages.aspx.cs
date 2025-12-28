using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TG
{
    public partial class AspImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<String> images = new List<string>();
            var path = this.Server.MapPath("~/Print");
            DirectoryInfo info = new DirectoryInfo(path);
            FileInfo[] files = info.GetFiles().Where(x => x.CreationTime.Date == DateTime.Now.Date).OrderByDescending(p => p.CreationTime).ToArray();

            
            foreach (FileInfo fi in files)
            {
                images.Add(string.Format( "~/Print/{0}",fi.Name));
            }


            RepeaterImages.DataSource = images;
            RepeaterImages.DataBind();
        }
    }
}