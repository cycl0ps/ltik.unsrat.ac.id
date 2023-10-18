<?php
include "config/library.php";
include "config/fungsi_indotgl.php";

$tipesem	= getSemester(date('m'));

echo "<div class='contentHeading'>Tambah Praktikum</div>";

//form tambah praktikum
echo "<form method=POST action=component/com_admin/proses.php?act=tambah_praktikum>
			<p>NIP Dosen :
			<input type='text' name='nip' size='20' maxlength='18'>&nbsp;
			<select name=kode_praktikum><option value='' selected>- Pilih Praktikum - </option>";
			$sql=mysql_query("SELECT * FROM mata_kuliah WHERE tipesem_matakuliah='$tipesem'");
			while ($r=mysql_fetch_array($sql)) {
				echo "<option value='$r[kode_matakuliah]'>$r[kode_matakuliah] - $r[nama_matakuliah]</option>";
			}
echo "</select>
			<input type='hidden' name='tahun' value='$thn_sekarang' />
			<input type='submit' value='Tambah'></p></form><br>";

$sql  = mysql_query("SELECT id_koordinator, nama, nim_koordinator, koord_pd_praktikum, nama_praktikum, tahun_diangkat
						FROM koordinator 
						LEFT JOIN praktikum ON koord_pd_praktikum = kode_praktikum
						LEFT JOIN member ON nim_koordinator = nim
						ORDER BY tahun_diangkat DESC");

//query data praktikum
$sql = mysql_query("SELECT * FROM praktikum
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							LEFT JOIN dosen ON dosen.id_praktikum = praktikum.id_praktikum
							LEFT JOIN member ON username = nip_dosen
							ORDER BY tahun_praktikum, praktikum.id_praktikum DESC");
						
echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama Praktikum</th>
			<th>Kode Praktikum</th>
			<th>Tahun</th>
			<th>Dosen Praktikum</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i.</td>
					<td><a href=$_SERVER[PHP_SELF]?component=admin&type=data_praktikum&id_praktikum=$r[id_praktikum]>$r[nama_matakuliah]</a></td>
					<td align='center'>$r[kode_matakuliah]</td>
					<td align='center'>$r[tipesem_matakuliah] - $r[tahun_praktikum]</td>
					<td align='center'>$r[nama]</td>
				</tr>";
		$i++;
		}
echo "</table>";
		
?>