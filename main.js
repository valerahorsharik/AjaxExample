$(document).ready(function () {
    //get all callcenters
    $.ajax({
        type: "POST",
        url: 'data.php',
        data: {"changed": "cc_callcenters",
            "download": "cc_callcenters"},
        success: function (data) {
            for (var i in data) {
                $('#cc_callcenters').append("<option value=\"" + i + "\">" + data[i] + "</option>\n");
            }
        }
    });

});
    //get list of options depends on changed value
$('#list select').on('change', function () {
    var changed = {};
    changed.id = $(this).attr('id');
    changed.value = $("#" + changed.id + " option:selected").html();
    var download = $('#list .options select#' + changed.id).closest('.options').next().find('select').attr('id');//не нравится это, хочу переделать через data-type
    if (download) {
        $.ajax({
            type: "POST",
            url: 'data.php',
            data: {"changed": changed.id,
                "changed_value": changed.value,
                "download": download},
            success: function (data) {
                console.log(data);
                $("#" + download + " option").remove();
                $("#" + download).append("<option >Please select..</option>\n");
                for (var i in data) {
                    $("#" + download).append("<option value=\"" + i + "\">" + data[i] + "</option>\n");
                }
            }
        });
    }

});
    //save selected salestatus for sale
$('#save').on('click', function () {
    var update = $('#salestatus > option:selected').html();
    $.ajax({
        type: "POST",
        url: 'data.php',
        data: {"update": update},
        success: function (data) {
           $('#result').html(data);       
        }
    });
});

