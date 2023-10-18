<?php

echo "<div class='contentHeading'>Reset Password Member</div>";

//tampilkan notifikasi
if(!empty($_GET[notif])) {
	echo "<div class='notifBox'>Berhasil!</div>";
}

//form reset password
echo "<form method=POST action=component/com_admin/proses.php?act=reset_password>
		<p>
			<label for='username'>Username : &nbsp;</label>
			<input type='text' name='username' id='username' size='18' />
		</p>
		<p>
			<label for='password'>Password Baru : &nbsp;</label>
			<input type='password' name='pass' id='password' size='18' />
		<p>
			<input type='submit' name='tombol-reset' value='Ganti Password' />
		</p>";

echo "<br /><p><a href=javascript:history.back()>[kembali]</a></p>";

?>