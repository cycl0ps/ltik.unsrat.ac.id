<?php
$id_praktikum 	= $_GET[id_praktikum];

echo "<div class='contentHeading'>Data Asisten</div>";

//query keterangan praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT * FROM praktikum 
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							WHERE id_praktikum='$id_praktikum'");
$r    = mysql_fetch_array($sql);

echo "<p>$r[nama_matakuliah] $r[kode_matakuliah] - Tahun $r[tahun_praktikum]</p>"; 

//query asisten pada praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT * FROM asisten 
							LEFT JOIN member ON nim_asisten = username
							WHERE id_praktikum='$id_praktikum'
							ORDER BY nim_asisten ASC");

echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama</th>
			<th>Nim</th>
			<th>Aksi</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i.</td>
					<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_asisten]>$r[nama]</a></td>
					<td align='center'>$r[nim_asisten]</td>
					<td align='center'>
						<form name='hapus_asisten$i' method='POST' 
						action='component/com_koordinator/proses.php?act=hapus_asisten'>
						<input type='hidden' name='id_praktikum' value='$id_praktikum' />
						<input type='hidden' name='id' value='$r[id_asisten]' />
						<input type='hidden' name='nim' value='$r[nim_asisten]' />
						</form>
						<a href='javascript:document.hapus_asisten$i.submit();'>Hapus</a>
					</td>
				</tr>";
		$i++;
		}
echo "</table>";

//download data asisten
echo "<form method=POST action='component/com_koordinator/proses.php?act=download_asisten_xls'>
		<input name='id_praktikum' type=hidden value='$id_praktikum' />
		<p align='center'><input type='submit' value='Download Excel'></p></form>";

//form tambah asisten		
echo "<br /><div class='subcontentHeading'>Tambah Asisten</div>";
echo "<form method=POST action=component/com_koordinator/proses.php?act=tambah_asisten>
			<label class='label3'> Masukkan Nim Asisten :</label>
			<input name='id_praktikum' type='hidden' value='$id_praktikum'>
			<input type='text' name='nim' size='15'>&nbsp;&nbsp;<input type='submit' value='Tambah'></form>";
echo "<br><a href=javascript:history.back()>[kembali]</a>";
						
?>