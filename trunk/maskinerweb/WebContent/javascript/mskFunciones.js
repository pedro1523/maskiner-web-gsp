
/* Borra los errores de validación en los reportes */
function borrarErrores(fieldError){
	var err = document.getElementById(fieldError);
	err.innerHTML="";
}

/* Solo números */
function isNumberKey(evt){
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;
}

