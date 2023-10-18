<?php
$id_praktikum 	= $_GET[id_praktikum];
$kel 			= $_GET[kel];	

echo "<div class='contentHeading'>Detail Kelompok</div>";

//query keterangan praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT * FROM praktikum 
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							WHERE id_praktikum='$id_praktikum'");
$r    = mysql_fetch_array($sql);

echo "<p><b>Kelompok $kel</b> $r[nama_matakuliah] $r[kode_matakuliah] - Tahun $r[tahun_praktikum]</p>"; 

//query praktikan pada kelompok sesuai nama_kelompok dan praktikum sesuai $id_praktikum
$sql = mysql_query("SELECT nama, nim_praktikan FROM praktikan
						LEFT JOIN member ON nim_praktikan = username 
						WHERE id_praktikum='$id_praktikum' AND kelompok_praktikum='$kel'
						ORDER BY nim_praktikan ASC");
			
echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama</th>
			<th>Nim</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i</td>
					<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_praktikan]>$r[nama]</a></td>
					<td align='center'>$r[nim_praktikan]</td>
				</tr>";
		$i++;
		}
echo "</table>";

//form tambah praktikan pada kelompok praktikum 
echo "<div class='subcontentHeading'>Tambah Anggota Kelompok $kel</div>";
echo "<form method=POST action=component/com_koordinator/proses.php?act=tambah_praktikan_kelompok>
			<label class='label3'>Masukkan Nim Anggota :</label>
			<input name='id_praktikum' type='hidden' value='$id_praktikum' />
			<input name='kelompok' type='hidden' value='$kel' />
			<input type='text' name='nim' size='15'>&nbsp;&nbsp;<input type='submit' value='Tambah'></form>";
	
echo "<div class='subcontentHeading'>Asisten Kelompok $kel : ";

//query asisten pada kelompok sesuai nama_kelompok dan praktikum sesuai $id_praktikum	
$sql = mysql_query("SELECT nama, nim_asisten FROM kelompok_praktikum	
						LEFT JOIN member ON nim_asisten = username 
						WHERE id_praktikum='$id_praktikum' AND nama_kelompok='$kel'");
$r=mysql_fetch_array($sql);
						
if ($r[nama] != "") {
	echo "<a href=?component=member&act=view&id=$r[nim_asisten]>$r[nama]</a>"; 
}
echo "</div>";

echo "<form method=POST action=component/com_koordinator/proses.php?act=update_asisten_kelompok>
			<label class='label3'>Update Asisten :</label>
			<input name='id_praktikum' type='hidden' value='$id_praktikum' />
			<input name='kelompok' type='hidden' value='$kel'>
			<input type='text' name='nim' size='15'>&nbsp;&nbsp;<input type='submit' value='Update'></form>";
			
echo "<br /><a href=javascript:history.back()>[kembali]</a>";
						
?>