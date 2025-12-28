<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="S.aspx.cs" Inherits="TG.Services1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">
    <div class="wrapper-con">


        <!-- ***** Start ***** -->
        <section class="special-area section_padding_100" id="about">
            <div class="container-fluid" id="exitpage">
                <div class="row">
                    <div class="col-12">
                        <!-- Section Heading Area -->
                        <div class="section-heading text-center">
                            <h2>Please select preferred option</h2>
                        </div>
                    </div>
                </div>

                <div class="slideInLeft animated">
                    <div class="col-md-12 text-center">
                        <div class="ver-btn-con">
                            <ul>
                                <li><a href="#" class="btn-green bg-danger" title="" runat="server" visible="false" id="member"></a></li>
                                <li><a href="#" class="btn-green" title="" runat="server" id="PlayNow">Play Now</a></li>
                                <%--  <li><a href="#" class="btn-green bg-danger" title="" runat="server" visible="false" id="checkout">Check Out</a></li>--%>
                                <li><a href="#" class="btn-green" title="" id="PlayNowAdd">Other Activities</a></li>
                                <%--  <li><a href="#" class="btn-green" title="" id="PlayNowPack">Play Now (Package Members)</a></li>
                                <li><a href="#" class="btn-green" title="" id="NewPack">Buy New Package</a></li>--%>
                                <li><a href="#" class="btn-green" title="" id="Food">Food</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- ***** Footer Area Start ***** -->
                    <div class="text-center clearfix footer-textLayer">
                        <div class="sing-up-button d-lg-block">
                            <a href="M.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back</a>

                            <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                        </div>
                    </div>
                    <!-- ***** Footer Area Start ***** -->
                </div>
            </div>
        </section>
        <!-- ***** End ***** -->

        <%--  <!-- ***** Footer Area Start ***** -->
        <div class="text-center clearfix footer-text">
            <div class="sing-up-button d-lg-block">
                <a href="M.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a>

                <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
            </div>
        </div>
        <!-- ***** Footer Area Start ***** -->--%>
    </div>
    <script>
        /*exit animation script start*/
        $(document).ready(function () {
            $("#cp_PlayNow").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    if ($("#cp_PlayNow").text() == "Play More") {
                        window.location.href = "W.aspx?PlayMore=1";
                    }
                    else {
                        window.location.href = "W.aspx?PlayMore=0";
                    }

                }, 500);
            });

            $("#cp_member").click(function () {

                
                if ($("#cp_member").hasClass("bg-danger")) {
                    // do stuff
                }
                else {
                    $("#exitpage").addClass("animated slideOutRight");
                    setTimeout(function () {
                        window.location.href = "W.aspx?PlayMore=1&IsMember=1";
                    }, 500);
                }
            });


            $("#PlayNowAdd").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "W.aspx?IsAdditionalService=1";
                }, 500);
            });

            $("#NewPack").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "Packages.aspx";
                }, 500);
            });

            $("#Food").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "FD.aspx";
                }, 500);
            });



        });
    </script>
</asp:Content>
