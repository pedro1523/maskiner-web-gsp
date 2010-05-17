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
<h2 class="titulo">Aprobar Prefactura</h2>
<html:form action="a_buscarPrefacturas"
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

      <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
          <th width="7%" align="center">Item</th>
          <th width="17%" align="center">Nª Prefacrura</th>
          <th width="29%" align="center">Nª Incidente</th>
          <th width="36%" align="center">Fecha Incidente</th>
          <th width="11%" align="center">Aprobar Prefactura</th>
        </tr>
<%int i=0; %>
<c:forEach var="lista" items="${requestScope.listPrefactura}"> 
<%i++;%>
		<tr>
          <td align="center"><%=i%></td>
          <td align="center">${lista.strNumPrefactura}</td>
          <td align="center">${lista.strNumOrdTrabajo}</td>
          <td align="center">${lista.strFecIncidente}</td>
          <td align="center">
			<html:link action="a_mostrarPrefactura?prefactura=${lista.strNumPrefactura}&incidente=${lista.strNumOrdTrabajo}">
			<img src="images/nuevo_azul.gif" alt="" border="0" />
			</html:link>
			</td>
        </tr>

</c:forEach>


        
      </table>
      <div class="separadovertical margenderecho" align="right">
			 <a href="index.html">
				<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
			</a>
	 </div>

</body>
</html>