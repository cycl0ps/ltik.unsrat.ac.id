<?php
include "../../config/koneksi.php";
include "../../config/library.php";

session_start();

mysql_query("UPDATE log SET logout = '$waktu_sekarang' WHERE id_log = '$_SESSION[logid]'");
session_destroy();
header('location:../login/');
?>
