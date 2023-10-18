<?php
include "../../config/library.php";
include "../../config/fungsi_combobox.php";
?>

<div class='contentHeading'>Formulir Pendaftaran Member IsLAB LTIK</div>

<form id="register_member" action="proses.php" method="post">
	<p>
		<label for='username'>Username : &nbsp;</label>
		<input type='text' name='username' id='username' size='20' />
		&nbsp;<i>Masukkan NIM atau NIP anda</i>
	</p>
	<p>
		<label for='nama'>Nama Lengkap : &nbsp;</label>
		<input type='text' name='nama' id='nama' size='52' />
	</p>
	<p>
		<label for='jenis_kelamin'>Jenis Kelamin : &nbsp;</label>
		<input type='radio' value='Laki-Laki' name='jenis_kelamin' />Laki-Laki 
		<input type='radio' value='Perempuan' name='jenis_kelamin' />Perempuan
	</p>
	<p>
		<label for='tempat_tanggal_lahir'>Tempat Tanggal Lahir : &nbsp;</label>
		<input type="text" name="tempat_lahir" size="15" />
		<?php    
			combotgl(1,31,'tanggal_lahir','Tgl');
			combobln(1,12,'bulan_lahir','Bulan');
			combotgl(1960,$thn_sekarang-10,'tahun_lahir','Tahun');
		?>
	</p>
	<p>
		<label for='alamat'>Alamat : &nbsp;</label>
		<input type='text' name='alamat' id='alamat' size='52' />
	</p>
	<p>
		<label for='no_hp'>No.HP : &nbsp;</label>
		<input type='text' name='no_hp' id='no_hp' size='15' />
	</p>
	<p>
		<label for='email'>Email : &nbsp;</label>
		<input type='text' name='email' id='email' size='30' />
	</p>
	<p>
		<label for='angkatan'>Angkatan : &nbsp;</label>
		<?php    
			combotgl($thn_sekarang-10,$thn_sekarang,'angkatan','Tahun');
		?>
	</p>
	<p>
		<label for='password'>Password : &nbsp;</label>
		<input type='password' name='password' id='password' size='15' />
		&nbsp;<i>Masukkan password anda</i>
	</p>
	<p>
		<input type='submit' name='tombol-register' value='Submit' />
	</p>
</form>

