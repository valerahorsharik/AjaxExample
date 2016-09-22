<?php

session_start();
$host = "localhost";
$dbname = "ajax_test";
$user = "root";
$pass = "";
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
//$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
if (!$db) {
    die("Something happened");
}
//echo "\nPDO::errorInfo():\n";
// print_r($db->errorInfo());
/*
 * check if request is Ajax
 */
if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    if (isset($_POST['changed'])) {
        /*
         * select call_centers
         */
        if ($_POST['changed'] == "cc_callcenters" && $_POST['download'] == "cc_callcenters") {

            $query_result = $db->query('SELECT * FROM cc_callcenters');
            $query_result = $query_result->fetchAll();
            $results = array();
            foreach ($query_result as $row) {
                $results[] = $row['name'];
            }

            $db = NULL;
            echo json_encode($results);
        }
        /*
         * select desks 
         * by call_center name
         */
        if ($_POST['changed'] == "cc_callcenters" && $_POST['download'] == "cc_desks") {
            $query_result = $db->query('SELECT cc_desks.desk_name '
                    . 'FROM cc_desks '
                    . 'LEFT JOIN cc_callcenters '
                    . 'ON cc_desks.id_callcenter = cc_callcenters.id '
                    . 'WHERE cc_callcenters.name = "' . $_POST['changed_value'] . '"');
            $query_result = $query_result->fetchAll();
            $results = array();
            foreach ($query_result as $row) {
                $results[] = $row['desk_name'];
            }

            $db = NULL;
            echo json_encode($results);
        }
        /*
         * select teams 
         * by desk name
         */
        if ($_POST['changed'] == "cc_desks" && $_POST['download'] == "cc_teams") {
            $query_result = $db->query('SELECT cc_teams.team_name '
                    . 'FROM cc_teams '
                    . 'LEFT JOIN cc_desks '
                    . 'ON cc_teams.id_desk = cc_desks.id '
                    . 'WHERE cc_desks.desk_name = "' . $_POST['changed_value'] . '"');
            $query_result = $query_result->fetchAll();
            $results = array();
            foreach ($query_result as $row) {
                $results[] = $row['team_name'];
            }

            $db = NULL;
            echo json_encode($results);
        }
        /*
         * select user 
         * by team name
         */
        if ($_POST['changed'] == "cc_teams" && $_POST['download'] == "cc_users") {
            $query_result = $db->query('SELECT cc_users.stage_name '
                    . 'FROM cc_users '
                    . 'LEFT JOIN cc_teams '
                    . 'ON cc_users.team_id = cc_teams.id '
                    . 'WHERE cc_teams.team_name = "' . $_POST['changed_value'] . '"');
            $query_result = $query_result->fetchAll();
            $results = array();
            foreach ($query_result as $row) {
                $results[] = $row['stage_name'];
            }

            $db = NULL;
            echo json_encode($results);
        }
        /*
         * select salestatus for all users
         */
        if ($_POST['changed'] == "cc_users" && $_POST['download'] == "salestatus") {
            $query_result = $db->query('SELECT salestatus.nameStatus '
                    . 'FROM salestatus '
            );
            $_SESSION['saleName'] = $_POST['changed_value'];
            $query_result = $query_result->fetchAll();
            $results = array();
            foreach ($query_result as $row) {
                $results[] = $row['nameStatus'];
            }
            $db = NULL;
            echo json_encode($results);
        }
    }
    /*
     * update user_type_id 
     * by stage_name 
     * in cc_users
     */
    if (isset($_POST['update'])) {
        $query_result = $db->query('SELECT id '
                . 'FROM salestatus '
                . 'WHERE nameStatus = "' . $_POST['update'] . '"');
        $id = $query_result->fetchColumn();
        $saleName = $_SESSION['saleName'];
        $query = "UPDATE `cc_users`   
                SET `user_type_id` = ?
                WHERE `stage_name` = ?";
        $query_result = $db->prepare($query);
        if ($query_result->execute([$id, $saleName])) {
            $result = 'Success';
        } else {
            $result = 'Something going wrong...';
        }
        $db = NULL;
        echo $result;
    }
}


