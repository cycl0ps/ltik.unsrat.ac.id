 <?php
include("../../config/koneksi.php");
include("../../config/library.php");

$username 		= $_POST['username'];
$nama 			= $_POST['nama'];
$jenis_kelamin 	= $_POST['jenis_kelamin'];
$tempat_lahir 	= $_POST['tempat_lahir'];
$tanggal_lahir 	= $_POST['tanggal_lahir'];
$bulan_lahir 	= $_POST['bulan_lahir'];
$tahun_lahir 	= $_POST['tahun_lahir'];
$alamat 		= $_POST['alamat'];
$no_hp 			= $_POST['no_hp'];
$email 			= $_POST['email'];
$angkatan 		= $_POST['angkatan'];
$password 		= $_POST['password'];

//This is notif category if notification exist
$notif_cat = "register";

// cek kalo ada username yang sama
$check = "SELECT username FROM member WHERE username = '$username';";
$qry = mysql_query($check) or die ("Could not match data because ".mysql_notif());
$num_rows = mysql_num_rows($qry);
if ($num_rows != 0) {
	$notif_type = "us_ex";
	include "../notifikasi/index.php";
	die();
}

else if (!eregi($nim_exp,$username)) {
	$notif_type = "us_na";
	include "../notifikasi/index.php";
	die();
}

else if (empty($nama)) {
	$notif_type = "name_na";
	include "../notifikasi/index.php";
	die();
}

else if (empty($jenis_kelamin)) {
	$notif_type = "jk_na";
	include "../notifikasi/index.php";
	die();
}

else if (empty($tempat_lahir)) {
	$notif_type = "tmptlh_na";
	include "../notifikasi/index.php";
	die();
}
		
else if (empty($tanggal_lahir)) {
	$notif_type = "tgl_na";
	include "../notifikasi/index.php";
	die();
}
		
else if (empty($bulan_lahir)) {
	$notif_type = "bln_na";
	include "../notifikasi/index.php";
	die();
}
		
else if (empty($tahun_lahir)) {
	$notif_type = "thn_na";
	include "../notifikasi/index.php";
	die();
}
		
else if (empty($alamat)) {
	$notif_type = "al_na";
	include "../notifikasi/index.php";
	die();
}
		
else if (!eregi($nim_exp,$no_hp)) {
	$notif_type = "hp_er";
	include "../notifikasi/index.php";
	die();
}
		
else if (!eregi($email_exp,$email)) {
	$notif_type = "em_er";
	include "../notifikasi/index.php";
	die();
}
		
else if (empty($angkatan)) {
	$notif_type = "ang_na";
	include "../notifikasi/index.php";
	die();
}
		
else if (empty($password)) {
	$notif_type = "pass_na";
	include "../notifikasi/index.php";
	die();
}

else {
	$password = md5($password);
	// masukkan data kedatabase
	mysql_query("INSERT INTO member(nama, username, angkatan, tempat_lahir, tanggal_lahir, jenis_kelamin,
											alamat, no_hp, email, tgl_daftar, tgl_update, password)
							VALUES ('$nama', '$username', '$angkatan', '$tempat_lahir',
										'$tahun_lahir-$bulan_lahir-$tanggal_lahir','$jenis_kelamin', 
										'$alamat', '$no_hp', '$email', '$tgl_sekarang', '$waktu_sekarang', '$password')");

	// tampilkan kalo sukses
	include "../../config/koneksi.php";
	$theme = mysql_query("SELECT path_theme FROM themes WHERE status_theme = 'active'");
	$t = mysql_fetch_array($theme);

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Sukses - LTIK Teknik Informatika Unsrat</title>
		<link href="../../<?php echo "$t[path_theme]" ?>/css/style.css" rel="stylesheet" type="text/css">
		<link href="../../<?php echo "$t[path_theme]" ?>/bicon.ico" rel="shortcut icon" type="image/x-icon">
	</head>
	<body>
		<div id="header"></div>
		<div id="successBox">
			<div class='contentHeading'>Formulir Pendaftaran Member IsLAB LTIK</div>
				Terima kasih <?php echo $nama ?>, <br>akun anda pada LabIS LTIK telah berhasil dibuat<br><br>
				Sekarang anda bisa <a href=../login/>Login</a>
		</div>
	</body>
</html>

<?php } ?>