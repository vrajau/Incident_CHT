//Initialisation
(function(pageVerification,elementField,idSelectProblem){
	 nettoie(); 
	 for(i in elementField){
		applyKeyUp(pageVerification,getElement("id"+elementField[i]),"id"+elementField[i],"image"+elementField[i],"id"+elementField.s);
	}
		setButtonEnvoyer(true);//On desactive le boutton
	if(getElement(idSelectProblem).addEventListener)//Autre navigateur
		getElement(idSelectProblem).addEventListener("change",function(){afficherProbleme(getSelected(this.id));},false);
	
	else if(getElement(idSelectProblem).attachEvent)//IE
		getElement(idSelectProblem).attachEvent("onchange",function(){ afficherProbleme(getSelected(idSelectProblem))});
	
	 var setTechInfo = (function(pageInfoTech){
					var fieldTech = {
							ip: getElement('idIp'),
							iph: 'idIpHidden',
							pc: getElement('idPcname'),
							pch: 'idPcnameHidden'
						};
			return downloadUrl(pageInfoTech,function(infoTech){
				if(typeof infoTech == "string" && infoTech != ""){//fix pour ie8 et ie9
					infoTech = JSON.parse(infoTech);
				}
				fieldTech.ip.appendChild(document.createTextNode(infoTech.ip));
				setElementValue(fieldTech.iph,infoTech.ip);
				fieldTech.pc.appendChild(document.createTextNode(infoTech.pc));
				setElementValue(fieldTech.pch,infoTech.pc);
			});
		})('serverVerif/infoClient.php');//page de récupération des info techniques

})('serverVerif/verify.php',elementObject(),'typeP'); //page de vérification + id des différents field de controle

function verify(url,idObject,idImage,idSelect)
{
	var isValid = true,
	info = getElementValue(idObject),
	descErreur;
	downloadUrl(url+"?id="+idObject+"&info="+info,function(error){
			if(typeof error == "object")
				isValid = false;
			else if(typeof error == "string" && error != "")//fix pour ie 8 et ie9
			{
				isValid = false;
				error = JSON.parse(error);
			}
			descErreur = (error !== "undefined") ? error.description : "";
			
		
			//Agit comme le callback
			var callback = (function(){
				var urlImage = {
					ok: 'image/good.png',
					fail: 'image/bad.png'
				};
				return (function(verify){
					requestActive(verify,getSelected('typeP'));
					deleteNode(idImage);
					var baliseImage = document.createElement("img"),
					src,
					alt,
					id = "image",
					recherche;
					if(verify){
						src = urlImage.ok;
						alt = "Le champs est bon";
						getElement(idImage).appendChild(baliseImage);
							if(idObject == "idPavillon")
							{
								deleteNode(idSelect);
								recherche = getElement(idObject).value;
								resultatRecherche(idSelect,recherche)
							}
					  }
					else{
						baliseImage.title = "Erreur"; // pour éviter la redondance de la description de l'erreur dans le tooltip
						src = urlImage.fail;
						alt = "Le champs est mauvais";
						//Creation d'un élément DOM a pour utiliser les tooltip
						//Pour utilisr l'attribut hover, et donc utiliser le tooltip il faut mettre l'image dans un lien
						var link = document.createElement("a");
							link.href = "#";
							link.className = "precisionErreur";
							link.title = descErreur;
							link.appendChild(baliseImage);
							getElement(idImage).appendChild(link);
							
							if(idObject == "idPavillon")
							{
								deleteNode(idSelect);
							}
							
							
							
					}
						baliseImage.src = src;
						baliseImage.alt  = alt;
						
			
						
				})(isValid);
			})(); });

}




