<?php

if ($r[isAdmin]!=1) {
  echo "<b>Request denied!</b>";
  die();
}

if ($_GET[type]=='tambah_praktikum'){
  include "component/com_admin/admin_tambah_prak.php";
}

if ($_GET[type]=='data_praktikum'){
  include "component/com_admin/admin_data_prak.php";
}

if ($_GET[type]=='reset_password'){
  include "component/com_admin/admin_reset_pass.php";
}

if ($_GET[type]=='themes'){
  include "component/com_admin/admin_themes.php";
}




?>