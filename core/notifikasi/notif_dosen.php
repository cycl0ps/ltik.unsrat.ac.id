<?php

if ($notif_type == 'belum_isi_nim'){
      echo "<h3>MAAF!</h3>
			<p>Anda belum mengisi NIM.</p>";
}

if ($notif_type == 'already_koordinator'){
      echo "<h3>MAAF!</h3>
			<p>NIM $nim sudah terdaftar sebagai asisten untuk praktikum ini.</p>";

}

if ($notif_type == 'belum_member'){
      echo "<h3>MAAF!</h3>
			<p>NIM $nim belum terdaftar sebagai member LabIS LTIK Unsrat<p>";

}


?>