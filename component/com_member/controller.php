<?php

if ($_GET[act]=='view'){
  include "component/com_member/member_view.php";
}

if ($_GET[act]=='edit'){
  include "component/com_member/member_edit.php";
}

if ($_GET[act]=='registrasi_praktikum'){
  include "component/com_member/regis_praktikum.php";
}

if ($_GET[act]=='data_member'){
  include "component/com_member/data_member.php";
}
?>