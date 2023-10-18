<?php
include "config/library.php";
include "config/fungsi_indotgl.php";
include "config/fungsi_combobox.php";

$id				= $_SESSION[username];
$id_praktikum 	= $_GET[id_praktikum];

echo "<div class='contentHeading'>Data Praktikum</div>";
echo "<p>Berikut adalah daftar praktikum anda sebagai Dosen Praktikum</p>";

//pilih praktikum
$sql=mysql_query("SELECT * FROM praktikum 
							LEFT JOIN dosen ON praktikum.id_praktikum = dosen.id_praktikum
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							WHERE nip_dosen='$id'
							ORDER BY tahun_praktikum");
							
echo "<ol class='menuList2'>";
$i=1;
while ($r=mysql_fetch_array($sql)){
	echo "<li><a href=$_SERVER[PHP_SELF]?component=dosen&type=data_praktikum&id_praktikum=$r[id_praktikum]>$r[kode_matakuliah] $r[nama_matakuliah] - $r[tahun_praktikum]</a></li>";
}
$i++;
echo "</ol>";

if (!empty($id_praktikum)) {

//query keterangan praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT nama, nama_matakuliah, kode_matakuliah, tahun_praktikum FROM praktikum 
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							LEFT JOIN dosen ON praktikum.id_praktikum = dosen.id_praktikum
							LEFT JOIN member ON nip_dosen = username
							WHERE praktikum.id_praktikum='$id_praktikum'");
$r    = mysql_fetch_array($sql);

echo "<div class='subcontentHeading'>$r[nama_matakuliah] $r[kode_matakuliah] - Tahun $r[tahun_praktikum]</div>";

//Data Koordinator
echo "<div class='subcontentHeading'>Data Koordinator</div>";

$sql  = mysql_query("SELECT nama, nim_koordinator, id_koordinator FROM koordinator 
							LEFT JOIN member ON nim_koordinator = username
							WHERE id_praktikum='$id_praktikum'
							ORDER BY nim_koordinator ASC");
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
			<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_koordinator]>$r[nama]</a></td>
			<td align='center'>$r[nim_koordinator]</td>
			<td align='center'>
						<form name='hapus_koord$i' method='POST' 
						action='component/com_dosen/proses.php?act=hapus_koordinator'>
						<input type='hidden' name='id_praktikum' value='$id_praktikum' />
						<input type='hidden' name='id_koordinator' value='$r[id_koordinator]' />
						<input type='hidden' name='nim' value='$r[nim_koordinator]' />
						</form>
						<a href='javascript:document.hapus_koord$i.submit();'>Hapus</a>
			</td>
		</tr>";
	$i++;
}
echo "</table>";

//form tambah koordinator		
echo "<br /><div class='subcontentHeading'>Tambah Koordinator</div>";
echo "<form method=POST action=component/com_dosen/proses.php?act=tambah_koordinator>
			<label class='label3'>Nim Koordinator :</label>
			<input name='id_praktikum' type='hidden' value='$id_praktikum'>
			<input type='text' name='nim' size='15'>&nbsp;&nbsp;<input type='submit' value='Tambah'></form>";

//Data Asisten
echo "<div class='subcontentHeading'>Data Asisten</div>";

$sql  = mysql_query("SELECT nama, nim_asisten FROM asisten 
							LEFT JOIN member ON nim_asisten = username
							WHERE id_praktikum='$id_praktikum'
							ORDER BY nim_asisten ASC");
echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama</th>
			<th>Nim</th>
		</tr></thead>";
$i=1;
while ($r=mysql_fetch_array($sql)){
	echo "<tr>
			<td align='center'>$i.</td>
			<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_asisten]>$r[nama]</a></td>
			<td align='center'>$r[nim_asisten]</td>
		</tr>";
	$i++;
}
echo "</table>";

//Data praktikan
echo "<div class='subcontentHeading'>Data Praktikan</div>";

$sql  = mysql_query("SELECT nama, nim_praktikan, kelompok_praktikum FROM praktikan 
							LEFT JOIN member ON nim_praktikan = username
							WHERE id_praktikum='$id_praktikum'
							ORDER BY nim_praktikan ASC");
			
echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama</th>
			<th>Nim</th>
			<th>Kelompok</th>
		</tr></thead>";
$i=1;
while ($r=mysql_fetch_array($sql)){
	echo "<tr>
			<td align='center'>$i</td>
			<td><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[nim_praktikan]>$r[nama]</a></td>
			<td align='center'>$r[nim_praktikan]</td>
			<td align='center'>$r[kelompok_praktikum]</td>
		</tr>";
	$i++;
}
echo "</table>";
}

echo "<br /><p><a href=javascript:history.back()>[kembali]</a></p>";

?>