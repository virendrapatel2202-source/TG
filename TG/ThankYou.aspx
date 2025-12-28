<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="TG.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

    <!-- ***** Start ***** -->
    <section class="special-area section_padding_100" id="about">
        <div class="container-fluid">
            <%--  <div class="row">
                <div class="col-12">
                    <!-- Section Heading Area -->
                    <div class="section-heading text-center">
                        <h2>
                            <span class="green-txt">Thank you...!</span>
                        </h2>
                    </div>
                </div>
            </div>--%>

            <div class="slideInLeft animated">
                <div class="col-md-12 text-center">
                    <div class="overlay"></div>
                    <div id="capture" class="tkt">
                        <ul style="background-color: white">

                            <li class="text-left">
                                <img src="img/logo.png" alt="" />

                            </li>
                            <li class="bdr content-con">
                                <ul id="ulTkt" runat="server">

                                    <li class="text-center"><span>Ticket Number</span></li>
                                    <li class="text-center"><span class="lg-font text-center" id="idTokenNo" runat="server">BBN 000 
                                    </span></li>
                                    <li class="text-center">
                                        <span class="sm-font" id="idChildName" runat="server">Child Name : </span>
                                        <br />
                                        <span class="sm-font" id="idMobileNo" runat="server">Mobile No : </span>
                                        <br />
                                        <hr />
                                    </li>


                                </ul>
                            </li>
                            <li class="text-center">
                                <span>GSTIN - 27AAJCB6258P1ZX</span>

                            </li>


                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%--     <a href="#" class="btn-green" style="width:200px" title="" id="btnPrint">Print</a>--%>

        <asp:HiddenField ID="hfImageData" runat="server" />
    </section>

    <div class="text-center clearfix footer-text">
        <div class="sing-up-button d-lg-block">

            <a href="L.aspx" class="green-btn-btm" title="" id="home">Home</a>
        </div>
    </div>
    <!-- ***** End ***** -->
    <script>
        $(document).ready(function () {

            //$("#btnPrint").click(function () {
            //    var printContents = document.getElementById('capture').innerHTML;
            //    var originalContents = document.body.innerHTML;

            //    document.body.innerHTML = printContents;

            //    window.print();

            //    document.body.innerHTML = originalContents;
            //});


            setTimeout(function () {


                html2canvas(document.querySelector("#capture")).then(canvas => {
                    var base64 = canvas.toDataURL();
                    $.ajax({
                        type: "POST",
                        url: "ThankYou.aspx/SaveScreenShot",
                        data: '{base64Image:"' + base64 + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        failure: function (response) {
                            //  alert(response.d);
                        }
                    });

                });


                //$.ajax({
                //    type: "POST",
                //    url: "ThankYou.aspx/TakeScreenshot",
                //    data: '{name:"abc"}',
                //     contentType: "application/json; charset=utf-8",
                //     dataType: "json",
                //     success: OnSuccess,
                //     failure: function (response) {
                //       //  alert(response.d);
                //     }
                //});

            }, 3 * 1000);



            function OnSuccess(response) {
                //  alert(response.d);
            }

            setTimeout(function () {
                window.location.href = "L.aspx";
            }, 20 * 1000);
        });
    </script>
</asp:Content>