function afficherProbleme(selectedElement){
	deleteNode("catP");
	var arrayProbleme = new Array(),
	request;
	switch(selectedElement){
		case "1":
			deleteNode("nomL");
			arrayProbleme.push("Pc ne démarre plus","Ecran Défectueux","Lenteur du PC","Imprimante Défectueuse","Connexion Réseau Défaillante","Batterie Ordinateur Portable","Wifi","Souris/Clavier","Autre");
		break;
		case "2":
			arrayProbleme.push("Mise à Jour défectueuse","Lenteur du Logiciel","Logiciel ne démarre pas","Logiciel non présent","Perte de donnée","Fonctionnalité qui ne fonctionne pas","Autre");
			//Création des elements
			var descriptionChamps = document.createTextNode("Nom du Logiciel : "),
			inputLogiciel = document.createElement("input"),
			imageVerification = document.createElement("span"),
			fragment = document.createDocumentFragment(); //Optimisation
			//Affectation des proprietes des elements
			inputLogiciel.type = "text";
			inputLogiciel.id = "idLogiciel";
			inputLogiciel.name = "nomLogiciel";
			imageVerification.id = "imageLogiciel";
			applyKeyUp('serverVerif/verify.php',inputLogiciel,inputLogiciel.id,imageVerification.id);
			//Affectation des elements au DOM de la page
			fragment.appendChild(descriptionChamps);
			fragment.appendChild(inputLogiciel);
			fragment.appendChild(imageVerification);
			getElement("nomL").appendChild(fragment);
		break;
		case "3":
			deleteNode("nomL");
			arrayProbleme.push("DxCare","Cpage","ResUrgences","WinRest");
		break;
		default:
			deleteNode("catP");
			deleteNode("nomL");
	}
	  requestActive(true,selectedElement);
	 // On crée un nouveau select qui contient une précision selon les problèmes
	 if(selectedElement != -1){
			(function(array,idParent){
				var newSelect = document.createElement("select"),
				option,
				sizeArray = array.length;
				newSelect.name = "precisionProbleme";
				newSelect.id =   "categorie";
				for(var i = 0; i < sizeArray; i++)
				{
					option = document.createElement("option");
					option.value=array[i];
					option.text =array[i];
					newSelect.add(option);
				}
				getElement(idParent).appendChild(newSelect);
			}(arrayProbleme,'catP')); //Array contenant les differents categories + id de l'élement ou on met le select
	}
}



function setButtonEnvoyer(value){
	getElement("buttonSubmit").disabled = value;
	if(value)
		getElement("buttonSubmit").onclick = function(){getElement("formHelp").submit();};
}



function elementObject(){
	var x = {
		n: 'User',
		p: 'Poste',
		s: 'Service',
		pv: 'Pavillon'
	};
	return x;
}



function applyKeyUp(url,element,id,image,idSelect){
	if(element.addEventListener) //Autre navigateur
	{
		element.addEventListener("keyup",function(){
			verify(url,id,image,idSelect);},false);
	}
	else if(element.attachEvent) //IE
	{
		element.attachEvent("onkeyup",function(){
			verify(url,id,image,idSelect);});
	}
}







function requestActive(booleanActivation,selectedElement){
		var elements = elementObject(),
		requestNonActive = false;
		if(selectedElement == '2')
			elements.l = 'Logiciel';
		if(!booleanActivation || selectedElement == '-1')
			requestNonActive = true;
		
		for(var i  in elements){
			if(getElementValue('id'+elements[i]) == '')
				requestNonActive = true;
		}
		
		
	  setButtonEnvoyer(requestNonActive);
}

function  nettoie(){
var element = elementObject();
for(var i  in element)
{
	 setElementValue('id'+element[i],"");
}
setElementValue('typeP','-1');
setElementValue('comp','');
}





/*Nouvelle fonction */


function resultatRecherche(idSelect,recherche){
	
downloadUrl('serverVerif/searchPavillon.php?idRecherche=recherchePavillon&recherche='+recherche,function(object){
		
			if(typeof object == 'object')
			{
				selectService(idSelect,object);
			}
			else if(typeof object == "string")
			{
				object = JSON.parse(object);
				selectService(idSelect,object);
			}
		});	



}




function selectService(idSelect,arrayService){
	var select = getElement(idSelect);
		
	
	if(arrayService.length > 0)
	{
	
		for(var i in arrayService)
		{
			option =  document.createElement('option');
			option.value = arrayService[i].id;
			option.text = arrayService[i].serv;
			select.add(option);
		}
		
	}
	
			option =  document.createElement('option');
			option.value = '999';
			option.text = 'Autre/Non-Renseigne';
			select.add(option);
}


