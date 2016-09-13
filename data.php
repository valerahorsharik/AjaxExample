<?php

$country = ["Ru", "Ua", "Us", "Fr"];
$city = ["Moskow", "kiev", "washington"];
$street = ["Pobedi","lenina"];
$house = ["1","2","123"];
if (isset($_POST['changed'])) {
    if ($_POST['changed'] == "country" && $_POST['download'] == "country") {
        echo json_encode($country);
    }
    
    if ($_POST['changed'] == "country" && $_POST['download'] == "city") {
        echo json_encode($city);
    }
    if ($_POST['changed'] == "city" && $_POST['download'] == "street") {
        echo json_encode($street);
    }
    if ($_POST['changed'] == "street" && $_POST['download'] == "house") {
        echo json_encode($house);
    }
}

