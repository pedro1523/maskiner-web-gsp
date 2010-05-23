<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<c:url var="jsCalendar" value="/javascript/triga_calendar/calendar_pe.js" />
	<c:url var="jsCalendarCss" value="/javascript/triga_calendar/calendar.css" />
	<c:url var="jsCalendarImagePath" value="/javascript/triga_calendar/img/" />


	<script language="JavaScript" src="${jsCalendar}"></script>
	<link rel="stylesheet" href="${jsCalendarCss}">

<title>Insert title here</title>
    
</head>
<body>
	<h2 class="titulo">Buscar incidente de servicio</h2>
	<html:form action="a_buscarIncidentes?formOrigen=${param.formOrigen}"
		method="post">
		<fieldset>
			<legend>Criterios:</legend>
			<div class="separadovertical"> 
			<label for="txtNombreEmpresa">Nombre de la empresa</label> 
			<html:text property="nombreEmpresa" styleId="txtNombreEmpresa"
				style=" width:100px"></html:text> 
			<label for="txtFechIncidente" class="margenizquierdo">Fecha de incidente</label> 
			<html:text	property="fechaIncidente" styleId="txtFechIncidente" size="10"></html:text>
				<script language="JavaScript">
					// whole calendar template can be redefined per individual calendar
					var A_CALTPL = {
						'months' : ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
						'weekdays' : ['do', 'lu', 'ma', 'mi', 'ju', 'vi', 'sa'],
						'yearscroll': true,
						'weekstart': 0,
						'centyear'  : 70,
						'imgpath' : '${jsCalendarImagePath}'
					};
					
					new tcal ({
						// if referenced by ID then form name is not required
						'controlname': 'txtFechIncidente'
					}, A_CALTPL);
				</script> <label for="txtIncidente" class="margenizquierdo">Incidente</label>
				<html:text property="incidente" styleId="txtIncidente" style=" width:150px"></html:text>
			</div>
			<div class="separadoverticalsuperior" align="right"><html:image
				src="images/buscar.png"></html:image></div>
		</fieldset>
	</html:form>
	<div class="titulotabla">Incidentes pendientes</div>
	<table width="100%" border="0" cellpadding="5" cellspacing="0"
		class="gridview">
		<tr>
			<th width="7%" scope="col">Seleccionar</th>
			<th width="14%" scope="col">Cód. Incidente</th>
			<th width="14%" scope="col">Fecha</th>
			<th width="37%" scope="col">Descripción de incidente</th>
			<th width="28%" scope="col">Nombre empresa</th>
		</tr>
		<logic:present name="arr_incidentes">
			<bean:size id="sizeArray" name="arr_incidentes" />
			<c:choose>
				<c:when test="${sizeArray==0}">
					<tr>
						<td colspan="5">Sin coincidencias</td>
					</tr>
				</c:when>
				<c:otherwise>
					<logic:iterate id="b_incidente" name="arr_incidentes">
						<tr>
							<td align="center"><html:link
								action="a_buscarIncidenteDevolverResultado?numIncidente=${b_incidente.strNumeroIncidente}&formOrigen=${param.formOrigen}">
								<html:img src="images/aprob_azul.gif" />
							</html:link></td>
							<td><bean:write name="b_incidente" property="strNumeroIncidente" /></td>
							<td><bean:write name="b_incidente" property="dtFechaIncidente"
								format="dd/MM/yyyy" /></td>
							<td><bean:write name="b_incidente"
								property="strDescripcionIncidente" /></td>
							<td><bean:write name="b_incidente"
								property="strRazonSocialCliente" /></td>
						</tr>
					</logic:iterate>
				</c:otherwise>
			</c:choose>
		</logic:present>
	
	</table>
	
	
	
	<div class="separadovertical" align="right"><html:link
		action="a_buscarIncidenteIrAPaginaOrigen?formOrigen=${param.formOrigen}">
		<img src="images/cancelar.png" alt="Cancelar" width="71" height="25"
			border="0" />
	</html:link></div>
	

</body>
</html>