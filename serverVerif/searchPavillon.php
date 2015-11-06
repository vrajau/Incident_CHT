<?php
	require 'connexionBDD.php';
	require 'fonctionBDDPavillon.php';
	header("Content-Type : application/json");

if(isset($_GET['recherche'],$_GET['idRecherche']) && !empty($_GET['recherche']) &&  !empty($_GET['idRecherche'])){

	$id = htmlspecialchars($_GET['idRecherche']);

	if($id == 'recherchePavillon'){
		$arrayResultat = getPavillonByName($_GET['recherche'],$connexion);
		echo json_encode($arrayResultat); 
	}
	else
		echo 'L\'id que vous avez donné n\'existe pas';
}






