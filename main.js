$('#hello').submit(function () {
    var result = $(this).serialize();
    $.ajax({
        type: "POST",
        url: 'hello.php',
        data: result,
        success: function (html) {
            console.log(html);
        }
    });
    alert(result);
    return false;
});
