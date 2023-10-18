<?php

include "../../config/koneksi.php";

$id_praktikum	= $_POST[id_praktikum];
$id 			= $_POST[id_koordinator];
$nim			= $_POST[nim];

//This is notif category if an notif exist
$notif_cat = "com_dosen";

//menambah koordinator dari praktikum
if ($_GET[act]=='tambah_koordinator') {

	if (empty($nim)) {
		$notif_type = "belum_isi_nim";
		include "../../core/notifikasi/index.php";
		die();
	}

	//Cek apakah sudah menjadi member
	$sql1	= mysql_query("SELECT * FROM member WHERE username='$nim'");
	$q1		= mysql_num_rows($sql1);

	if ($q1 != 0) {
		// Apabila sudah pernah didaftarkan sebelumnya
		$sql2	= mysql_query("SELECT * FROM koordinator 
						WHERE nim_koordinator='$nim' AND id_praktikum='$id_praktikum'");
		$q2		= mysql_num_rows($sql2);

		if ($q2 != 0) {
			$notif_type = "already_koordinator";
			include "../../core/notifikasi/index.php";
			die();
		} else {
			mysql_query("INSERT INTO koordinator(nim_koordinator, id_praktikum)
							VALUES ('$nim', '$id_praktikum')");
			mysql_query("UPDATE member SET isKoordinator=1 WHERE username='$nim'");							
			header("location:../../index.php?component=dosen&type=data_praktikum&id_praktikum=$id_praktikum");
		}
	} else {
		$notif_type = "belum_member";
		include "../../core/notifikasi/index.php";
		die();
	}
}

//menghapus koordinator dari praktikum
if ($_GET[act]=='hapus_koordinator') {

	mysql_query("DELETE FROM koordinator WHERE id_koordinator='$id'");
	mysql_query("UPDATE member SET isKoordinator=0 WHERE username='$nim'");
	
	//query apakah masih asisten di praktikum lain?
	
	$sql = mysql_query("SELECT * FROM koordinator WHERE nim_koordinator='$nim'");
	$cek = mysql_num_rows($sql);
	
	if ($cek != 0) {
		mysql_query("UPDATE member SET iskoordinator=1 WHERE username='$nim'");
	}
	
	header("location:../../index.php?component=dosen&type=data_praktikum&id_praktikum=$id_praktikum");
}

?>