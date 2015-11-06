<?php
	header("Content-Type : application/json");
	$infoClient = array();
	$infoClient["ip"] = $_SERVER["REMOTE_ADDR"];
	$nomPc = explode(".",gethostbyaddr($_SERVER["REMOTE_ADDR"]));
	$infoClient["pc"] = $nomPc[0] ;
	echo json_encode($infoClient);
