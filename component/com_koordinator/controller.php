<?php

if ($r[isKoordinator]!=1) {
  echo "<b>Request denied!</b>";
  die();
}

if ($_GET[type]=='asisten'){
	include "component/com_koordinator/koord_asisten.php";
}

if ($_GET[type]=='kelompok'){
	include "component/com_koordinator/koord_kelompok.php";
}

if ($_GET[type]=='detail_kelompok'){
	include "component/com_koordinator/detail_kelompok.php";
}

if ($_GET[type]=='praktikum'){
	include "component/com_koordinator/koord_praktikum.php";
}

if ($_GET[type]=='praktikan'){
	include "component/com_koordinator/koord_praktikan.php";
}

?>