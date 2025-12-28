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
    public static class PayTmPaymentCheck
    {
        public static bool CheckPayment(string OrderID)

        {
          //  OrderID = "d6c8637a-eda7-48ee-a898-1632e7ce5bb7";


            string MID = "HYlYsx54169050056338";
            string MKey = "0m#UnfdC8s7AJn12";

            Dictionary<string, string> body = new Dictionary<string, string>();
            Dictionary<string, string> head = new Dictionary<string, string>();
            Dictionary<string, Dictionary<string, string>> requestBody = new Dictionary<string, Dictionary<string, string>>();

            body.Add("mid", MID);
            body.Add("orderId", OrderID);

            /*
            * Generate checksum by parameters we have in body
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
            */
            string paytmChecksum = Checksum.generateSignature(JsonConvert.SerializeObject(body), MKey);

            head.Add("signature", paytmChecksum);

            requestBody.Add("body", body);
            requestBody.Add("head", head);

            string post_data = JsonConvert.SerializeObject(requestBody);

            //For  Staging
            // string url = "https://securegw.paytm.in/v3/order/status";

            //For  Production 
            string url = "https://securegw.paytm.in/v3/order/status";

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
            return data.body.resultInfo.resultStatus == "TXN_SUCCESS";
        }


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
            public string txnId { get; set; }
            public string bankTxnId { get; set; }
            public string orderId { get; set; }
            public string txnAmount { get; set; }
            public string txnType { get; set; }
            public string gatewayName { get; set; }
            public string bankName { get; set; }
            public string mid { get; set; }
            public string paymentMode { get; set; }
            public string refundAmt { get; set; }
            public string txnDate { get; set; }
            public string authRefId { get; set; }
        }

        class Root
        {
            public Head head { get; set; }
            public Body body { get; set; }
        }

    }




}