<?php

$conn = @mysqli_connect("localhost", "root", "", "konyvbolt");
/*if($conn){
    echo "kapcsolat rendben";
}else{
    echo "error";
}*/
@mysqli_query($conn, "SET NAMES utf8");

