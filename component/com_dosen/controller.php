<?php

if ($r[isDosen]!=1) {
  echo "<b>Request denied!</b>";
  die();
}

if ($_GET[type]=='data_praktikum'){
	include "component/com_dosen/dosen_data_prak.php";
}


?>