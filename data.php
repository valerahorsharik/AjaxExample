<?php
$host = "localhost";
$dbname = "ajax_test";
$user = "root";
$pass = "";
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
if (!$db) {
    die("Something happened");
}
if (isset($_POST['changed'])) {
    if ($_POST['changed'] == "cc_callcenters" && $_POST['download'] == "cc_callcenters") {
        $query_result = $db->query('SELECT * FROM cc_callcenters');
        foreach ($query_result->fetchAll() as $row_number => $row) {
            $results[] = $row['name'];
        }
        
        $db = NULL;
        echo json_encode($results);
    }

    if ($_POST['changed'] == "cc_callcenters" && $_POST['download'] == "cc_desks") {
        $query_result = $db->query('SELECT * '
                . 'FROM cc_desks'
                . 'LEFT JOIN cc_callcenters'
                . 'ON cc_desks.id_callcenter = cc_callcenters.id'
                . 'WHERE cc_callcenters.name = '.$_POST['changed_value']);
        foreach ($query_result->fetchAll() as $row_number => $row) {
            $results[] = $row['name'];
        }
        
        $db = NULL;
        echo json_encode($results);
    }
    if ($_POST['changed'] == "cc_desks" && $_POST['download'] == "cc_teams") {
       $query_result = $db->query('SELECT * FROM cc_callcenters');
        foreach ($query_result->fetchAll() as $row_number => $row) {
            $results[] = $row['name'];
        }
   
        $db = NULL;
        echo json_encode($results);
    }
    if ($_POST['changed'] == "cc_teams" && $_POST['download'] == "cc_users") {
        $query_result = $db->query('SELECT * FROM cc_callcenters');
        foreach ($query_result->fetchAll() as $row_number => $row) {
            $results[] = $row['name'];
        }
   
        $db = NULL;
        echo json_encode($results);
    }
    if ($_POST['changed'] == "cc_users" && $_POST['download'] == "salestatus") {
        echo json_encode($house);
    }
}

