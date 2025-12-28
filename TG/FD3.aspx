<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FD3.aspx.cs" Inherits="TG.FD3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/kitfont.js"></script>
    <script src="js/bootstrap-input-spinner.js"></script>
     <style>
        .footer-text {
            position: relative;
        }

        ul.ks-cboxtags {
            list-style: none;
            padding: 20px;
            /*  max-height: 400px;*/
            /*  overflow:scroll;*/
            -webkit-overflow-scrolling: touch;
        }

            ul.ks-cboxtags li {
                display: inline;
            }

                ul.ks-cboxtags li label {
                    display: inline-block;
                    background-color: rgba(255, 255, 255, .9);
                    border: 2px solid rgba(139, 139, 139, .3);
                    /*   color: #adadad;*/
                    border-radius: 25px;
                    white-space: nowrap;
                    margin: 3px 0px;
                    -webkit-touch-callout: none;
                    -webkit-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    user-select: none;
                    -webkit-tap-highlight-color: transparent;
                    transition: all .2s;
                }

                ul.ks-cboxtags li label {
                    padding: 8px 12px;
                    cursor: pointer;
                }

                    ul.ks-cboxtags li label::before {
                        display: inline-block;
                        font-style: normal;
                        font-variant: normal;
                        text-rendering: auto;
                        -webkit-font-smoothing: antialiased;
                        font-family: "Font Awesome 5 Free";
                        font-weight: 900;
                        font-size: 12px;
                        padding: 2px 6px 2px 2px;
                        content: "\f067";
                        transition: transform .3s ease-in-out;
                    }

                ul.ks-cboxtags li input[type="checkbox"]:checked + label::before {
                    content: "\f00c";
                    transform: rotate(-360deg);
                    transition: transform .3s ease-in-out;
                }

                ul.ks-cboxtags li input[type="checkbox"]:checked + label {
                    border: 2px solid #1bdbf8;
                    background-color: #12bbd4;
                    color: #fff;
                    transition: all .2s;
                }
                /*
ul.ks-cboxtags li input[type="checkbox"] {
  display: absolute;
}*/
                ul.ks-cboxtags li input[type="checkbox"] {
                    /* position: absolute;*/
                    opacity: 0;
                }

                    ul.ks-cboxtags li input[type="checkbox"]:focus + label {
                        border: 2px solid #e9a1ff;
                    }
    </style>
     <script>
        /*exit animation script start */
        $(document).ready(function () {

            //test
            //$('img').each(function () {

            //    $(this).attr('src', '#');

            //});


            var Calculate = function () {
                FinalTotal = 0;
                Services = '';

                $('#selective input:checkbox').each(function () {

                    txtSpinnerName = $('#' + this.id.replace('chk-', 'txt-'));
                    if (this.checked == true) {

                        var ServiceID = $(this).attr('ServiceID');
                        var Amount = $(this).attr('Amount');


                        //  FinalTotal += (Number(this.value) * Number($('#' + this.id.replace('chk-', 'txt-')).val()));
                        Qty = Number(txtSpinnerName.val());
                        // Amount = Number(this.value);
                        Amount = Number(Amount);
                        FinalTotal += Amount * Qty;
                        // Services += this.id.replace('chk-', '') + '$' + Qty + '$' + Amount + ",";
                        Services += ServiceID + '$' + Qty + '$' + Amount + ",";
                        //  FinalTotal += (Number(this.value));

                    }
                    else {

                        //  $('#' + this.id.replace('chk-', 'txt-')).val(1);
                        txtSpinnerName.val(1);

                        //$('#' + this.id.replace('chk-', 'txt-'))
                        //$(".spinner").spinner("destroy").prop('disabled', true);
                    }


                    //   var sThisVal = (this.checked ? $(this).val() : "");
                });



                $("#continue").html('Continue (Rs ' + FinalTotal + ')');
            }



            $("#PlayNow").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "W.aspx";
                }, 500);
            });

            $("#continue").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    Calculate();
                    window.location.href = "Pay.aspx?Food=1&Services=" + Services + "&Final_Total=" + FinalTotal;
                }, 500);
            });


            //test

            $("input[type='number']").inputSpinner();

            $('input[id^="chk-"]').click(function () {

                Calculate();

            });


            $(":input").bind('keyup change click', function (e) {

                Calculate();
            });

           // return;

            $.ajax({
                type: "POST",
                url: "FD.aspx/GetFoodItems",
                data: '{name:"abc"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    
                    var html = '';
                    if (response.d.length > 0) {
                        $.each(response.d, function (i, key) {

                           
                            if (i%2 == 0) {
                                html += '<li><div class="row">';
                            }
                            
                           // html +='<div class="col-sm"><input type="checkbox" ServiceID="' + key.ServiceID + '"  Amount="' + key.Amount + '"  id="chk-' + key.ServiceID + '" value="' + key.ServiceID + '"><label for="chk-' + key.ServiceID + '">' + key.ServiceDesc + ' - Rs. ' + key.Amount + '</label></div><div class="col-sm"><input id="txt-' + key.ServiceID + '" value="1"  min="1" max="50" type="number" /></div>';
                            html += '<div class="col-sm"><input type="checkbox" ServiceID="' + key.ServiceID + '"  Amount="' + key.Amount + '"  id="chk-' + key.ServiceID + '" value="' + key.ServiceID + '"><label for="chk-' + key.ServiceID + '">' + key.ServiceDesc + ' - Rs. ' + key.Amount + '</label></div><div class="col-sm"><input id="txt-' + key.ServiceID + '" value="1"  min="1" max="50" type="number" /></div>';

                            if (i % 2 == 1) { 
                                html += '</div></li>';
                                $("#selective").append(html);
                                html = '';
                            }
                            

                           
                            //$("#selective").append('<li><div class="row"><div class="col-sm"><input type="checkbox" ServiceID="' + key.ServiceID + '"  Amount="' + key.Amount + '"  id="chk-' + key.ServiceID + '" value="' + key.ServiceID + '"><label for="chk-' + key.ServiceID + '">' + key.ServiceDesc + ' - Rs. ' + key.Amount + '</label></div><div class="col-sm"><input id="txt-' + key.ServiceID + '" value="1"  min="1" max="50" type="number" /></div></div></li>');
                        });
                    }

                    $("input[type='number']").inputSpinner();

                    $('input[id^="chk-"]').click(function () {

                        Calculate();

                    });


                    $(":input").bind('keyup change click', function (e) {

                        Calculate();
                    });

                    //if (response.d.length > 0) {
                    //    $.each(response.d, function (i, key) {
                    //        $("#selective").append(
                    //            '<li><div class="row"><div class="col-sm"><input type="checkbox" id="chk-25" value="50"><label for="chk-25">Coffee - Rs.50 </label></div><div class="col-sm"><input id="txt-25" value="1"  min="1" max="50" type="number" /></div></div></li>';
                    //    });
                    //}

                    //var htm = '';

                    //htm += '<li><div class="row"><div class="col-sm"><input type="checkbox" id="chk-25" value="50"><label for="chk-25">Coffee - Rs.50 </label></div><div class="col-sm"><input id="txt-25" value="1"  min="1" max="50" type="number" /></div></div></li>'

                    //$("#dialog").html("");
                    //$("#dialog").html(html);
                },
                failure: function (response) {
                    //  alert(response.d);

                }
            });


        });
     </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper-con">



        <!-- ***** Start ***** -->
        <section class="special-area section_padding_100" id="about">
            <div class="container-fluid" id="exitpage">
                

                <div class="slideInLeft animated">
                    <div class="col-md-12 text-center">
                        <div class="horiz-btn-con">

                            <ul id="selective" class="ks-cboxtags">

                              <%--  <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-3" value="90"><label for="chk-3">Regular French Fries - Rs.90 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-3" value="1" min="1" max="50" type="number" />
                                        </div>

                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-4" value="120"><label for="chk-4">Periperi French Fries - Rs.120 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-4" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-5" value="100"><label for="chk-5">Regular Garlic Bread - Rs.100 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-5" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-6" value="120"><label for="chk-6">Cheese Garlic Bread - Rs.120 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-6" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-7" value="150"><label for="chk-7">Margherita Pizza - Rs.150 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-7" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-8" value="180"><label for="chk-8">Garden Fresh Pizza - Rs.180 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-8" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-9" value="210"><label for="chk-9">Veg Paneer Pizza - Rs.210 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-9" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-10" value="150"><label for="chk-10">Red Sauce Pasta - Rs.150 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-10" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-11" value="170"><label for="chk-11">White Sauce Pasta - Rs.170 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-11" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-12" value="180"><label for="chk-12">Pesto Pasta - Rs.180 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-12" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-13" value="150"><label for="chk-13">Veg Hakka Noodles - Rs.150 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-13" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-14" value="120"><label for="chk-14">Corn Cheese Sandwich - Rs.120 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-14" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-15" value="155"><label for="chk-15">Veg Club Sandwich - Rs.155 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-15" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-16" value="160"><label for="chk-16">Pesto Sandwich - Rs.160 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-16" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-17" value="150"><label for="chk-17">Veg Cheese Burger - Rs.150 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-17" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-18" value="70"><label for="chk-18">Magic Masala Maggi - Rs.70 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-18" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-19" value="80"><label for="chk-19">Butter Masala Maggi - Rs.80 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-19" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-20" value="90"><label for="chk-20">Cheese Maggi - Rs.90 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-20" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-21" value="140"><label for="chk-21">Strawberry Milkshake - Rs.140 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-21" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-22" value="140"><label for="chk-22">Chocolate Milkshake - Rs.140 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-22" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-23" value="150"><label for="chk-23">Oreo Milkshake - Rs.150 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-23" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-24" value="35"><label for="chk-24">Tea - Rs.35 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-24" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-sm">
                                            <input type="checkbox" id="chk-25" value="50"><label for="chk-25">Coffee - Rs.50 </label>
                                        </div>
                                        <div class="col-sm">
                                            <input id="txt-25" value="1" min="1" max="50" type="number" />
                                        </div>
                                    </div>
                                </li>--%>

                            </ul>

                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- ***** End ***** -->

        <!-- ***** Footer Area Start ***** -->
        <div class="text-center clearfix   footer-textLayer">
            <div class="sing-up-button d-lg-block">
                <a href="S.aspx" class="pull-left"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a>
                <a href="#" class="green-btn-btm" title="" id="continue">Continue</a>

                <a href="L.aspx" class="pull-right"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Home</a>
            </div>
        </div>
        <!-- ***** Footer Area Start ***** -->


    </div>
    </form>
</body>
</html>
