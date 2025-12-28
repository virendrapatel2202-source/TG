<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="TG.Pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">


    <!-- ***** Start ***** -->
    <section class="special-area section_padding_100" id="about">
        <div class="container-fluid" id="exitpage">
            <div class="row">

                <div class="col-md-5">
                    <div class="row slideInLeft animated">
                        <div class="col-md-12 text-center">
                            <div class="section-heading text-center">
                                <h2>Payment</h2>
                            </div>
                            <div class="tkt">
                                <ul>
                                    <li class="text-left">
                                        <h3>
                                            <div id="divFinalTotal"></div>
                                        </h3>

                                    </li>

                                </ul>
                            </div>
                            
                           
                              <div class="text-center clearfix footer-textLayer">
                        <div class="sing-up-button d-lg-block">
                            <a href="L.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>

                            <a href="#" class="green-btn-btm" title="" id="PayAtCounter">Pay at Counter</a>
                            <a href="#" class="green-btn-btm" title="" id="PayHere">Pay Here =></a>
                            <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Home</a>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>



                <div id="divQRScan" class="col-md-5">
                    <div class="row slideInLeft animated">
                        <div class="col-md-12 text-center">

                            <div>
                                <img id="imgPayTm" src="img/PayTm.png" class="imgPayTm" style="visibility: hidden; margin-top: -50px" height="600" />
                                <img id="imgQRCode" title="" style="margin-top: -420px" width="240" />
                            </div>
                        </div>
                    </div>
                </div>




            </div>
        </div>
    </section>
    <!-- ***** End ***** -->


    <!-- ***** Footer Area Start ***** -->


    <script>
        $(document).ready(function () {

            function GetParameterValues(param) {
                var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < url.length; i++) {
                    var urlparam = url[i].split('=');
                    if (urlparam[0] == param) {
                        return urlparam[1];
                    }
                }
            }

            var FinalTotal = GetParameterValues('Final_Total');
            //FinalTotal = 1;

            $("#divFinalTotal").html("Rs." + FinalTotal);

            $("#PayAtCounter").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "Thankyou.aspx?IsPaid=False";

                }, 500);
            });

            $("#PayHere").click(function () {

                // $("#divQRScan").show();

                $.ajax({
                    type: "POST",
                    url: "Pay.aspx/Payhere",
                    data: '{name:"abc"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnPayhereSuccess,
                    failure: function (response) {
                        //  alert(response.d);

                    }
                });

            })

            function OnPayhereSuccess(response) {
                //alert(response.d);
                //console.log(response.d);
                $(".imgPayTm").css("visibility", "visible");

                imgQRCode.src = 'data:image/png;base64,' + response.d;

                CheckPayment();
            }

            function CheckPayment() {

                $.ajax({
                    type: "POST",
                    url: "Pay.aspx/PaymentCheck",
                    data: '{name:"abc"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnCheckPaymentSuccess,
                    failure: function (response) {
                        //  alert(response.d);

                    }
                });
            }

            function OnCheckPaymentSuccess(response) {

                if (response.d == "True") {
                    $("#exitpage").addClass("animated slideOutRight");
                    setTimeout(function () {
                        window.location.href = "Thankyou.aspx?IsPaid=True";

                    }, 500);

                }
                else {
                    setTimeout(function () {

                        CheckPayment();

                    }, 3 * 1000);
                }


            };

        });

    </script>
</asp:Content>
