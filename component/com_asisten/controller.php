<?php

if ($r[isAsisten]!=1) {
  echo "<b>Request denied!</b>";
  die();
}

if ($_GET[type]=='praktikum'){
	include "component/com_asisten/asisten_praktikum.php";
}

if ($_GET[type]=='kelompok'){
	include "component/com_asisten/asisten_kelompok.php";
}
	
?>