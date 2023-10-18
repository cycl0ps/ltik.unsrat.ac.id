<?php

if ($notif_type == 'name_na'){
      echo "<h3>MAAF!</h3>
			<p>Nama tidak boleh kosong.</p>";
}

if ($notif_type == 'tmptlh_na'){
      echo "<h3>MAAF!</h3>
			<p>Tempat lahir tidak boleh kosong.</p>";
}

if ($notif_type == 'al_na'){
      echo "<h3>MAAF!</h3>
			<p>Alamat tidak boleh kosong.</p>";
}

if ($notif_type == 'hp_er'){
      echo "<h3>MAAF!</h3>
			<p>No HP belum diisi atau tidak valid.</p>";
}

if ($notif_type == 'em_er'){
      echo "<h3>MAAF!</h3>
			<p>Email belum diisi atau tidak valid.</p>";
}

if ($notif_type == 'pass_er'){
      echo "<h3>MAAF!</h3>
			<p>Password lama salah.</p>";
}

if ($notif_type == 'passb_er'){
      echo "<h3>MAAF!</h3>
			<p>Password baru tidak boleh kosong.</p>";
}

if ($notif_type == 'not_image'){
      echo "<h3>Upload foto gagal!</h3>
			<p>Tipe file foto yang diperkenankan adalah JPG/JPEG.</p>";
}

if ($notif_type == 'image_na'){
      echo "<h3>MAAF!</h3>
			<p>Anda belum memilih file gambar.</p>";
}

if ($notif_type == 'already_regis'){
      echo "<h3>MAAF!</h3>
			<p>Anda telah melakukan registrasi untuk praktikum ini.</p>";
}

if ($notif_type == 'praktikum_na'){
      echo "<h3>MAAF!</h3>
			<p>Anda belum memilih praktikum.</p>";
}

?>