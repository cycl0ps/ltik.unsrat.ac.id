<?php
include "config/library.php";
include "config/fungsi_indotgl.php";

$nama   	= $_SESSION[nama];
$username   = $_SESSION[username];
$semester	= getSemester(date('m'));

echo "<div class='contentHeading'>Registrasi Praktikum</div>";
echo "<p>Berikut adalah formulir registrasi praktikum untuk semester $semester Tahun $thn_sekarang.</p>";
echo "<form action='component/com_member/proses.php?form=regis_praktikum' method='post'>
		<input name=id type=hidden value='$username'>
		<p><label class='label1'for='nama'>Nama Lengkap &nbsp;</label>: <b>$nama</b></p>
		<p><label class='label1' for='nim'>Nim &nbsp;</label>: <b>$username</b></p>
		<p><select name='kode_praktikum'><option value='' selected>- Pilih Praktikum - </option>";
			
			$sql=mysql_query("SELECT * FROM praktikum
									LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah 
									WHERE tipesem_matakuliah='$semester' AND tahun_praktikum='$thn_sekarang'");
			while ($r=mysql_fetch_array($sql)) {
				echo "<option value='$r[id_praktikum]'>$r[kode_praktikum] - $r[nama_matakuliah]</option>";
			}
echo "</select></p>
		<p><input type='submit' value='Daftar'></p></form>";

?>