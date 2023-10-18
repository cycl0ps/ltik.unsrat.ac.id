<?php
include "../../config/koneksi.php";

$theme = mysql_query("SELECT path_theme FROM themes WHERE status_theme = 'active'");
$t = mysql_fetch_array($theme);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Register - LTIK Teknik Informatika Unsrat</title>
		<link href="../../<?php echo "$t[path_theme]" ?>/css/style.css" rel="stylesheet" type="text/css">
		<link href="../../<?php echo "$t[path_theme]" ?>/bicon.ico" rel="shortcut icon" type="image/x-icon">
	</head>
	<body>
		<div id="header"></div>
		<div id="registerBox"><?php include "form_register.php"; ?></div>
	</body>
</html>