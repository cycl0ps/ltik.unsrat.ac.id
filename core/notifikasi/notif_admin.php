<?php

if ($notif_type == 'belum_isi_nip'){
      echo "<h3>MAAF!</h3>
			<p>Anda belum mengisi NIP.</p>";
}

if ($notif_type == 'belum_pilih_praktikum'){
      echo "<h3>MAAF!</h3>
			<p>Anda belum memilih praktikum.</p>";
}

if ($notif_type == 'belum_member'){
      echo "<h3>MAAF!</h3>
			<p>NIP $nip belum terdaftar sebagai member LabIS LTIK Unsrat<p>";

}

if ($notif_type == 'prak_exist'){
      echo "<h3>MAAF!</h3>
			<p>Praktikum $kodeprak untuk tahun $tahun sudah terdaftar</p>";
}

?>