$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: 'data.php',
        data: {"changed": "cc_callcenters",
            "download": "cc_callcenters"},
        success: function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#cc_callcenters').append("<option value=\"" + i + "\">" + data[i] + "</option>\n");
            }
        }
    });

});
$('#list select').on('change', function () {
    var changed = {};
    changed.id = $(this).attr('id');
    changed.value = $("#"+changed.id + " option:selected").html();
    //console.log(changed.value);
    var download = $('#list .options select#' + changed).closest('.options').next().find('select').attr('id');
    if (download) {
        $.ajax({
            type: "POST",
            url: 'data.php',
            data: {"changed": changed.id,
                "changed_value":changed.value,
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
