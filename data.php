<?php
$country=["Ru","Ua","Us","Fr"];
if (isset($_POST['select']) && $_POST['select']=="country"){
   echo json_encode($country);
}
//$city = ["Moskow","kiev","washington"];

