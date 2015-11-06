<?php

		function verifyName($name)
		{
			return 	$nom = (strlen($name) != 0 && preg_match("/^[a-zA-Z]+$/",$name) == 1 && !empty($name)) ? htmlspecialchars($name) : false;			
		}
		
		function verifyPhone($phone)
		{	
			return $tel = (preg_match("/^(5|9)[0-9]{4}$/",$phone) == 1 && !empty($phone)) ? htmlspecialchars($phone) : false;
		}
		
		function verifyPavillon($lettrePavillon){
			return $pavillon = (preg_match("/^[a-vA-V]$/",$lettrePavillon)== 1 && !empty($lettrePavillon) ) ? htmlspecialchars($lettrePavillon) : false;
		}
		
		function verifyEtage($etage){
			return $et = (preg_match("/^(-?1|[0-4])$/",$etage) == 1) ? true: false;	
		}
		
		function verifySoft($name)
		{
			return $soft = (preg_match("/^[a-zA-Z0-9\\s]+$/",$name) == 1 && !empty($name)) ? htmlspecialchars($name) : false;
		}
		
		function verifyIp($ip)
		{
			return htmlspecialchars(filter_var($ip, FILTER_VALIDATE_IP));
		}
		
		function verifyTypeProbleme($id){
			$typeProbleme = array('1'=>'Materiel','2'=>'Logiciel','3'=>"Problème Patient");
			$result = (array_key_exists($id,$typeProbleme) && !empty($id)) ? $typeProbleme[$id] : false;
			return $result;
		}
		
		function redirect($url){
			header( "HTTP/1.1 303 See Other" ); 
			header( "Location: ".$url ); 
			exit();
		}
		
		