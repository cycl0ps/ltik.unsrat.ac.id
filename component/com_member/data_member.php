<?php
include "config/class_paging.php";

$p      = new Paging;
$batas  = 40;
$posisi = $p->cariPosisi($batas);

$sql   = "SELECT * FROM member
				WHERE isDosen = 0 AND username!='admin'
				ORDER BY username ASC LIMIT $posisi,$batas";		 
$hasil = mysql_query($sql);

echo "<div class='contentHeading'>Data Member</div>";
echo "<table cellspacing='10'>";
$i=1;
while($r=mysql_fetch_array($hasil)){
  if ($i%2){
    echo "<tr><td class='foto_box'>";
        if (!empty($r[foto])) {
              echo "<img src='media/foto_thumb/$r[foto]'>";
        } else {
              echo "<img src='media/foto_thumb/anon.jpg'>";
        }
    echo "</td><td width=200px><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[username]>$r[nama]</a>
          <br>$r[username]<br>$r[angkatan]</td>";
  } else {
    echo "<td class='foto_box'>";
        if (!empty($r[foto])) {
              echo "<img src='media/foto_thumb/$r[foto]'>";
        } else {
              echo "<img src='media/foto_thumb/anon.jpg'>";
        }
    echo "</td><td width=200px><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$r[username]>$r[nama]</a>
          <br>$r[username]<br>$r[angkatan]</td></tr>";
  }
$i++;
}


echo "</table>";
  $jmldata     = mysql_num_rows(mysql_query("SELECT * FROM member"));
  $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
  $linkHalaman = $p->navHalaman($_GET[halaman], $jmlhalaman);

  echo "<div class='navigasi'>$linkHalaman</div>";
?>
