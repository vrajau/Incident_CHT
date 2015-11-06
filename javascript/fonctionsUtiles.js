function setElementValue(id,value){document.getElementById(id).value =value;}

function getElement(name){return document.getElementById(name);}
function getElementValue(name){return document.getElementById(name).value;}
function getSelected(id){return document.getElementById(id).options[document.getElementById(id).selectedIndex].value;}


function deleteNode(id){
	while(getElement(id).firstChild){
		getElement(id).removeChild(getElement(id).firstChild);
	}
}