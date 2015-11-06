<?php
require_once('class.phpmailer.php');
require_once('functionVerify.php');

function mailto($smtp,$port,$emailEnvoie,$emailReception,$sujet,$corps){
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->Host = $smtp;
	$mail->CharSet = "UTF-8";
	$mail->Port = $port;
	$mail->SetFrom($emailEnvoie,$sujet);
	$mail->Subject = $sujet;
	$mail->MsgHTML($corps);
	$mail->AddAddress($emailReception, "Assistance");
	
	if(!$mail->Send()) {
	echo 'Erreur, le message ne s\'est pas bien envoye, veuillez verifier les configurations';
} else {
 redirect('/incident/confirmation.html');
}

}

function formeHtml($user,$tel,$pav,$service,$ip,$pc,$type,$prob,$complement='',$logiciel,$thispc,$urgent){

$concerne = ($thispc) ? 'Ce probleme ne concerne pas ce PC' : 'Ce probleme concerne ce PC';
$urg = ($urgent) ? '<font color=\'red\'> Demande Urgente</font>' : '<font color=\'green\'> Demande Non Urgente</font>';

$descLogiciel = '';
if(!empty($logiciel))
	$descLogiciel ='<tr><th>Nom du Logiciel</th><td align="center">'.$logiciel.'</td></tr>';
			


$html = <<<HTML
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Probleme</title>
</head>
<body>
		<p style="font-weight:bold;font-size:1.3em;"> {$urg} </p>
		<table border="1"  width="600px">
		<tr>
			<th colspan="2" bgcolor="#4671D5"><font color="white">Informations sur l'Utilisateur</font></th>
		</tr>
		<tr>
			<th>Nom d'Utilisateur</th>
			<td align="center">{$user} </td>
		</tr>
		<tr>
			<th >Service</th>
			<td align="center">{$pav}: {$service}</td>
			
		</tr>
		<tr>
			<th >Telephone(Poste)</th>
			<td align="center">{$tel}</td>
		</tr>
	</table><br>
	
	

	
	<table border="1"  width="600px" >
		<tr>
			<th colspan="2" bgcolor="Crimson "><font color="white"> Information sur le Probleme</font> </th>
		</tr>
		<tr>
			<th >Type de Probleme</th>
			<td align="center">{$type}</td>
		</tr>
		<tr>
			<th>Sous-Categorie</th>
			<td align="center">{$prob}</td>
		</tr>
		{$descLogiciel}
	
		
	</table><br>
	
	<table border="1"  width="600px">
		
		<tr>
			<th colspan="2" bgcolor="MediumPurple"><font color="white">Information sur le PC</font></th>	
		</tr>
		<tr>
			<th>Adresse IP</th>
			<td align="center">{$ip}</td>
		</tr>
		
		<tr>
			<th>Nom du PC</th>
			<td align="center">{$pc}</td>
		</tr>
			<tr>
			<td colspan="2" align="center"><strong><font color="DarkBlue  ">{$concerne}</font></strong></td>
		</tr>
		
	</table>
		
	<div id="info" style="width:400px">
		<h3> Informations Complémentaires : </h3>
		<p style="text-align: justify; word-wrap: break-word;">{$complement}</p>
	
	
		
	</body>
	</html>
HTML;
return $html;
}

function sujetProbleme($poste,$type,$isPoste){
	$sujet = '';
	if(!$isPoste){
		$sujet = 'Probleme '.$type.' sur le poste '.$poste;
	}
	else{
		$sujet = 'Probleme '.$type.' sur un autre poste. Envoye depuis le poste '.$poste;
	}
	return $sujet;
}

