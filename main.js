$(document).ready(function(){
    $.ajax({
        type: "POST",
        url: 'data.php',
        data:{"select":"country"},
        success: function (data) {
            data = JSON.parse(data);
            for(var i in data){
                $('#country').append("<option value=\"1\">"+data[i]+"</option>\n");
            }
        }
    });
   
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
