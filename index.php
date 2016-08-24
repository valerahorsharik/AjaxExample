<?php $b= ["name" => 'vasya'];
$c=json_encode($b);
var_dump($c);
?>

<html>
    <head>
        <meta charset="utf-8">  
    </head>
    <body>
        <form id="hello" >
            <input type="text" name="name"><br/><br/>
            <input type="text" name="surname"><br/><br/>
            <button type="submit" >Отправить</button>
        </form>
        <div id="results"></div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="main.js"></script>
    </body>
</html>

