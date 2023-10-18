<?php
$id = $_SESSION[username];

echo "<div class='contentHeading'>Daftar Praktikum</div>";
echo "<p>Berikut adalah daftar praktikum anda sebagai koordinator praktikum</p>";

//query koordinator pada praktikum yang mana
$sql  = mysql_query("SELECT * FROM koordinator 
						LEFT JOIN praktikum ON koordinator.id_praktikum = praktikum.id_praktikum
						LEFT JOIN mata_kuliah ON kode_praktikum = kode_matakuliah
						WHERE nim_koordinator='$id'
						ORDER BY tahun_praktikum DESC");

echo "<table class='content'>
		<tr><thead>
			<th>No</th>
			<th>Nama Praktikum</th>
			<th>Kode Praktikum</th>
			<th>Tahun</th>
			<th colspan='3'>Kelola</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i.</td>
					<td>$r[nama_matakuliah]</td>
					<td align='center'>$r[kode_matakuliah]</td>
					<td align='center'>$r[tipesem_matakuliah] - $r[tahun_praktikum]</td>
					<td align='center'><a href=$_SERVER[PHP_SELF]?component=koordinator&type=praktikan&id_praktikum=$r[id_praktikum]>
						Praktikan</a></td>
					<td align='center'><a href=$_SERVER[PHP_SELF]?component=koordinator&type=asisten&id_praktikum=$r[id_praktikum]>
						Asisten</a></td>
					<td align='center'><a href=$_SERVER[PHP_SELF]?component=koordinator&type=kelompok&id_praktikum=$r[id_praktikum]>
						Kelompok</a></td>
				</tr>";
		$i++;
		}
echo "</table>";
echo "<br /><a href=javascript:history.back()>[kembali]</a>";

?>