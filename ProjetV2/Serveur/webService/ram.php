<!DOCTYPE html>
	
<?php
	print_r($_POST);
	$data=json_encode($_POST);
	$file="./data/ram.json";
	$f=fopen($file, 'a+');
	fwrite($f, $data."\n");
	fclose($f);
?>