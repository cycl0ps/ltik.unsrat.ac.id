<?php
$id_praktikum 	= $_GET[id_praktikum];

echo "<div class='contentHeading'>Kelompok Praktikum</div>";

//query keterangan praktikum sesuai $id_praktikum
$sql  = mysql_query("SELECT * FROM praktikum 
							LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
							WHERE id_praktikum='$id_praktikum'");
$r    = mysql_fetch_array($sql);

echo "<p>$r[nama_matakuliah] $r[kode_matakuliah] - Tahun $r[tahun_praktikum]</p>"; 

//button tambah kelompok
echo "<form method=POST action='component/com_koordinator/proses.php?act=tambah_kelompok'>
		<input name='id_praktikum' type=hidden value='$id_praktikum' />
		<p align='center'><input type='submit' value='Tambah Kelompok' /></p></form>";

//query kelompok pada praktikum sesuai $id_praktikum
echo "<ul class='menuList2'>";
$sql = mysql_query("SELECT * FROM kelompok_praktikum 
						WHERE id_praktikum='$id_praktikum' 
						ORDER BY nama_kelompok ASC");
		$i = 1;
		while ($r=mysql_fetch_array($sql)){
			echo "<li><a href=$_SERVER[PHP_SELF]?component=koordinator&type=detail_kelompok&id_praktikum=$id_praktikum&kel=$r[nama_kelompok]>Kelompok $r[nama_kelompok]</a></li>";
		}
echo "</ul>";
		
echo "<br /><p><a href=javascript:history.back()>[kembali]</a></p>";
						
?>