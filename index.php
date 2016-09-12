<?php
$country=["Ru","Ua","Us","Fr"];
echo json_encode($country);
?>
<html>
    <head>
        <meta charset="utf-8">  
    </head>
    <body>
        <div class="options">Call centr: 
            <select id="country">
            </select>
        </div>
        <div class="options">Call centr: 
            <select id="city">
            </select>
        </div>
        <div class="options">Call centr: 
            <select>
                <option value="1">KievExpert</option>
                <option value="1">ZaporozhyeExpert</option>
            </select>
        </div>
        <div class="options">Call centr: 
            <select>
                <option value="1">KievExpert</option>
                <option value="1">ZaporozhyeExpert</option>
            </select>
        </div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="main.js"></script>
    </body>
</html>

