<?php

function getBatimentByPavillon($idPavillon,$connexion){
	$batimentCH = $connexion->prepare("SELECT * FROM endroit WHERE id=:idBatiment");
	$batimentCH->bindParam(':idBatiment',$idPavillon);
	$batimentCH->execute();
	$batiments = $batimentCH->fetch();
	return utf8_encode($batiments['libelle']);
}

function getPavillonByName($name,$connexion)
{
$request = $connexion->prepare("SELECT  * FROM pavillon WHERE pavillon=:pavillon ORDER BY 3 ");
$request->bindParam(':pavillon',$name);
$request->execute();
$resultat = $request->fetchAll();
$i = 0; //pour numeroter les résultats;

foreach($resultat as $res=>$sousres)
{
	$arrayResultat[$i] = array('id'=>utf8_encode($sousres['id']),'serv'=> utf8_encode($sousres['lib']));
	$i++;
}

return $arrayResultat;
}


function getPavillonById($id,$connexion)
{
$request = $connexion->prepare("SELECT  * FROM pavillon WHERE id=:idPavillon ");
$request->bindParam(':idPavillon',$id);
$request->execute();
$resultat = $request->fetch();

return utf8_encode($resultat['lib']);
}
