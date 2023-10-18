<?php

if ($notif_type == 'user_notexist'){
      echo "<h3>LOGIN GAGAL!</h3>
			<p>Username tidak terdaftar.</p>";
}

if ($notif_type == 'pass_notmatch'){
      echo "<h3>LOGIN GAGAL!</h3>
			<p>Password salah.</p>";

}
?>