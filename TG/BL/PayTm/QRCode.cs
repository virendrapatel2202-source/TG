using Newtonsoft.Json;

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using Paytm;

namespace TG
{
    public static class QRCode
    {
        public static string GenerateCode(string TokenID, int Amount)

        {
            Dictionary<string, string> body = new Dictionary<string, string>();
            Dictionary<string, string> head = new Dictionary<string, string>();
            Dictionary<string, Dictionary<string, string>> requestBody = new Dictionary<string, Dictionary<string, string>>();

            //test
            //string MID = "Wxivou13302847074879";
            //string MKey = "NzJbJs#iNyJUtxwN";

            //prod
            string MID = "HYlYsx54169050056338";
            string MKey = "0m#UnfdC8s7AJn12";

            body.Add("mid", MID);
            //body.Add("orderId", "OREDRID98765");
            body.Add("orderId", TokenID);
            body.Add("amount", Amount.ToString());
            body.Add("businessType", "UPI_QR_CODE");
            body.Add("posId", "BB01");

            var result = JsonConvert.SerializeObject(body);
            /*
            * Generate checksum by parameters we have in body
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
            */
            string paytmChecksum = Checksum.generateSignature(JsonConvert.SerializeObject(body), MKey);

              head.Add("clientId", "C11");
           // head.Add("channelId", "WEB");
            head.Add("version", "V1");
            head.Add("signature", paytmChecksum);

            requestBody.Add("body", body);
            requestBody.Add("head", head);

            string post_data = JsonConvert.SerializeObject(requestBody);

            //For  Staging
            //string url = "https://securegw-stage.paytm.in/paymentservices/qr/create";

            //For  Production  url
            string  url  =  "https://securegw.paytm.in/paymentservices/qr/create";

            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);

            webRequest.Method = "POST";
            webRequest.ContentType = "application/json";
            webRequest.ContentLength = post_data.Length;

            using (StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter.Write(post_data);
            }

            string responseData = string.Empty;

            using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
            {
                responseData = responseReader.ReadToEnd();
            }

            var data = JsonConvert.DeserializeObject<Root>(responseData);
            return data.body.image;
        }


        //public static string GenerateLink(int Amount)
        //{
        //    Dictionary<string, string> body = new Dictionary<string, string>();
        //    Dictionary<string, string> head = new Dictionary<string, string>();
        //    Dictionary<string, Dictionary<string, string>> requestBody = new Dictionary<string, Dictionary<string, string>>();

        //    //test
        //    string MID = "Wxivou13302847074879";
        //    string MKey = "NzJbJs#iNyJUtxwN";

        //    //prod

        //    //string MID = "Wxivou13302847074879";
        //    //string MKey = "NzJbJs#iNyJUtxwN";


        //    body.Add("mid", MID);
        //    body.Add("merchantOrderId", "OREDRID98765");


        //   // body.Add("orderId", "OREDRID98765");
        //    body.Add("amount", Amount.ToString());
        //    body.Add("posId", "S12_123");
        //    body.Add("userPhoneNo", "9987558850"); 

        //    var result = JsonConvert.SerializeObject(body);
        //    /*
        //    * Generate checksum by parameters we have in body
        //    * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
        //    */
        //    string paytmChecksum = Checksum.generateSignature(JsonConvert.SerializeObject(body), MKey);

        //    head.Add("clientId", "C11");
        //    // head.Add("channelId", "WEB");
        //    head.Add("version", "V1");
        //    head.Add("signature", paytmChecksum);

        //    requestBody.Add("body", body);
        //    requestBody.Add("head", head);

        //    string post_data = JsonConvert.SerializeObject(requestBody);

        //    //For  Staging
        //    string url = "https://securegw-stage.paytm.in/order/sendpaymentrequest";

        //    //For  Production  url
        //    //string  url  =  "https://securegw.paytm.in/paymentservices/qr/create";

        //    HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);

        //    webRequest.Method = "POST";
        //    webRequest.ContentType = "application/json";
        //    webRequest.ContentLength = post_data.Length;

        //    using (StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream()))
        //    {
        //        requestWriter.Write(post_data);
        //    }

        //    string responseData = string.Empty;

        //    using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
        //    {
        //        responseData = responseReader.ReadToEnd();
        //    }

        //    return responseData;
        //}

        class Head
        {
            public string responseTimestamp { get; set; }
            public string version { get; set; }
            public string clientId { get; set; }
            public string signature { get; set; }
        }

        class ResultInfo
        {
            public string resultStatus { get; set; }
            public string resultCode { get; set; }
            public string resultMsg { get; set; }
        }

        class Body
        {
            public ResultInfo resultInfo { get; set; }
            public string qrCodeId { get; set; }
            public string qrData { get; set; }
            public string image { get; set; }
        }

        class Root
        {
            public Head head { get; set; }
            public Body body { get; set; }
        }
    }


   
}