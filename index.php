<?php
error_reporting(-1) ; // включить все виды ошибок, включая  E_STRICT
ini_set('display_errors', 'On');  // вывести на экран помимо логов
?>
<html>
    <head>
        <meta charset="utf-8">  
    </head>
    <body>
        <div id="list">
            <div class="options">Call center:
                <select id="cc_callcenters"> 
                    <option>Please select...</option>
                </select>
            </div>
            <div class="options">Desk:
                <select id="cc_desks">
                    <option>Please select...</option>
                </select>
            </div>
            <div class="options">Team:
                <select id="cc_teams">
                    <option>Please select...</option>
                </select>
            </div>
            <div class="options">Sales: 
                <select id="cc_users">
                    <option>Please select...</option>
                </select>
            </div>
            <div class="options">Lead status: 
                <select id="salestatus">
                    <option>Please select...</option>
                </select>
            </div>
            <button id="save">Save</button>
            <div id="result"></div>
        </div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="main.js"></script>
    </body>
</html>
