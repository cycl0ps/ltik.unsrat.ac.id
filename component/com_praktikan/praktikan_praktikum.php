<?php
$id   = $_SESSION[username];

echo "<div class='contentHeading'>Daftar Praktikum</div>";
echo "<p>Berikut adalah daftar praktikum anda sebagai praktikan</p>";

//query praktikan pada praktikum yang mana
$sql  = mysql_query("SELECT * FROM praktikan 
						LEFT JOIN praktikum ON praktikan.id_praktikum = praktikum.id_praktikum
						LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah 
						WHERE nim_praktikan='$id'
						ORDER BY tahun_praktikum DESC");
$ketemu=mysql_num_rows($sql);

echo "<table class='content'>
		<thead><tr>
			<th>No</th>
			<th>Praktikum</th>
			<th>Kode Praktikum</th>
			<th>Kelompok</th>
			<th>Semester</th>
			<th>Tahun Daftar</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i.</td>
					<td>$r[nama_matakuliah]</td>
					<td align='center'>$r[kode_matakuliah]</td>
					<td align='center'><a href=$_SERVER[PHP_SELF]?component=praktikan&type=kelompok&id_praktikum=$r[id_praktikum]&kel=$r[kelompok_praktikum]>$r[kelompok_praktikum]</td>
					<td align='center'>$r[sem_matakuliah] - $r[tipesem_matakuliah]</td>
					<td align='center'>$r[tahun_praktikum]</td>
				</tr>";
		$i++;
		}
echo "</table>";

echo "<br><a href=$_SERVER[PHP_SELF]?component=member&act=registrasi_praktikum>Registrasi Praktikum</a>";
?>