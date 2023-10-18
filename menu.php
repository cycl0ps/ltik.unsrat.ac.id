<?php
//Query akses level untuk menu
$sql  = mysql_query("SELECT isPraktikan, isAsisten, isKoordinator, isAdmin, isDosen
						FROM member WHERE username='$_SESSION[username]'");
$r    = mysql_fetch_array($sql);

echo "<p class='menuHeading'>Menu Member</p>
		<ul class='menuList'>
		<li><a href=$_SERVER[PHP_SELF]?component=home>Home</a></li>
		<li><a href=$_SERVER[PHP_SELF]?component=member&act=view&id=$_SESSION[username]>ProfilKu</a></li>
		<li><a href=$_SERVER[PHP_SELF]?component=member&act=registrasi_praktikum>Registrasi Praktikum</a></li>
		<li><a href=$_SERVER[PHP_SELF]?component=member&act=data_member>Data Member</a></li>
		</ul>";
		
if ($r[isPraktikan]==1) {
	echo "<p class='menuHeading'>Menu Praktikan</p>
		<ul class='menuList'>
		<li><a href=$_SERVER[PHP_SELF]?component=praktikan&type=praktikum>PraktikumKu</a></li>
		<li>Registrasi Asisten</li>
		</ul>";
}
		
if ($r[isAsisten]==1) {
	echo "<p class='menuHeading'>Menu Asisten</p>
		<ul class='menuList'>
		<li><a href=$_SERVER[PHP_SELF]?component=asisten&type=praktikum>PraktikumKu</a></li>
		</ul>";
}

if ($r[isKoordinator]==1) {
	echo "<p class='menuHeading'>Menu Koordinator</p>
		<ul class='menuList'>
		<li><a href=$_SERVER[PHP_SELF]?component=koordinator&type=praktikum>PraktikumKu</a></li>
		</ul>";
}	

if ($r[isDosen]==1) {
	echo "<p class='menuHeading'>Menu Dosen</p>
		<ul class='menuList'>
		<li><a href=$_SERVER[PHP_SELF]?component=dosen&type=data_praktikum>Data Praktikum</a></li>
		</ul>";
}

if ($r[isAdmin]==1) {
	echo "<p class='menuHeading'>Menu Admin</p>
		<ul class='menuList'>
		<li><a href=$_SERVER[PHP_SELF]?component=admin&type=tambah_praktikum>Data Praktikum</a></li>
		<li><a href=$_SERVER[PHP_SELF]?component=admin&type=reset_password>Reset Password Member</a></li>
		<li>Kelola Components</li>
		<li>Kelola Modules</li>
		<li><a href=$_SERVER[PHP_SELF]?component=admin&type=themes>Kelola Themes</a></li>
		</ul>";
}

echo "<a href=core/login/logout.php>Logout</a>";
?>