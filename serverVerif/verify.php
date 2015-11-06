<?php
		require('functionVerify.php');
		
		if((isset($_GET['id'])&& isset($_GET['info'])) && !empty($_GET['id']) && $_GET['info'] != "" ){
			$id = $_GET['id'];
			$info = htmlspecialchars($_GET['info']);
			$boolError = true;
			$error='';
			switch($id){
				case 'idUser':
					$boolError = verifyName($info);
					$error = 'Votre nom ne peut pas contenir de caractères spéciaux et d\'accent ';
				break;
				case 'idPoste':
					$boolError = verifyPhone($info);
					$error = 'Le numéro de poste doit être composé de 5 chiffres et commencé par 5 ou 9';
				break;
				
				case 'idPavillon':
						$pavillon = verifyPavillon(substr($info,0,1));
						$etage = verifyEtage(substr($info,1));
					$boolError =($pavillon && $etage);
					$error = "Le pavillon ou l'étage est incorrect";
				break;
				case 'idLogiciel':
					$boolError =  verifySoft($info);
					$error = "Le nom du logiciel ne peut pas contenir d'accents, ni de caractères spéciaux";
				break;
				default:
					throw new Exception("ID NON VALIDE");
			}
			
			if($boolError === false )
				sendError($error);
		}
		else
		{
			sendError("Le champs est vide");
		}
		
		
		
		/*
		* Cette fonction permet de retourner les erreurs
		*/
		function sendError($message){
			header("Content-Type : application/json");
			$erreur = array();
			$erreur["description"] = $message;
			echo json_encode($erreur);
		}