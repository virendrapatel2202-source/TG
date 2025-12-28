<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="W.aspx.cs" Inherits="TG.WalkinPlayTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">
    <style>
        .form-check-input {
            width: 1.5em;
            height: 1.5em;
        }

        h5, em {
            display: inline-block;
            vertical-align: middle;
            line-height: 38px;
        }

        h2, h5 {
            font-size: clamp(1rem, 2vw, 1.5rem);
        }

        .tkt {
            max-width: 500px;
            width: 100%;
        }
    </style>

    <script src="js/bootstrap-input-spinner.js"></script>
    <div class="wrapper-con">
        <section class="special-area section_padding_100" id="about">
            <div class="container-fluid" id="exitpage">
                <div class="row">
                    <!-- Left Column -->
                    <div class="col-12 col-md-5">
                        <div class="row">
                            <div class="col-12">
                                <div class="section-heading text-center my-3">
                                    <h2>Select your Activities</h2>
                                </div>
                            </div>
                        </div>

                        <div class="login-inner-btm">
                            <!-- Header Row -->

                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">

                                    <label for="txtHr" class="form-label fw-bold">Play Time (Hours)</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtHr" value="1" min="1" max="5" type="number" class="form-control" />
                                </div>
                            </div>

                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">

                                    <label for="txtMin" class="form-label fw-bold">Minutes</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtMin" value="0" min="30" max="30" step="30" type="number" class="form-control" />
                                </div>
                            </div>

                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">

                                    <label for="txtTotalChilds" class="form-label fw-bold">Total Children</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtTotalChilds" value="1" min="1" max="50" type="number" class="form-control" />
                                </div>
                            </div>
                            <div id="playtime2" class="text-muted ms-2 mb-3">
                                * WEEKDAY (Mon-Fri) - Rs.499/90 Mins<br />
                                * WEEKEND (Sat-Sun & Public Holidays) - Rs.599/90 Mins<br />
                                * Extension Rs.199/Hour
                            </div>

                            <!-- Add-ons -->
                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">
                                    <input class="form-check-input me-1" type="checkbox" id="chkChair">
                                    <label class="form-check-label" for="chkChair">Massage chair - Rs.199  (20 minutes)</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtChair" value="1" min="1" max="50" type="number" class="form-control" />
                                </div>
                            </div>

                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">
                                    <input class="form-check-input me-1" type="checkbox" id="chkKSocks">
                                    <label class="form-check-label" for="chkKSocks">Kids Socks - Rs.50</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtKSocks" value="1" min="1" max="50" type="number" class="form-control" />
                                </div>
                            </div>

                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">
                                    <input class="form-check-input me-1" type="checkbox" id="chkASocks">
                                    <label class="form-check-label" for="chkASocks">Adult Socks - Rs.70</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtASocks" value="1" min="1" max="50" type="number" class="form-control" />
                                </div>
                            </div>

                            <div class="row align-items-center mb-2">
                                <div class="col-6 col-md-9">
                                    <input class="form-check-input me-1" type="checkbox" id="chkZip">
                                    <label class="form-check-label" for="chkZip">Zip Line - Rs.199 (4 Rounds)</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtZip" value="1" min="1" max="50" type="number" class="form-control" />
                                </div>
                            </div>

                            <div class="row align-items-center mb-3">
                                <div class="col-6 col-md-9">
                                    <input class="form-check-input me-1" type="checkbox" id="chkEntry">
                                    <label class="form-check-label" for="chkEntry">Extra Adult Entry - Rs.199</label>
                                </div>
                                <div class="col-6 col-md-3">
                                    <input id="txtEntry" value="1" min="1" max="50" type="number" class="form-control" />
                                </div>
                            </div>
                        </div>

                   

                    <!-- Right Column -->
                    <div class="col-12 col-md-5">
                        <div class="row slideInLeft animated">
                            <div class="col-12 text-center">
                                <div class="tkt mx-auto">
                                    <ul>
                                        <li class="text-left">
                                            <h2>Your Billing Details</h2>
                                        </li>
                                        <li class="bdr content-con">
                                            <ul>
                                                <li class="text-left">
                                                    <span id="idChildName" runat="server" class="d-block fs-5"></span>
                                                    <span id="idMobileNo" runat="server" class="d-block fs-5"></span>
                                                    <hr />
                                                </li>
                                                <li id="playtime4" class="text-left">
                                                    <div class="row">
                                                        <div id="divHR" class="col-9"></div>
                                                        <div id="divRs" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                                <li class="text-left">
                                                    <div class="row">
                                                        <div class="col-9">Massage chair : 20 mins</div>
                                                        <div id="divChair" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                                <li class="text-left">
                                                    <div class="row">
                                                        <div class="col-9">Kids Socks :</div>
                                                        <div id="divKSocks" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                                <li class="text-left">
                                                    <div class="row">
                                                        <div class="col-9">Adult Socks :</div>
                                                        <div id="divASocks" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                                <li class="text-left">
                                                    <div class="row">
                                                        <div class="col-9">Zip line : 3 rounds</div>
                                                        <div id="divZip" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                                <li class="text-left">
                                                    <div class="row">
                                                        <div class="col-9">Extra Entry per Adult:</div>
                                                        <div id="divEntry" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                                <li class="text-left fw-bold">
                                                    <div class="row">
                                                        <div class="col-9">Total :</div>
                                                        <div id="divTotal" class="col-3">-</div>
                                                    </div>
                                                    <hr />
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <%--      <div class="ver-btn-con mt-3 text-center">
                                    <a href="#" class="btn-green me-2" id="btnNext">Next</a>
                                     <a href="S.aspx" class="pull-left"><i class="fa fa-arrow-left"></i>&nbsp;Back</a>
                <a href="L.aspx" class="pull-right"><i class="fa fa-home"></i>&nbsp;Home</a>
                                </div>--%>

                                <div class="text-center clearfix footer-textLayer">
                                    <div class="sing-up-button d-lg-block">
                                        <a href="S.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>

                                        <a href="#" class="green-btn-btm" title="" id="btnNext">Next</a>

                                        <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Home</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <%--  <div class="text-center clearfix footer-text mt-4">
            <div class="sing-up-button d-lg-block">
                <a href="S.aspx" class="pull-left"><i class="fa fa-arrow-left"></i>&nbsp;Back</a>
                <a href="L.aspx" class="pull-right"><i class="fa fa-home"></i>&nbsp;Home</a>
            </div>
        </div>--%>
    </div>

    <!-- Your JS (same as original, not modified except formatting) -->
    <script>
        /*exit animation script start*/


        $(document).ready(function () {

            $("input[type='number']").inputSpinner();

            var TodaysRate = 499;
            var TodaysRateEntension = 199;

            function GetParameterValues(param) {
                var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < url.length; i++) {
                    var urlparam = url[i].split('=');
                    if (urlparam[0] == param) {
                        return urlparam[1];
                    }
                }
            }

            var Add = GetParameterValues('IsAdditionalService');
            if (Add != null) {
                $("#playtime0").hide();
                $("#playtime1").hide();
                $("#playtime2").hide();
                $("#playtime3").hide();
                $("#playtime4").hide();

            }

            var PlayMore = GetParameterValues('PlayMore');
            if (PlayMore == "1") {
                $("#txtHr").attr({
                    "min": 1,        // substitute your own
                    "max": 5          // values (or variables) here
                });

                $("#txtMin").attr({
                    "min": 0,        // substitute your own
                    "max": 0          // values (or variables) here
                });

            }
            var FinalTotal = 0;
            var TotalPlayTimeAmount = 0;
            var TotalPlayTimeMinutes = 0;
            var Services = '';


            var Calculate = function () {
                Services = '';



                var Total_Chair = 0;

                if ($("#chkChair").is(":checked")) {
                    Qty = Number($("#txtChair").val());
                    Total_Chair = 199 * Qty;
                    Services += '2$' + Qty + '$199,';

                }
                else {
                    Total_Chair = 0;
                    $("#txtChair").val(1);
                }

                $("#divChair").html("Rs." + Total_Chair);


                var Total_KSocks = 0;

                if ($("#chkKSocks").is(":checked")) {
                    Qty = Number($("#txtKSocks").val());
                    Total_KSocks = 50 * Qty;
                    Services += '33$' + Qty + '$50,';
                }
                else {
                    Total_KSocks = 0;
                    $("#txtKSocks").val(1);
                }

                $("#divKSocks").html("Rs." + Total_KSocks);

                var Total_ASocks = 0;

                if ($("#chkASocks").is(":checked")) {
                    Qty = Number($("#txtASocks").val());
                    Total_ASocks = 70 * Qty;
                    Services += '47$' + Qty + '$70,';
                }
                else {
                    Total_ASocks = 0;
                    $("#txtASocks").val(1);
                }

                $("#divASocks").html("Rs." + Total_ASocks);

                var Total_Zip = 0;

                if ($("#chkZip").is(":checked")) {
                    Qty = Number($("#txtZip").val());
                    Total_Zip = 199 * Qty;
                    Services += '26$' + Qty + '$199,';
                }
                else {
                    Total_Zip = 0;
                    $("#txtZip").val(1);
                }

                $("#divZip").html("Rs." + Total_Zip);

                var Total_Entry = 0;

                if ($("#chkEntry").is(":checked")) {
                    Qty = Number($("#txtEntry").val());
                    Total_Entry = 199 * Qty;
                    Services += '45$' + Qty + '$199,';
                }
                else {
                    Total_Entry = 0;
                    $("#txtEntry").val(1);
                }

                $("#divEntry").html("Rs." + Total_Entry);
                //  alert(Total_Chair + Total_Socks + Total_Zip);

                var Add = GetParameterValues('IsAdditionalService');
                if (Add == null) {

                    var HrsMsg = "Play Time : ";
                    HrsMsg += $("#txtHr").val() + " Hr(s) ";
                    HrsMsg += ($("#txtMin").val() == "0" ? "" : "and " + $("#txtMin").val() + " Minutes ");
                    HrsMsg += "for (" + $("#txtTotalChilds").val() + "X)";

                    $("#divHR").html(HrsMsg);

                    TotalPlayTimeMinutes = (Number($("#txtHr").val()) * 60) + (Number($("#txtMin").val()));
                    if (PlayMore == "0") {

                        TotalPlayTimeMinutes = (Number($("#txtHr").val()) * 60) + (Number($("#txtMin").val()));

                        //var isWeekend = ([0, 6].indexOf(new Date().getDay()) != -1);
                        //var Weekend = isWeekend ? 50 : 0;

                        //if ($("#txtHr").val() == "1") {
                        //    TotalPlayTimeAmount = 300 + Weekend;
                        //}
                        //else {

                        //    TotalPlayTimeAmount = (300 + Weekend) + ((Number($("#txtHr").val()) - 1) * 200);
                        //}

                        //if ($("#txtHr").val() == "1") {
                        //    switch ($("#txtTotalChilds").val()) {
                        //        case "1":
                        //            TodaysRate = 499;
                        //            break;
                        //        case "2":
                        //            TodaysRate = 301;
                        //            break;
                        //        case "3":
                        //            TodaysRate = 280;
                        //            break;
                        //        case "4":
                        //            TodaysRate = 263;
                        //            break;
                        //        case "5":
                        //            TodaysRate = 245;
                        //            break;
                        //        case "6":
                        //            TodaysRate = 245;
                        //            break;
                        //        case "7":
                        //            TodaysRate = 245;
                        //            break;
                        //        case "8":
                        //            TodaysRate = 245;
                        //            break;
                        //        case "9":
                        //            TodaysRate = 245;
                        //            break;
                        //        case "10":
                        //            TodaysRate = 175;
                        //            break;

                        //        default:
                        //            TodaysRate = 150;
                        //    }
                        //    TotalPlayTimeAmount = TodaysRate;
                        //}
                        //else {

                        //    TotalPlayTimeAmount = TodaysRate + ((Number($("#txtHr").val()) - 1) * 199);
                        //}

                        TotalPlayTimeAmount = TodaysRate + ((Number($("#txtHr").val()) - 1) * 199);
                    }
                    else {
                        TotalPlayTimeAmount = (Number($("#txtHr").val()) * 199);
                    }



                    //if ($("#txtMin").val() == "30") {
                    //    TotalPlayTimeAmount += TodaysRateEntension;
                    //}

                    TotalPlayTimeAmount = TotalPlayTimeAmount * Number($("#txtTotalChilds").val())

                    if (TodaysRate == 0) {
                        TotalPlayTimeAmount = 0;

                    }

                    $("#divRs").html("Rs." + TotalPlayTimeAmount);

                }
                FinalTotal = TotalPlayTimeAmount + Total_Chair + Total_KSocks + Total_ASocks + Total_Zip + Total_Entry;

                $("#divTotal").html("Rs. " + FinalTotal);

            }





            $("#btnNext").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    debugger;
                    //var strquerystring = "PlayTimeMessage=" + $("#divHR").html() + "&TotalPlayTimeMinutes=" + TotalPlayTimeMinutes + "&PlayHrsAndMinutes_Amount=" + TotalPlayTimeAmount + "&IsChair=" + ($("#chkChair").is(": checked")) + "&IsVR=" + ($("#chkSocks").is(": checked")) + "&IsZip=" + ($("#chkZip").is(": checked")) + "&Final_Total=" + FinalTotal + "&TotalNoOfChilds=" + $("#txtTotalChilds").val();
                    //window.location.href = "Pay.aspx?" + strquerystring
                    //  window.location.href = "Pay.aspx?PlayTimeMessage=" + $("#divHR").html() + "&TotalPlayTimeMinutes=" + TotalPlayTimeMinutes + "&PlayHrsAndMinutes_Amount=" + TotalPlayTimeAmount + "&IsChair=" + ($("#chkChair").is(":checked")) + "&IsVR=" + ($("#chkSocks").is(":checked")) + "&IsZip=" + ($("#chkZip").is(":checked")) + "&Final_Total=" + FinalTotal + "&TotalNoOfChilds=" + $("#txtTotalChilds").val();
                    window.location.href = "Pay.aspx?PlayTimeMessage=" + $("#divHR").html() + "&TotalPlayTimeMinutes=" + TotalPlayTimeMinutes + "&PlayHrsAndMinutes_Amount=" + TotalPlayTimeAmount + "&Services=" + Services + "&Final_Total=" + FinalTotal + "&TotalNoOfChilds=" + $("#txtTotalChilds").val();
                }, 500);
            });

            $(":input").bind('keyup change click', function (e) {

                Calculate();
            });

            $('#txtHr').bind('input', function () {
                Calculate();
            });


            $('#txtMin').bind('input', function () {
                Calculate();
            });

            $('#txtTotalChilds').bind('input', function () {
                Calculate();
            });




            $("#chkZip").click(function () {

                Calculate();
            });

            $("#chkKSocks").click(function () {

                Calculate();
            });

            $("#chkASocks").click(function () {

                Calculate();
            });

            $("#chkChair").click(function () {

                Calculate();
            });

            $("#chkEntry").click(function () {

                Calculate();
            });


            $.ajax({
                type: "POST",
                url: "W.aspx/GetRates",
                data: '{name:"abc"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    TodaysRate = Number(response.d.split(',')[0]);
                    TodaysRateEntension = Number(response.d.split(',')[1]);
                    Calculate();
                },
                failure: function (response) {
                    //  alert(response.d);

                }
            });





        });

    </script>
</asp:Content>
