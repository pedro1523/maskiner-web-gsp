
/* Borra los errores de validaci�n en los reportes */
function borrarErrores(fieldError){
	var err = document.getElementById(fieldError);
	err.innerHTML="";
}

/* Solo n�meros */
function isNumberKey(evt){
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;
}

