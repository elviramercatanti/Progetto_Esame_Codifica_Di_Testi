/*inizializzo le variabili*/ 
var indicePagina;
var numeroPagine;
var paginaSucc;
var paginaPrec;

var immaginiFolio=[];
var testoFolio=[];


/*funzione per mandare avanti le immagini*/
function funcImgSuccessiva(){
	try{
		cambiaFoto(+1);
	}catch (e){
		alert("funcImgSuccessiva"+e);
	}
}

/*funzione per mandare indietro le immagini */ 
function funcImgPrecedente(){
	try{
		cambiaFoto(-1);
		}	catch(e){
				alert("funcImgPrecedente"+e);
		}
		
}


function cambiaFoto(x){

	/* Nascondo la pagina attuale */
	immaginiFolio[indicePagina].setAttribute("style","display:none");
	if (testoFolio[indicePagina]!=null){
		for (var i=0;i<testoFolio[indicePagina].length;i++) {
			testoFolio[indicePagina][i].setAttribute("hidden","hidden");
		}
	}

	/* Cambio l'indice della pagina visualizzata */
	indicePagina += x;
	if (indicePagina==numeroPagine){
		indicePagina=0;
	} else if (indicePagina<0){
		indicePagina=numeroPagine-1;
	}

	/* Rendo visibile la pagina (foto/testo) */
	immaginiFolio[indicePagina].setAttribute("style","display:inline");
	if (testoFolio[indicePagina]!=null){
		for (var i=0;i<testoFolio[indicePagina].length;i++) {
			testoFolio[indicePagina][i].removeAttribute("hidden");
		}
	}


	/*Rendo visibile la legenda */
	if (indicePagina==0){
		document.getElementById("legendacolori").setAttribute("style","inline-block");
	} else {
		document.getElementById("legendacolori").setAttribute("style","display:none");
	}
	

}




function resetDisplayNone(e) {

    try {

	    var rigaSpan=document.getElementsByClassName("riga");
	    for(var i=0; i<rigaSpan.length; i++){
            rigaSpan[i].setAttribute('style','display:none');
        }	    
	} catch(e){
		alert("resetDisplayNone"+e);
	}

}



function getElement(elem,tag) {

	var myid=elem.getAttribute(tag).trim();

   	elem=document.getElementById(myid);
   	return elem;
}



function mouseOver(e) {
    try {

        elem=getElement(this,'facs');
   	    
        if (elem) {
			elem.style.display="inline";
        } else {
            document.getElementById('paratext').style.display="inline";       
        }
	    
	} catch(e){
		alert("mouseOver"+e);
	}
}
  
  
function mouseOut(e) {
    try {
  
        elem=getElement(this,'facs');
   	    
        if (elem) {
			elem.style.display='none';
        } else {
            document.getElementById('paratext').style.display='none';       
        }
	      
	    
	} catch(e){
		alert("mouseOut"+e);
	}

}



/*funzione per gestire la freccia laterale che punta su o giù*/
window.addEventListener ("scroll",function(){

	if (window.pageYOffset>200) {
	document.getElementById ("frecciasu").style.display= "block";
	}
	
	else if (window.pageYOffset<200) {
	document.getElementById ("frecciasu").style.display= "none";
	}
	
	
},!1);



/*funzione che al caricamento della pagina prepara la visualizzazione*/
function gestoreLoad(){
	try{

		/*************/
		paginaSucc=document.getElementById("frecciaavanti");
		paginaPrec=document.getElementById("frecciaindietro");
		paginaSucc.addEventListener("click", funcImgSuccessiva);
		paginaPrec.addEventListener("click", funcImgPrecedente);

		/*************/
		//var immaginiFolio=[];
		immaginiFolio[0]=document.getElementById("folio1");
		immaginiFolio[1]=document.getElementById("folio2");
		immaginiFolio[2]=document.getElementById("folio3");
		immaginiFolio[3]=document.getElementById("folio4");

		/*************/
		//var testoFolio=[];
		testoFolio[0]=document.getElementsByClassName("p1");
		testoFolio[1]=null;
		testoFolio[2]=null;
		testoFolio[3]=document.getElementsByClassName("p4");

		/*************/
		rigaFolio=document.getElementsByClassName("arealb");
		for(var i=0; i<rigaFolio.length; i++){
			rigaFolio[i].addEventListener("mouseover", mouseOver);
			rigaFolio[i].addEventListener("mouseout", mouseOut);
		}


        resetDisplayNone();

		numeroPagine=immaginiFolio.length;
		indicePagina=0;

		for(var i=0; i<numeroPagine; i++){
			immaginiFolio[i].setAttribute("style","display:none");
		}
  
		
		for (var j=0; j<numeroPagine; j++){
			if (testoFolio[j]!=null){
				for (var i=0;i<testoFolio[j].length;i++) {
					testoFolio[j][i].setAttribute("hidden","hidden");
				}
			}
		}
		
		cambiaFoto(0);

	} catch(e){
		alert("gestoreLoad"+e);
	}
}


/*main*/
window.onload=gestoreLoad;
