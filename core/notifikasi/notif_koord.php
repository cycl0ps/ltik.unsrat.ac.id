<?php

if ($notif_type == 'already_asisten'){
      echo "<h3>MAAF!</h3>
			<p>NIM $nim sudah terdaftar sebagai asisten untuk praktikum ini.</p>";
}

if ($notif_type == 'belum_member'){
      echo "<h3>MAAF!</h3>
			<p>NIM $nim belum terdaftar sebagai member LabIS LTIK Unsrat<p>
			<p>Untuk menjadi Asisten Praktikum, sebelumnya harus mendaftar sebagai member LabIS LTIK Unsrat</p>";

}

if ($notif_type == 'belum_registrasi_praktikum'){
      echo "<h3>MAAF!</h3>
			<p>NIM $nim belum terdaftar sebagai praktikan pada praktikum ini</p>";

}

if ($notif_type == 'belum_asisten_praktikum'){
      echo "<h3>MAAF!</h3>
			<p>NIM $nim belum terdaftar sebagai asisten pada praktikum ini.</p>";

}
?>