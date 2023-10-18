<?php
$id_praktikum 	= $_GET[id_praktikum];

echo "<div class='contentHeading'>Data Praktikan</div>";

//query keterangan praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT * FROM praktikum 
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							WHERE id_praktikum='$id_praktikum'");
$r    = mysql_fetch_array($sql);

echo "<p>$r[nama_matakuliah] $r[kode_matakuliah] - Tahun $r[tahun_praktikum]</p>"; 

//query praktikan pada praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT * FROM praktikan 
							LEFT JOIN member ON nim_praktikan = username
							WHERE id_praktikum='$id_praktikum'
							ORDER BY nim_praktikan ASC");
			
echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama</th>
			<th>Nim</th>
			<th>Kelompok</th>
			<th>Aksi</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i.</td>
					<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_praktikan]>$r[nama]</a></td>
					<td align='center'>$r[nim_praktikan]</td>
					<td align='center'>$r[kelompok_praktikum]</td>
					<td align='center'>
						<form name='hapus_praktikan$i' method='POST' 
						action='component/com_koordinator/proses.php?act=hapus_praktikan'>
						<input type='hidden' name='id_praktikum' value='$id_praktikum' />
						<input type='hidden' name='id' value='$r[id_praktikan]' />
						<input type='hidden' name='nim' value='$r[nim_praktikan]' />
						</form>
						<a href='javascript:document.hapus_praktikan$i.submit();'>Hapus</a>
					</td>
				</tr>";
		$i++;
		}
echo "</table>";

//download data praktikan
echo "<form method=POST action='component/com_koordinator/proses.php?act=download_praktikan_xls'>
		<input name='id_praktikum' type=hidden value='$id_praktikum' />
		<p align='center'><input type='submit' value='Download Excel'></p></form>";
		
echo "<p><a href=javascript:history.back()>[kembali]</a></p>";
						
?>