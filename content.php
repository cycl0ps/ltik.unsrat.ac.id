<?php
include "core/session/session.php";

if ($_GET[component]=='home'){
  include "component/com_home/home.php";
}

if ($_GET[component]=='member'){
  include "component/com_member/controller.php";
}

if ($_GET[component]=='praktikan'){
  include "component/com_praktikan/controller.php";
}

if ($_GET[component]=='asisten'){
  include "component/com_asisten/controller.php";
}

if ($_GET[component]=='koordinator'){
  include "component/com_koordinator/controller.php";
}

if ($_GET[component]=='dosen'){
  include "component/com_dosen/controller.php";
}

if ($_GET[component]=='admin'){
  include "component/com_admin/controller.php";
}







?>