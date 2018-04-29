<!DOCTYPE html>
	
<?php
	print_r($_POST);
	$data=json_encode($_POST);
	$file="../data/nb-users.json";
	$f=fopen($file, 'a+');
	fwrite($f, $data."\n");
	fclose($f);
?>