<?php

include "../../config/koneksi.php";

$id_praktikum	= $_POST[id_praktikum];
$id				= $_POST[id];
$kel			= $_GET[kel];


//This is error category if an error exist
$error_cat = "com_asisten";

//menghapus praktikan dari kelompok praktikum
if ($_GET[act]=='hapus_praktikan') {

	mysql_query("UPDATE praktikan SET kelompok_praktikum=null 
					WHERE id_praktikan='$id' AND id_praktikum='$id_praktikum'");
	
	header("location:../../index.php?component=asisten&type=kelompok&id_praktikum=$id_praktikum&kel=$kel");
	
}

?>