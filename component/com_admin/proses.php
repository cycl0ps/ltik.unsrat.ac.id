<?php
include "../../config/koneksi.php";

//This is notif category if an notif exist
$notif_cat = "com_admin";

if ($_GET[act]=='tambah_praktikum') {
	include "../../config/library.php";
	
	$nip		= $_POST[nip];
	$kodeprak	= $_POST[kode_praktikum];
	$tahun		= $thn_sekarang;
	
	//cek apakah sudah pernah didaftarkan
	$sql  	= mysql_query("SELECT * FROM praktikum 
								WHERE kode_praktikum='$kodeprak' AND tahun_praktikum='$tahun'");
	if (mysql_num_rows($sql)!=0) {
		$notif_type = "prak_exist";
		include "../../core/notifikasi/index.php";
		die();
	}
	//cek apakah sudah mengisi NIP
	if (empty($nip)) {
		$notif_type = "belum_isi_nip";
		include "../../core/notifikasi/index.php";
		die();
	}
	
	//cek apakah dosen adalah member
	$sql  	= mysql_query("SELECT * FROM member 
								WHERE username='$nip'");
	if (mysql_num_rows($sql)==0) {
		$notif_type = "belum_member";
		include "../../core/notifikasi/index.php";
		die();
	}
	
	//cek apakah praktikum belum diisi
	if (empty($kodeprak)) {
		$notif_type = "belum_pilih_praktikum";
		include "../../core/notifikasi/index.php";
		die();
	}
	
	//Query tambah praktikum
	mysql_query("INSERT INTO praktikum(kode_praktikum, tahun_praktikum)
						VALUES ('$kodeprak', '$tahun')");
	$id_praktikum = mysql_insert_id();

	//QUery tambah dosen pada praktikum tersebut
	mysql_query("INSERT INTO dosen(nip_dosen, id_praktikum)
						VALUES ('$nip', '$id_praktikum')");
						
	mysql_query("UPDATE member SET isDosen=1 WHERE username='$nip'");	
	header('location:../../index.php?component=admin&type=tambah_praktikum');

	
}

if ($_GET[act]=='reset_password') {
	$username	= $_POST[username];
	$pass		= $_POST[pass];
	$pass		= md5($pass);
	
	mysql_query("UPDATE member set password='$pass' WHERE username='$username'");
	header('location:../../index.php?component=admin&type=reset_password&notif=true');
	
}

if ($_GET[act]=='set_theme') {
	$id = $_POST[status];
	mysql_query("UPDATE themes SET status_theme = 'deactive' WHERE status_theme = 'active'");
	mysql_query("UPDATE themes SET status_theme = 'active' WHERE id_theme = '$id'");
	header('location:../../index.php?component=admin&type=themes');
}

if ($_GET[act]=='add_theme') {
	header('location:../../index.php?component=admin&type=themes');
}



?>