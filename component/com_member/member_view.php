<?php
include "config/library.php";
include "config/fungsi_indotgl.php";

echo "<div class='contentHeading'>Profil Member</div>";

//query data member
$id		= $_GET[id];
$sql  	= mysql_query("SELECT * FROM member WHERE username='$id'");
$r    	= mysql_fetch_array($sql);
$bday 	= tgl_indo($r[tanggal_lahir]);

echo "<table><tr><td valign='top'>
		<table>
          <tr><td>Nama Lengkap</td><td>: $r[nama]</td></tr>
		  <tr><td>Username</td><td>: $r[username]</td></tr>
		  <tr><td>Angkatan</td><td>: $r[angkatan]</td></tr>
		  <tr><td>Tempat Tanggal Lahir</td><td>: $r[tempat_lahir], $bday</td></tr>
		  <tr><td>Jenis Kelamin</td><td>: $r[jenis_kelamin]</td></tr>
          <tr><td>Alamat</td><td>: $r[alamat]</td></tr>
          <tr><td>No HP</td><td>: $r[no_hp]</td></tr>
          <tr><td>Email</td><td>: $r[email]</td></tr>
		  <tr><td>Level Akses</td><td><ul>
			<li>Member</li>";
			if ($r[isPraktikan]==1) {echo "<li>Praktikan</li>";}
			if ($r[isAsisten]==1) {echo "<li>Asisten</li>";}
			if ($r[isKoordinator]==1) {echo "<li>Koordinator Asisten</li>";}
			if ($r[isAdmin]==1) {echo "<li>Administrator</li>";}
echo "</table></td><td valign='top'>";

if (!empty($r[foto])) {
		echo "<img src='media/foto_profil/$r[foto]'>";
	} else {
        echo "<img src='media/foto_profil/anon.jpg'>";
    }
	
echo "<br />";

//Cek akses level untuk menampilkan link edit
if ($_SESSION[username] == $id) {
	echo "
		<form name='datapersonal' method='POST' action='index.php?component=member&act=edit&form=editprofile'>
			<input name='username' type='hidden' value='$id'></input></form>
		<form name='passwordlogin' method='POST' action='index.php?component=member&act=edit&form=editpassword'>
			<input name='username' type='hidden' value='$id'></input></form>
		<form name='fotoprofil' method='POST' action='index.php?component=member&act=edit&form=editfotoprofil'>
			<input name='username' type='hidden' value='$id'></input></form>
                
		<p><a href='javascript:document.datapersonal.submit();'>Edit Data Personal</a></p>
		<p><a href='javascript:document.passwordlogin.submit();'>Ganti Password</a></p>
		<p><a href='javascript:document.fotoprofil.submit();'>Ganti Foto Profil</a></p>";
}
	
echo "</td></tr></table>";
echo "<br><a href=javascript:history.back()>[kembali]</a>";
	  
?>