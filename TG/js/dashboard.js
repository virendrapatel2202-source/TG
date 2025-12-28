function GetCounters() {
    var LocationID = 1;
    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/GetCounters",
        data: "{ LocationID: " + LocationID + " }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            CounterData = eval(result.d);
            if (CounterData.length > 0) {
                var Html = '<table id="CounterList" class="table table-striped table-bordered table-hover" width="100%"><thead><tr>' +
                    '<th width="10%" class="Edit" style="text-align: center">Edit</th>' +
                    '<th data-class="expand" width="15%">TokenNumber</th>' +
                    '<th data-class="expand" width="30%">MobileNo</th>' +
                    '<th data-class="expand" width="20%">CustomerName</th>' +
                    '<th width="5%" class="Release" style="text-align: center">ChildName</th>' +
                     '<th width="5%" class="Active" style="text-align: center">IsCheckOut</th>' +
                    '</tr ></thead ></table >';
                $('#CounterDiv').empty();
                $('#CounterDiv').append(Html);
       }
           
            $('#loadingCounters').css('visibility', 'hidden');

        },
        error: function (e) {
            console.log(e);
        }


    });
}