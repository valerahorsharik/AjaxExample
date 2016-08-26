$('#hello').submit(function () {
    var FormData = {
        "name":$('#name').val(),
        "surname":$('#surname').val()
    };
    
    $.ajax({
        type: "POST",
        url: 'hello.php',
        data: {
        name:$('#name').val(),
        surname:$('#surname').val()
    },
        success: function (data) {
            data = JSON.parse(data);
            for(var i in data){
                $('#results').append(data[i]);
            }
        }
    });
    console.log(FormData);
    return false;
});
