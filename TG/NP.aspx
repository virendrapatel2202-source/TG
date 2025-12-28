<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="NP.aspx.cs" Inherits="TG.Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">
    <style>
        .strikethrough {
  position: relative;
}
.strikethrough:before {
  position: absolute;
  content: "";
  left: 0;
  top: 50%;
  right: 0;
  border-top: 1px solid;
  border-color: inherit;
  
  -webkit-transform:rotate(-15deg);
  -moz-transform:rotate(-15deg);
  -ms-transform:rotate(-15deg);
  -o-transform:rotate(-15deg);
  transform:rotate(-15deg);
}
    </style>
    <div class="wrapper-con">


        <!-- ***** Start ***** -->
        <section class="special-area section_padding_100" id="about">
            <div class="container-fluid" id="exitpage">
                <div class="row">
                    <div class="col-12">
                        <!-- Section Heading Area -->
                        <div class="section-heading text-center">
                            <h2>Please select Membership Package</h2>
                        </div>
                    </div>
                </div>

                <div class="slideInLeft animated">
                    <div class="col-md-12 text-center">
                        <div  class="horiz-btn-con">
                            <ul>
                                <li><a href="#" class="btn-green" title="" id="pkg1"><span class="bg-danger"> ₹ 2000 </span>   <span class="strikethrough" style="background-color:purple"> ₹ 2500 </span>   <br /> 8 Hours Play Time <br /> 1 Month Validity </a></li>
                                 <li><a href="#" class="btn-green" title="" id="pkg2"><span class="bg-danger"> ₹ 3500 </span>   <span class="strikethrough" style="background-color:purple"> ₹ 4700 </span>   <br /> 15 Hours Play Time <br /> 2 Month Validity </a></li>
                                <li><a href="#" class="btn-green" title="" id="pkg3"><span class="bg-danger"> ₹ 4500 </span>   <span class="strikethrough" style="background-color:purple"> ₹ 7800 </span>   <br /> 25 Hours Play Time <br /> 3 Month Validity </a></li>

                                <li><a href="#" class="btn-green" title="" id="pkg4"><span class="bg-danger"> ₹ 7500 </span>   <span class="strikethrough" style="background-color:purple"> ₹ 15700 </span>   <br /> 50 Hours Play Time <br /> 6 Months Validity <br /> 5% Discount on Birthday Package <br /> 5% Discount on Cafe Bills </a></li>
                                <li><a href="#" class="btn-green" title="" id="pkg5"><span class="bg-danger"> ₹ 9000 </span>   <span class="strikethrough" style="background-color:purple"> ₹ 23500 </span>   <br /> 75 Hours Play Time <br /> 8 Months Validity <br /> 7% Discount on Birthday Package <br /> 7% Discount on Cafe Bills </a></li>
                                <li><a href="#" class="btn-green" title="" id="pkg6"><span class="bg-danger"> ₹ 16000 </span>   <span class="strikethrough" style="background-color:purple"> ₹ 47000 </span>   <br /> 150 Hours Play Time <br /> 15 Months Validity <br /> 10% Discount on Birthday Package <br /> 10% Discount on Cafe Bills </a></li>

                                 
                            </ul>
                        </div>
                    </div>
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
