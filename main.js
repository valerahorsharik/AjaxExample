$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: 'data.php',
        data: {"changed": "country",
            "download": "country"},
        success: function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#country').append("<option value=\"" + i + "\">" + data[i] + "</option>\n");
            }
        }
    });

});
$('#list select').on('change', function () {
    var changed = $(this).attr('id');
    var download = $('#list .options select#' + changed).closest('.options').next().find('select').attr('id');
    if (download) {
        $.ajax({
            type: "POST",
            url: 'data.php',
            data: {"changed": changed,
                "download": download},
            success: function (data) {
                console.log(download + " = " + data);
                $("#" + download + " option").remove();
                data = JSON.parse(data);
                for (var i in data) {
                    $("#" + download).append("<option value=\""+i+"\">" + data[i] + "</option>\n");
                }
            }
        });
    }

});
//$('#hello').on('submit',function () {
//    var FormData = {
//        "name":$('#name').val(),
//        "surname":$('#surname').val()
//    };
//    
//    $.ajax({
//        type: "POST",
//        url: 'hello.php',
//        data: {
//        name:$('#name').val(),
//        surname:$('#surname').val()
//    },
//        success: function (data) {
//            data = JSON.parse(data);
//            for(var i in data){
//                $('#results').append(data[i]);
//            }
//        }
//    });
//    console.log(FormData);
//    return false;
//});
