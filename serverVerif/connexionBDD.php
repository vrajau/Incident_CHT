<?php
	$dsn = 'mysql:dbname=dddddd;host=127.0.0.1';
	$user = 'root';
	$password = '';

	try{
		$connexion = new PDO($dsn,$user,$password);
	}
	catch(PDOException $pe){
		echo 'La connexion a la base de donne a echoue';
	}