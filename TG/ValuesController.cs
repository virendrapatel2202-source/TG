using ClassLibraryProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TG
{
    public class ValuesController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        //public string Get(int id)
        //{
        //    return "value";
        //}
          
        public bool Get(string mobileno)
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

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}