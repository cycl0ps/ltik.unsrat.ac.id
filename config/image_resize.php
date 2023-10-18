<?php

function profil($file_tmp,$width,$height,$imgratio,$nama_file_baru) {
  $ThumbWidth = 200;
  
  $new_img    = imagecreatefromjpeg($file_tmp);

  if ($width>$ThumbWidth){
    $newwidth   = $ThumbWidth;
    $newheight  = $ThumbWidth/$imgratio;
    
    //function for resize image.
    if (function_exists(imagecreatetruecolor)){
      $resized_img = imagecreatetruecolor($newwidth,$newheight);
    } else {
      die("Error: Please make sure you have GD library ver 2+");
    }
    
  } else {
    $newwidth   = $width;
    $newheight  = $height;
    
    if (function_exists(imagecreatetruecolor)){
      $resized_img = imagecreatetruecolor($newwidth,$newheight);
    } else {
      die("Error: Please make sure you have GD library ver 2+");
    }
  }
    imagecopyresized($resized_img, $new_img, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
    //save image
    ImageJpeg ($resized_img,"../../media/foto_profil/$nama_file_baru");
    ImageDestroy ($resized_img);
    ImageDestroy ($new_img);
}

function thumb($file_thumb,$width,$height,$imgratio,$nama_file_baru) {
  $ThumbWidth = 38;
  
  if ($height>$ThumbHeight){
    $newwidth   = $ThumbWidth;
    $newheight  = $ThumbWidth/$imgratio;
    
    $new_img    = imagecreatefromjpeg($file_thumb);
    
    //function for resize image.
    if (function_exists(imagecreatetruecolor)){
      $resized_img = imagecreatetruecolor($newwidth,$newheight);
    } else {
      die("Error: Please make sure you have GD library ver 2+");
    }
    
    imagecopyresized($resized_img, $new_img, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
    //save image

    ImageJpeg ($resized_img,"../../media/foto_thumb/$nama_file_baru");
    ImageDestroy ($resized_img);
    ImageDestroy ($new_img);
  } else {
    move_uploaded_file($file_thumb,"../../media/foto_thumb/$nama_file_baru");
  }
} 

list($width, $height) = getimagesize($file_tmp);
$imgratio = $width/$height;
$file_thumb=$file_tmp;
profil($file_tmp,$width,$height,$imgratio,$nama_file_baru);
thumb($file_thumb,$width,$height,$imgratio,$nama_file_baru);
?>
