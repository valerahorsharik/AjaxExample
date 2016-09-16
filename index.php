<?php
$host = "localhost";
$dbname = "ajax_test";
$user = "root";
$pass = "";
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
if ($db) {
    echo "all is ok";
}
$query_result = $db->query('SELECT cc_desks.* '
        . 'FROM cc_desks '
        . 'LEFT JOIN cc_callcenters '
        . 'ON cc_desks.id_callcenter = cc_callcenters.id '
        . 'WHERE cc_callcenters.id = 1');
var_dump($query_result);
if ($query_result) {
    $results = array();
    foreach ($query_result->fetchAll() as $row_number => $row) {
        var_dump($row_number);
        echo "<br/>";
         var_dump($row);
         echo "<hr/>";
       // $results[] = $row['name'];
    }

    $db = NULL;
    echo json_encode($results);
} else {
    echo "\nPDO::errorInfo():\n";
    print_r($db->errorInfo());
}
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
        </div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="main.js"></script>
    </body>
</html>

