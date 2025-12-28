<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PackagesBuy.aspx.cs" Inherits="TG.PackagesBuy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">
    <div class="wrapper-con">


      <!-- ***** Start ***** -->
        <section class="cd-intro slideInLeft animated" id="exitpage">
            <div class="cd-intro-content mask">
                <h1><span>Your Selected Package</span></h1>
                
                <div class="avatar-con">
                    <h3>Silver Package</h3>
                    <div class="row">
                        <div class="col-lg-4 col-sm-4">
                            <div class="custom-control custom-radio">
                              <input type="radio" checked id="customRadio1" name="customRadio" class="custom-control-input">
                              <label class="custom-control-label" for="customRadio1">5000Rs</label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-4">
                           <div class="custom-control custom-radio">
                              <input type="radio"  id="customRadio2" name="customRadio" class="custom-control-input">
                              <label class="custom-control-label" for="customRadio2">20Hrs PlayTime</label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-4">
                          <div class="custom-control custom-radio">
                              <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
                              <label class="custom-control-label" for="customRadio3">30 Days Validity</label>
                            </div>
                        </div>
                       
                    </div>                   
                </div>
                
                <div class="action-wrapper">
                    <a href="#" class="cd-btn" id="yes">
                        Pay Here
                    </a>
                    <a href="#" class="cd-btn" id="no">
                        Pay at Counter
                    </a>
                </div>
            </div>
        </section>
        <!-- ***** End ***** -->   

        <!-- ***** Footer Area Start ***** -->
        <div class="text-center clearfix footer-text">
            <div class="sing-up-button d-lg-block">
                <a href="Language.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a>

                <a href="Language.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
            </div>
        </div>
        <!-- ***** Footer Area Start ***** -->


    </div>
   
     <script>
         /*exit animation script start*/
         $(document).ready(function () {
             $("#pkg1").click(function () {
                 $("#exitpage").addClass("animated slideOutRight");
                 setTimeout(function () {
                     window.location.href = "InputKeyboardMob.aspx";
                 }, 500);
             });

             $("#NewCust").click(function () {
                 $("#exitpage").addClass("animated slideOutRight");
                 setTimeout(function () {
                     window.location.href = "InputKeyboardMob.aspx";
                 }, 500);
             });


         });
        </script >

</asp:Content>
