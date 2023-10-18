<?php
include "../../config/koneksi.php";
include "../../config/library.php";

$username 	= mysql_real_escape_string($_POST['id']);

//This is notif category if an notif exist
$notif_cat = "com_member";

if ($_GET[form]=='editprofile') {

	$nama 			= mysql_real_escape_string($_POST['nama']);
	$jenis_kelamin 	= mysql_real_escape_string($_POST['jenis_kelamin']);
	$tempat_lahir 	= mysql_real_escape_string($_POST['tempat_lahir']);
	$tanggal_lahir 	= mysql_real_escape_string($_POST['tanggal_lahir']);
	$bulan_lahir 	= mysql_real_escape_string($_POST['bulan_lahir']);
	$tahun_lahir 	= mysql_real_escape_string($_POST['tahun_lahir']);
	$alamat 		= mysql_real_escape_string($_POST['alamat']);
	$no_hp 			= mysql_real_escape_string($_POST['no_hp']);
	$email 			= mysql_real_escape_string($_POST['email']);
	$angkatan 		= mysql_real_escape_string($_POST['angkatan']);
	  
	// validation required field
	if (empty($nama)) {
		$notif_type = "name_na";
		include "../../core/notifikasi/index.php";
		die();
	}

	else if (empty($jenis_kelamin)) {
		$notif_type = "jk_na";
		include "../../core/notifikasi/index.php";
		die();
	}

	else if (empty($tempat_lahir)) {
		$notif_type = "tmptlh_na";
		include "../../core/notifikasi/index.php";
		die();
	}
		
	else if (empty($tanggal_lahir)) {
		$notif_type = "tgl_na";
		include "../../core/notifikasi/index.php";
		die();
	}
		
	else if (empty($bulan_lahir)) {
		$notif_type = "bln_na";
		include "../../core/notifikasi/index.php";
		die();
}
		
	else if (empty($tahun_lahir)) {
		$notif_type = "thn_na";
		include "../../core/notifikasi/index.php";
		die();
}
		
	else if (empty($alamat)) {
		$notif_type = "al_na";
		include "../../core/notifikasi/index.php";
		die();
	}
		
	else if (!eregi($nim_exp,$no_hp)) {
		$notif_type = "hp_er";
		include "../../core/notifikasi/index.php";
		die();
	}
		
	else if (!eregi($email_exp,$email)) {
		$notif_type = "em_er";
		include "../../core/notifikasi/index.php";
		die();
	}
		
	else if (empty($angkatan)) {
		$notif_type = "ang_na";
		include "../../core/notifikasi/index.php";
		die();
	}
		
	else {
		//Update database
		mysql_query("UPDATE member SET 	nama			= '$nama',
										angkatan		= '$angkatan',
										tempat_lahir    = '$tempat_lahir',
										tanggal_lahir   = '$tahun_lahir-$bulan_lahir-$tanggal_lahir',
										jenis_kelamin   = '$jenis_kelamin',
										no_hp           = '$no_hp',
										email           = '$email',
										alamat          = '$alamat'
								   WHERE username = '$username'");				
		mysql_query("UPDATE member SET tgl_update = '$waktu_sekarang' WHERE username = '$username'");								

		// tampilkan kalo sukses
		header("location:../../index.php?component=member&act=view&id=$username");
	}
}

if ($_GET[form]=='editpassword') {
	$pass1 	= mysql_real_escape_string($_POST['pass_lama']);
	$pass2	= mysql_real_escape_string($_POST['pass_baru']);
	$pass1	= md5($pass1);
	
	// cek kalo ada password lama sama dengan current password
	$sql  	= mysql_query("SELECT password FROM member WHERE username = '$username'");
	$r    	= mysql_fetch_array($sql);
	
	if ($r[password] != $pass1) {
		$notif_type = "pass_er";
		include "../../core/notifikasi/index.php";
		die();
	}
	else if(empty($pass2)){
        $notif_type = "passb_er";
		include "../../core/notifikasi/index.php";
		die();
	}
	else {
		$pass2 = md5($pass2);
		//Update database
		mysql_query("UPDATE member SET 	password = '$pass2' WHERE username = '$username'");
		mysql_query("UPDATE member SET tgl_update = '$waktu_sekarang' WHERE username = '$username'");	
										
		// tampilkan kalo sukses
		header("location:../../index.php?component=member&act=view&id=$username");
	}
}

if ($_GET[form]=='editfotoprofile') {
	$file_tmp       = mysql_real_escape_string($_FILES['fupload']['tmp_name']);
	$tipe_file      = mysql_real_escape_string($_FILES['fupload']['type']);
	$nama_file      = mysql_real_escape_string($_FILES['fupload']['name']);
	$getExt         = explode ('.', $nama_file);
	$file_ext       = $getExt[count($getExt)-1];
	$nama_file_baru = $username.'.'.$file_ext;
	
	if (!empty($file_tmp)){
		// Apabila tipe gambar bukan jpeg akan tampil peringatan
		if ($tipe_file != "image/jpeg" AND $tipe_file != "image/pjpeg"){
			$notif_type = "not_image";
			include "../../core/notifikasi/index.php";
			die();  		  
		} else {
			include "../../config/image_resize.php";
			mysql_query("UPDATE member SET foto = '$nama_file_baru' WHERE username = '$username'");
			mysql_query("UPDATE member SET tgl_update = '$waktu_sekarang' WHERE username = '$username'");
			// tampilkan kalo sukses
			header("location:../../index.php?component=member&act=view&id=$username");
		}
	} else {
		$notif_type = "image_na";
		include "../../core/notifikasi/index.php";
		die(); 
	}
}

if ($_GET[form]=='regis_praktikum') {
	$kode 	= $_POST['kode_praktikum'];
	
	//Cek apakah sudah terdaftar praktikum di tahun ini
	$sql  	= mysql_query("SELECT * FROM praktikan WHERE nim_praktikan='$username' AND id_praktikum='$kode'");

	if (mysql_num_rows($sql)!=0) {
		$notif_type = "already_regis";
		include "../../core/notifikasi/index.php";
		die();
	} else if (empty($kode)) {
		$notif_type = "praktikum_na";
		include "../../core/notifikasi/index.php";
		die();
	} else {
		mysql_query("INSERT INTO praktikan(nim_praktikan, id_praktikum)
					VALUES ('$username', '$kode')");
		mysql_query("UPDATE member SET isPraktikan=1 WHERE username='$username'");
		header('location:../../index.php?component=praktikan&type=praktikum');
	}
}
?>
