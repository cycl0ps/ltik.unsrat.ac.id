<?php
//Query daftar themes
$sql = mysql_query("SELECT * FROM themes");

echo "<div class='contentHeading'>Kelola Themes</div>";
echo "<table>
		<form method=POST action='component/com_admin/proses.php?act=set_theme'>
		<tr><thead>
			<th>No</th>
			<th>Nama Theme</th>
			<th>Deskripsi Theme</th>
			<th>Creator</th>
			<th>Aktif</th>
		</tr></thead>";
		$i=1;
		while ($r=mysql_fetch_array($sql)){
			echo "<tr>
					<td align='center'>$i.</td>
					<td>$r[nama_theme]</td>
					<td>$r[deskripsi_theme]</td>
					<td>$r[creator_theme]</td>
					<td><input type='radio' value='$r[id_theme]' name='status' ";
                    if ($r[status_theme]=='active') {echo "checked";} echo ">
					</td>
				</tr>";
		$i++;
		}
echo "<tr><td colspan='5' align='right'><input type=submit value='Set Theme'</td></tr>
		</form>
	</table>";

echo "<div class='contentHeading'>Tambah Themes</div>";
echo "<form method=POST action=component/com_admin/proses.php?act=add_theme>
			<input type='file' name='fupload' size='40'>
			<input type='submit' value='Upload' name='submit'>
			<p>Tipe file yang diperbolehkan adalah zip.</p>
	</form>";
			
echo "<br><a href=javascript:history.back()>[kembali]</a>";


?>