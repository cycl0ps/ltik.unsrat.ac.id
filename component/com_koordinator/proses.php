<?php

include "../../config/koneksi.php";

$id_praktikum	= $_POST[id_praktikum];
$id				= $_POST[id];
$nim			= $_POST[nim];

//This is notif category if an notif exist
$notif_cat = "com_koordinator";

//menambah asisten dari praktikum
if ($_GET[act]=='tambah_asisten') {

	//Cek apakah sudah menjadi member
	$sql1	= mysql_query("SELECT * FROM member WHERE username='$nim'");
	$q1		= mysql_num_rows($sql1);

	if ($q1 != 0) {

		// Apabila sudah pernah didaftarkan sebelumnya
		$sql2	= mysql_query("SELECT * FROM asisten 
						WHERE nim_asisten='$nim' AND id_praktikum='$id_praktikum'");
		$q2		= mysql_num_rows($sql2);

		if ($q2 != 0) {
			$notif_type = "already_asisten";
			include "../../core/notifikasi/index.php";
			die();
		} else {
			mysql_query("INSERT INTO asisten(nim_asisten, id_praktikum)
							VALUES ('$nim', '$id_praktikum')");
			mysql_query("UPDATE member SET isAsisten=1 WHERE username='$nim'");							
			header("location:../../index.php?component=koordinator&type=asisten&id_praktikum=$id_praktikum");
		}
	} else {
		$notif_type = "belum_member";
		include "../../core/notifikasi/index.php";
		die();
	}
}

//menghapus asisten dari praktikum
if ($_GET[act]=='hapus_asisten') {

	mysql_query("DELETE FROM asisten WHERE id_asisten='$id'");
	mysql_query("UPDATE member SET isAsisten=0 WHERE nim='$nim'");
	
	//query apakah masih asisten di praktikum lain?
	
	$sql = mysql_query("SELECT * FROM asisten WHERE nim_asisten='$nim'");
	$cek = mysql_num_rows($sql);
	
	if ($cek != 0) {
		mysql_query("UPDATE member SET isAsisten=1 WHERE nim='$nim'");
	}
	
	header("location:../../index.php?component=koordinator&type=asisten&id_praktikum=$id_praktikum");
	
}

//menghapus praktikan dari praktikum
if ($_GET[act]=='hapus_praktikan') {

	mysql_query("DELETE FROM praktikan 
					WHERE id_praktikum='$id_praktikum' AND id_praktikan='$id'");
	mysql_query("UPDATE member SET isPraktikan=0 WHERE username='$nim'");
	
	//query apakah masih praktikan di praktikum lain?
	
	$sql = mysql_query("SELECT * FROM praktikan WHERE nim_praktikan='$nim'");
	$cek = mysql_num_rows($sql);
	
	if ($cek != 0) {
		mysql_query("UPDATE member SET isPraktikan=1 WHERE username='$nim'");
	}
	
	header("location:../../index.php?component=koordinator&type=praktikan&id_praktikum=$id_praktikum");
	
}

//menambah kelompok praktikum
if ($_GET[act]=='tambah_kelompok') {

	$sql = mysql_query("SELECT max(nama_kelompok) FROM kelompok_praktikum 
							WHERE id_praktikum='$id_praktikum'");
	$kelompok = mysql_result($sql,0);
	
	if ($kelompok == NULL) {
		mysql_query("INSERT INTO kelompok_praktikum(id_praktikum, nama_kelompok) VALUES ('$id_praktikum', '1')");
	} else {
		$kelompok++;
		mysql_query("INSERT INTO kelompok_praktikum(id_praktikum, nama_kelompok) VALUES ('$id_praktikum', '$kelompok')");
	}
	
	header("location:../../index.php?component=koordinator&type=kelompok&id_praktikum=$id_praktikum");

}

//menambah praktikan pada kelompok praktikum tertentu
if ($_GET[act]=='tambah_praktikan_kelompok') {

	$kel = $_POST[kelompok];
	//Cek apakah sudah mendaftar praktikum
	$sql1	= mysql_query("SELECT * FROM praktikan 
								WHERE nim_praktikan='$nim' AND id_praktikum='$id_praktikum'");
	$q1		= mysql_num_rows($sql1);

	if ($q1 != 0) {
		mysql_query("UPDATE praktikan SET kelompok_praktikum='$kel' 
						WHERE nim_praktikan='$nim' AND id_praktikum='$id_praktikum'");						
		header("location:../../index.php?component=koordinator&type=detail_kelompok&id_praktikum=$id_praktikum&kel=$kel");
	
	} else {
		$notif_type = "belum_registrasi_praktikum";
		include "../../core/notifikasi/index.php";
		die();
	}
	
}

//update asisten pada kelompok praktikum tertentu
if ($_GET[act]=='update_asisten_kelompok') {

	$kel = $_POST[kelompok];
	//Cek apakah sudah menjadi asisten
	$sql1	= mysql_query("SELECT * FROM asisten 
								WHERE nim_asisten='$nim' AND id_praktikum='$id_praktikum'");
	$q1		= mysql_num_rows($sql1);

	if ($q1 != 0) {
		mysql_query("UPDATE kelompok_praktikum SET nim_asisten='$nim' 
						WHERE nama_kelompok='$kel' AND id_praktikum='$id_praktikum'");						
		header("location:../../index.php?component=koordinator&type=detail_kelompok&id_praktikum=$id_praktikum&kel=$kel");
	
	} else {
		$notif_type = "belum_asisten_praktikum";
		include "../../core/notifikasi/index.php";
		die();
	}
	
}

//download data praktikan
if ($_GET[act]=='download_praktikan_xls') {
	
	//query praktikum
	$sql 	= mysql_query("SELECT * FROM praktikum WHERE id_praktikum ='$id_praktikum'");
	$r    	= mysql_fetch_array($sql);
	
	$namafile 	= 'praktikan_'.$r[kode_praktikum].'_'.$r[tahun_praktikum].'.xls';
	
	//query data
	$q		= "SELECT nama,nim_praktikan,kelompok_praktikum FROM praktikan 
					LEFT JOIN member ON nim_praktikan = username
					WHERE id_praktikum ='$id_praktikum'
					ORDER BY nim_praktikan ASC";
	$query = mysql_query($q);
	$res .= "no\t";

	while ($f = mysql_fetch_field($query)) {
		$res .= $f->name . "\t";
	}
	$res .= "\r\n";
	$count = 1;
	while ($r = mysql_fetch_array($query)) {
		$res .= $count."\t";
		for ($i=0; $i<mysql_num_fields($query); $i++) {
			$res .= $r[$i] . "\t";
		}
		$res .= "\r\n";
		$count++;
	}

	mysql_free_result($query);
	header("Content-disposition: attachment; filename=$namafile");
	header("Content-type: Application/exe");
	header("Content-Transfer-Encoding: binary");
	echo $res;
}

//download data asisten
if ($_GET[act]=='download_asisten_xls') {
	
	//query praktikum
	$sql 	= mysql_query("SELECT * FROM praktikum WHERE id_praktikum ='$id_praktikum'");
	$r    	= mysql_fetch_array($sql);
	
	$namafile 	= 'asisten_'.$r[kode_praktikum].'_'.$r[tahun_praktikum].'.xls';
	
	//query data
	$q		= "SELECT nama,nim_asisten,angkatan FROM asisten 
					LEFT JOIN member ON nim_asisten = username
					WHERE id_praktikum ='$id_praktikum'
					ORDER BY nim_asisten, angkatan ASC";
	$query = mysql_query($q);
	$res .= "no\t";

	while ($f = mysql_fetch_field($query)) {
		$res .= $f->name . "\t";
	}
	$res .= "\r\n";
	$count = 1;
	while ($r = mysql_fetch_array($query)) {
		$res .= $count."\t";
		for ($i=0; $i<mysql_num_fields($query); $i++) {
			$res .= $r[$i] . "\t";
		}
		$res .= "\r\n";
		$count++;
	}

	mysql_free_result($query);
	header("Content-disposition: attachment; filename=$namafile");
	header("Content-type: Application/exe");
	header("Content-Transfer-Encoding: binary");
	echo $res;
}

?>