<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="L.aspx.cs" Inherits="TG.Language" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp" runat="server">

    <%--<style>
        a.disabled {
  pointer-events: none;
  cursor: default;
}
    </style>--%>
    <!-- ***** Start ***** -->
    <section class="cd-intro slideInLeft animated" id="exitpage">
        <div class="cd-intro-content mask">
            <h1>Please select language </h1>
          <%--  <h1>कृपया पसंतीची भाषा निवडा </h1>
            <h1 class="mb-4">कृपया पसंदीदा भाषा चुनें </h1>--%>
            <div class="action-wrapper">
                <a href="#" class="cd-btn exit">English
                </a>
              <%--  <a href="#" class="cd-btn arabic-font exit disabled" aria-disabled="true">मराठी
                </a>
                <a href="#" class="cd-btn arabic-font exit disabled" aria-disabled="true">हिंदी
                </a>--%>
            </div>
        </div>
    </section>
    <!-- ***** End ***** -->

    <script>
          /*exit animation script start*/
        $(document).ready(function () {
            $(".exit").click(function () {
                $("#exitpage").addClass("animated slideOutRight");
                setTimeout(function () {
                    window.location.href = "M.aspx";
                }, 500);
            });
        });
        /*exit animation script end*/

        //setTimeout(function () {

        //    $.ajax({
        //        type: "POST",
        //        url: "http://40.117.187.220/WebApi/Test",
        //        data: '',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: OnSuccess,
        //        failure: function (response) {
        //             alert(response.d);
        //        }
        //    });

        //}, 3 * 1000);

        //function OnSuccess(response) {
        //     alert(response.d);
        //}

    </script>

</asp:Content>
