<?php
$id   = mysql_real_escape_string($_POST[username]);

include "config/library.php";
include "config/fungsi_indotgl.php";
include "config/fungsi_combobox.php";

if (empty($id)) {
  echo "<b>Request denied!</b>";
  die();
}

$sql  = mysql_query("SELECT * FROM member WHERE username='$id'");
$r    = mysql_fetch_array($sql);

if ($_GET[form]=='editprofile') {
	echo "<div class='contentHeading'>Edit Data Personal</div>
		<form id='edit_profile' action='component/com_member/proses.php?form=editprofile' method='post'>
		<input name='id' type='hidden' value='$id'>
		<p>
			<label for='username'>Username</label>: &nbsp;<b>$r[username]</b>
		</p>
		<p>
			<label for='nama'>Nama Lengkap</label>: &nbsp;
			<input type='text' name='nama' id='nama' size='52' value='$r[nama]' />
		</p>
		<p>
			<label for='jenis_kelamin'>Jenis Kelamin</label>: &nbsp;
			<input type='radio' value='Laki-Laki' name='jenis_kelamin'";
                      if ($r[jenis_kelamin]=='Laki-Laki') {
                        echo "checked";}echo ">Laki-Laki 
                    <input type='radio' value='Perempuan' name='jenis_kelamin'";
                      if ($r[jenis_kelamin]=='Perempuan') {
                        echo "checked";}echo ">Perempuan 
		</p>
		<p>
			<label for='tempat_tanggal_lahir'>Tempat Tanggal Lahir</label>: &nbsp;
			<input type='text' name='tempat_lahir' size='15' value='$r[tempat_lahir]' />&nbsp;";
				combotgl2(1,31,'tanggal_lahir',gettgl($r[tanggal_lahir]));
				combobln2(1,12,'bulan_lahir',getbln($r[tanggal_lahir]));
				combotgl2(1960,$thn_sekarang-10,'tahun_lahir',getthn($r[tanggal_lahir]));
	echo "</p>
		<p>
			<label for='alamat'>Alamat</label>: &nbsp;
			<input type='text' name='alamat' id='alamat' size='52' value='$r[alamat]' />
		</p>
		<p>
			<label for='no_hp'>No.HP</label>: &nbsp;
			<input type='text' name='no_hp' id='no_hp' size='15' value='$r[no_hp]' />
		</p>
		<p>
			<label for='email'>Email</label>: &nbsp;
			<input type='text' name='email' id='email' size='30' value='$r[email]' />
		</p>
		<p>
			<label for='angkatan'>Angkatan</label>: &nbsp;";
				combotgl2($thn_sekarang-10,$thn_sekarang,'angkatan','$r[angkatan]');
	echo "</p>
		<p>
			<input type='submit' name='tombol-update' value='Update' />
		</p>
		</form>";
}

elseif ($_GET[form]=='editpassword') {
	echo "<div class='contentHeading'>Ganti Password</div>
		<form id='edit_password' action='component/com_member/proses.php?form=editpassword' method='post'>
		<input name='id' type='hidden' value='$id'>
		<p>
			<label for='password'>Password Lama : &nbsp;</label>
			<input type='password' name='pass_lama' id='password' size='15' />
		</p>
		<p>
			<label for='password'>Password Baru : &nbsp;</label>
			<input type='password' name='pass_baru' id='password' size='15' />
		<p>
			<input type='submit' name='tombol-update' value='Update' />
		</p>";
}

elseif ($_GET[form]=='editfotoprofil') {
  echo "<div class='contentHeading'>Update Foto Profil</div>
		<form id='update_foto' action='component/com_member/proses.php?form=editfotoprofile' method='post' enctype='multipart/form-data'>
		<input name='id' type='hidden' value='$id'>";

		if (!empty($r[foto])) {
			echo "<img src='media/foto_profil/$r[foto]'>";
		} else {
			echo "<img src='media/foto_profil/anon.jpg'>";
		}
    echo "<br />
		<p><input type='file' name='fupload' size='40'></p>
		<p><input type='submit' value='Upload' name='submit'></p>
		<p>Tipe file yang diperbolehkan adalah JPG/JPEG. Best resolution at 300 pixels width</p>
		</form>";
}
?>