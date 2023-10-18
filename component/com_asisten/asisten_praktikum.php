<?php
$id   = $_SESSION[username];

echo "<div class='contentHeading'>Daftar Praktikum</div>";
echo "<p>Berikut adalah daftar praktikum anda sebagai asisten</p>";

//query data asisten pada praktikum yg mana
$sql  = mysql_query("SELECT * FROM asisten 
						LEFT JOIN praktikum ON asisten.id_praktikum = praktikum.id_praktikum
						LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah 
						WHERE nim_asisten='$id'
						ORDER BY tahun_praktikum DESC");
echo "<ol class='menuList2'>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<li>$r[nama_matakuliah] $r[kode_matakuliah] - $r[tahun_praktikum]</li>";
			
			//query data kelompok pd praktikum tersebut
			$sql2  = mysql_query("SELECT nama_kelompok FROM kelompok_praktikum
						WHERE nim_asisten='$id' AND id_praktikum='$r[id_praktikum]'
						ORDER BY nama_kelompok ASC");
			echo "<ul class='menuList2'>";
			$j=1;
			while ($s=mysql_fetch_array($sql2)){
				echo "<li><a href=$_SERVER[PHP_SELF]?component=asisten&type=kelompok&id_praktikum=$r[id_praktikum]&kel=$s[nama_kelompok]>Kelompok $s[nama_kelompok]</a></li>";
				$j++;
			}
			echo "</ul>";
		$i++;
		}
echo "</ol>";

echo "<p><a href=javascript:history.back()>[kembali]</a></p>";
?>