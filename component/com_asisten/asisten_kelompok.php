<?php
$id_praktikum 	= $_GET[id_praktikum];
$kel 			= $_GET[kel];	

echo "<div class='contentHeading'>Detail Kelompok</div>";

//query keterangan praktikum sesuai $id_praktikum
$sql	= mysql_query("SELECT * FROM praktikum 
								LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah 
								WHERE id_praktikum='$id_praktikum'");
$r    	= mysql_fetch_array($sql);

echo "<p><b>Kelompok $kel</b> $r[nama_matakuliah] $r[kode_matakuliah] - Tahun $r[tahun_praktikum]</p>"; 

$sql = mysql_query("SELECT id_praktikan, nama, nim_praktikan FROM praktikan
						LEFT JOIN member ON nim_praktikan = username 
						WHERE id_praktikum='$id_praktikum' AND kelompok_praktikum='$kel'
						ORDER BY nim_praktikan ASC");
			
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
					<td align='center'>$i</td>
					<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_praktikan]>$r[nama]</a></td>
					<td align='center'>$r[nim_praktikan]</td>
					<td align='center'>
						<form name='hapus_praktikan$i' method='POST' 
						action='component/com_asisten/proses.php?act=hapus_praktikan&kel=$kel'>
						<input type='hidden' name='id_praktikum' value='$id_praktikum' />
						<input type='hidden' name='id' value='$r[id_praktikan]' />
						</form>
						<a href='javascript:document.hapus_praktikan$i.submit();'>Hapus</a>
					</td>
				</tr>";
		$i++;
		}
echo "</table>";

//Asisten			
$sql = mysql_query("SELECT nama,nim_asisten FROM kelompok_praktikum	
						LEFT JOIN member ON nim_asisten = username 
						WHERE id_praktikum='$id_praktikum' AND nama_kelompok='$kel'");
$r=mysql_fetch_array($sql);
						
echo "<div class='subcontentHeading'>Asisten Kelompok $kel : ";

if ($r[nama] != "") {
	echo "<a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_asisten]>$r[nama]</a>"; 
}
echo "</div>";
			
echo "<br><a href=javascript:history.back()>[kembali]</a>";
?>