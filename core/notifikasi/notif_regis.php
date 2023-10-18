<?php
if ($notif_type == 'us_ex'){
      echo "<h3>MAAF!</h3>
			<p>Username $username sudah terdaftar sebelumnya.</p>";
}

if ($notif_type == 'us_na'){
      echo "<h3>MAAF!</h3>
			<p>Username belum diisi atau tidak valid.</p>
			<p>Masukan NIM atau NIP anda!</p>";
}

if ($notif_type == 'name_na'){
      echo "<h3>MAAF!</h3>
			<p>Nama tidak boleh kosong.</p>";
}

if ($notif_type == 'jk_na'){
      echo "<h3>MAAF!</h3>
			<p>Jenis kelamin belum diisi.</p>";
}

if ($notif_type == 'tmptlh_na'){
      echo "<h3>MAAF!</h3>
			<p>Tempat lahir tidak boleh kosong.</p>";
}

if ($notif_type == 'tgl_na'){
      echo "<h3>MAAF!</h3>
			<p>Tanggal lahir belum diisi.</p>";
}

if ($notif_type == 'bln_na'){
      echo "<h3>MAAF!</h3>
			<p>Bulan lahir belum diisi.</p>";
}

if ($notif_type == 'thn_na'){
      echo "<h3>MAAF!</h3>
			<p>Tahun lahir belum diisi.</p>";
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

if ($notif_type == 'ang_na'){
      echo "<h3>MAAF!</h3>
			<p>Tahun angkatan belum diisi.</p>";
}

if ($notif_type == 'pass_na'){
      echo "<h3>MAAF!</h3>
			<p>Password tidak boleh kosong.</p>";
}
?>