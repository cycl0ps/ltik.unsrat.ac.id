<?php

if ($notif_cat == 'register') {
	include "notif_regis.php";
}

if ($notif_cat == 'login') {
	include "notif_login.php";
} 

if ($notif_cat == 'com_member') {
	include "notif_member.php";
} 

if ($notif_cat == 'com_praktikan') {
	include "notif_praktikan.php";
}

if ($notif_cat == 'com_asisten') {
	include "notif_asisten.php";
} 

if ($notif_cat == 'com_koordinator') {
	include "notif_koord.php";
} 

if ($notif_cat == 'com_dosen') {
	include "notif_dosen.php";
} 
if ($notif_cat == 'com_admin') {
	include "notif_admin.php";
} 

echo "<a href=javascript:history.back()>back</a></div>";
?>