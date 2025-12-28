<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="M.aspx.cs" Inherits="TG.InputKeyboardMob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">

    <div class="wrapper-con">
        <!-- ***** Header Area Start ***** -->

        <!-- ***** Header Area End ***** -->


        <!-- ***** Start ***** -->
        <section class="special-area section_padding_100" id="about">
            <div class="container-fluid" id="exitpage">
                <div class="row slideInLeft animated">
                    <div class="col-md-12 text-center">
                        <!-- Section Heading Area -->
                        <div class="section-heading text-center">
                            <h2>Enter your Mobile Number</h2>
                        </div>
                        <div>
                            <div class="keypad">
                                <input id="txtMob" maxlength="10" class="keyboard" type="text" placeholder="" />
                                <p id="pvalid" class="error"></p>
                            </div>
                            <div id="keyboard" class="num-keypad margin-bottom-20"></div>
                        </div>



                    </div>
                    <div class="text-center clearfix footer-textLayer">
                        <div class="sing-up-button d-lg-block">
                            <a href="L.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>

                            <a href="#" class="green-btn-btm" title="" id="continue">Continue</a>

                            <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Home</a>
                        </div>
                    </div>
                  
                </div>
            </div>
        </section>
        <!-- ***** End ***** -->


        <!-- ***** Footer Area Start ***** -->
        <%-- <div class="text-center clearfix footer-text">
            <div class="sing-up-button d-lg-block">
                <a href="L.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>

                <a href="#" class="green-btn-btm" title="" id="continue">Continue</a>

                <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Home</a>
            </div>
        </div>--%>
        <!-- ***** Footer Area Start ***** -->
    </div>

    <script>
        /*exit animation script start*/
        $(document).ready(function () {


            (function ($) {
                $.fn.preventKeyboard = function () {
                    return this
                        .filter('input')
                        .on('focus', function () {
                            $(this)
                                .attr('readonly', 'readonly')
                                .blur()
                                .removeAttr('readonly');
                        });
                };
            }(jQuery));

            $('#txtMob').preventKeyboard();


            $("#continue").click(function () {

                if (!validatePhone('txtMob')) {

                    $('#pvalid').html('Please enter valid Mobile Number');
                    return;
                }

                $('#loading').show();

                $.ajax({
                    type: "POST",
                    url: "M.aspx/GetData",
                    data: '{mobileno:"' + $('#txtMob').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        $("#exitpage").addClass("animated slideOutRight");
                        setTimeout(function () {
                            // window.location.href = "P.aspx?MobileNo=" + $("#txtMob").val();
                            window.location.href = response.d == true ? "S.aspx" : "P.aspx";
                        }, 500);
                    },
                    failure: function (response) {

                        //  alert(response.d);

                    }
                });

            });
        });
        /*exit animation script end*/

        /*kepad script start*/
        $('#keyboard').jkeyboard({
            layout: "numbers_only",
            input: $('#txtMob')
        });
        $('#txtMob').on("click", function () {
            $('#keyboard').jkeyboard({
                layout: "numbers_only",
                input: $('#txtMob')
            });
            $('#keyboard').show();
        });
        /*kepad script end*/

        function validatePhone(txtMob) {
            var a = document.getElementById(txtMob).value;
            var filter = /[1-9]{1}[0-9]{9}/;
            if (filter.test(a)) {
                return true;
            }
            else {
                return false;
            }
        }



        /*language list menu start*/
        function DropDown(el) {
            this.dd = el;
            this.placeholder = this.dd.children('span');
            this.opts = this.dd.find('ul.dropdown > li');
            this.val = '';
            this.index = -1;
            this.initEvents();
        }
        DropDown.prototype = {
            initEvents: function () {
                var obj = this;

                obj.dd.on('click', function (event) {
                    $(this).toggleClass('active');
                    return false;
                });

                obj.opts.on('click', function () {
                    var opt = $(this);
                    obj.val = opt.text();
                    obj.index = opt.index();
                    obj.placeholder.text('Language - ' + obj.val);
                });
            },
            getValue: function () {
                return this.val;
            },
            getIndex: function () {
                return this.index;
            }
        }

        $(function () {

            var dd = new DropDown($('#dd'));

            $(document).click(function () {
                // all dropdowns
                $('.wrapper-dropdown-1').removeClass('active');
            });

        });
        /*language list menu end*/

        /*keypad cancel btn script*/
        $('.clear').click(function () {
            $(".keyboard").val("")
        });
        /*keypad cancel btn script end*/

    </script>

</asp:Content>
