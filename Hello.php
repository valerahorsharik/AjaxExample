<?php

$a[0]=$_POST['name'];
$a[1]=$_POST['surname'];
$b = json_encode($a);
echo $b;

