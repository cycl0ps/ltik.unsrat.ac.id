<?php
include "../../config/koneksi.php";
include "../../config/library.php";

$pass		= md5($_POST[password]);
$username	= $_POST[username];

//This is notif category if notification exist
$notif_cat = "login";

$login	= mysql_query("SELECT * FROM member WHERE username='$username'");
$ketemu	= mysql_num_rows($login);
$r		= mysql_fetch_array($login);

// Apabila username ditemukan
if ($ketemu > 0) {
  if($r[password] == $pass){
    session_register("username");
	session_register("password");
	session_register("nama");
	session_register("logid");

    $_SESSION[username] = $r[username];
	$_SESSION[password] = $r[password];
	$_SESSION[nama]   	= $r[nama];
	
	mysql_query("INSERT INTO log (username, login)  
					VALUES ('$_SESSION[username]', '$waktu_sekarang')");
					
	$_SESSION[logid]   	= mysql_insert_id();
	
	   
    //sent to home
	header('location:../../index.php?component=home');
	
  } else {
	$notif_type = "pass_notmatch";
	include "../notifikasi/index.php";
  }
} else {
	$notif_type = "user_notexist";
	include "../notifikasi/index.php";
}
?>