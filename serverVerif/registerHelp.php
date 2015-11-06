<?php
require 'functionVerify.php';
require 'mailtoassistance.php';
require 'config.php';
require 'connexionBDD.php';
require 'fonctionBDDPavillon.php';

if(isset($_POST['nomUtilisateur'],$_POST['postePersonne'],$_POST['pavillonPersonne'],$_POST['ip'],$_POST['pc'],$_POST['typeProbleme']))
{

	//Informations renseignees par l'utilisateur
	$nomUtilisateur = verifyName($_POST['nomUtilisateur']);
	$telephone = verifyPhone($_POST['postePersonne']);
	$pavillon =(verifyPavillon(substr($_POST['pavillonPersonne'],0,1)) && verifyEtage(substr($_POST['pavillonPersonne'],1))) ? htmlspecialchars($_POST['pavillonPersonne']): false;
	$service = (!empty($_POST['service']) && isset($_POST['service'])) ?getPavillonById(htmlspecialchars($_POST['service']),$connexion) : false; 
	$thispc = (isset($_POST['thispc']))? true : false;
	$urgent = (isset($_POST['urgent']))? true :  false;

	//Information retrouve automatiquement
	$ip = verifyIp($_POST['ip']);
	$pc = (!empty($_POST['pc'])) ? htmlspecialchars($_POST['pc']) :  false;

	//Information sur le probleme
	$type = verifyTypeProbleme($_POST['typeProbleme']);
	$prob = (isset($_POST['precisionProbleme']) && !empty($_POST['precisionProbleme'])) ? htmlspecialchars($_POST['precisionProbleme'] ) : false;
	$complement = (isset($_POST['complement']) && !empty($_POST['complement'])) ? htmlspecialchars($_POST['complement']) : '';
	$logiciel = '';
	if(isset($_POST['nomLogiciel']))
		$logiciel = verifySoft($_POST['nomLogiciel']);
	
	

	
	
	
	
	if(!$nomUtilisateur || !$telephone || !$pavillon || !$ip || !$pc || !$type || !$prob || $logiciel === false || !$service)
	{
	
		redirect('/incident/declaration.html');
	}
	else
	{
		$sujet = sujetProbleme($pc,$type,$thispc);
		echo $corpsMail = formeHtml($nomUtilisateur,$telephone,$pavillon,$service,$ip,$pc,$type,$prob,$complement,$logiciel,$thispc,$urgent);
		//mailto(SMTP,PORT,MAIL_FACULTATIF,MAIL_ASSISTANCE,$sujet,$corpsMail); //config.php
	}	
		
}
else{
	redirect('/incident/declaration.html');

}