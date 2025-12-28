using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ClassLibraryProject;

namespace TG
{
    public static class clsData
    {
        //static List<CD> _staticCustomerData = null;
        //public static CD GetCustomerData(string MobileNo)
        //{
        //    CD obj = null;
        //    //if (_staticCustomerData == null)
        //    //{
        //    //    DBDataClassesDataContext db = new DBDataClassesDataContext();
        //    //    //   var cd = db.CDs.Where(tmp => tmp.MobileNo == ent.MobileNo).FirstOrDefault();
        //    //    _staticCustomerData = db.CDs.ToList();
        //    //}

        //    //if (_staticCustomerData != null)
        //    //{
        //    //    obj = _staticCustomerData.Where(t => t.MobileNo == MobileNo).FirstOrDefault();
        //    //}

        //    return obj;
        //}

        public static TGEntity Data
        {
            get
            {
                if (HttpContext.Current.Session["Data"] != null)
                {
                    return HttpContext.Current.Session["Data"] as TGEntity;
                }
                else
                {
                    return new TGEntity();
                }
            }
            set
            {

                HttpContext.Current.Session["Data"] = value;

            }
        }


    }

    //public class clsEntity
    //{
    //    public int? CustomerID { get; set; }
    //    public string MobileNo { get; set; }
    //    public string ChildName { get; set; }

    //    public string PlayTimeMessage { get; set; }
    //    public decimal PlayHrsAndMinutes_Amount { get; set; }
    //    public int PlayTimeTotalMinutes { get; set; }

    //    public int MassageChair { get; set; }
    //    public int VRGame { get; set; }
    //    public int ZipLine { get; set; }

    //    public decimal Final_Total { get; set; }

    //    public int TotalNoOfChilds { get; set; }
    //    public bool IsPaid { get; set; }

    //    public bool IsAdditionalService { get; set; }
    //}


}