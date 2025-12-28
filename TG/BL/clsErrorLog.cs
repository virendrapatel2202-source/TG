using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace TG.BL
{
    public class clsErrorLog
    {
        public static void CreateLog(string Message)
        {
            try
            {

                var Path = HttpContext.Current.Server.MapPath("~/ErrorLog/");
                if (!Directory.Exists(Path))
                    Directory.CreateDirectory(Path);
                using (StreamWriter str = new StreamWriter(Path + "\\" + "ErrorLog-" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt", true))
                {
                    str.WriteLine("\n");
                    str.WriteLine(DateTime.Now.ToShortTimeString() + ": " + Message);
                    str.Dispose();
                    str.Close();
                }

            }
            catch
            {

            }
        }
    }
}