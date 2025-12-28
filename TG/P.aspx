<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="P.aspx.cs" Inherits="TG.P" %>

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
                            <h2>Enter Parent Name</h2>
                        </div>
                        <div>
                            <div class="keypad">
                                <asp:TextBox ID="txtName" runat="server" class="keyboard" type="text" placeholder="" />
                                <p id="pvalid" class="error"></p>
                            </div>
                            <div id="keyboard" class="num-keypad margin-bottom-20"></div>
                        </div>
                    </div>
                </div>

                <div class="text-center clearfix textLayer">
                    <div class="sing-up-button d-lg-block">
                        <a href="M.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>

                        <a href="#" class="green-btn-btm" title="" id="continue">Continue</a>

                        <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Home</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** End ***** -->


        <!-- ***** Footer Area Start ***** -->
        <%--   <div class="text-center clearfix footer-text">
            <div class="sing-up-button d-lg-block">
                <a href="M.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>

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

            $("input[id*='txtName']").preventKeyboard();

            $("#continue").click(function () {


                if (!validateName()) {

                    $('#pvalid').html('Parent Name is required');
                    return;
                }

                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "N.aspx?Name=" + $("input[id*='txtName']").val();
                }, 500);
            });
        });
        /*exit animation script end*/

        /*kepad script start*/
        $('#keyboard').jkeyboard({
            layout: "english",
            input: $("input[id*='txtName']")
        });


        $("input[id*='txtName']").on("click", function () {
            $('#keyboard').jkeyboard({
                layout: "english",
                input: $("input[id*='txtName']")
            });
            $('#keyboard').show();
        });
        /*kepad script end*/



        function validateName() {
            var a = $("input[id*='txtName']").val();
            var filter = /^[A-Za-z\s]+$/;
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
