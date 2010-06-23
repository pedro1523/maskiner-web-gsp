<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url var="jsCalendar" value="/javascript/triga_calendar/calendar_pe.js" />
	<c:url var="jsCalendarCss" value="/javascript/triga_calendar/calendar.css" />
	<c:url var="jsCalendarImagePath" value="/javascript/triga_calendar/img/" />
	<script language="JavaScript" src="${jsCalendar}"></script>
	<link rel="stylesheet" href="${jsCalendarCss}">
<title>Insert title here</title>
</head>
<body>
<h2>Generar Factura</h2>
    <html:form action="a_buscarPrefacturasAprobadas"
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
      <table width="100%" class="gridview" cellpadding="5" cellspacing="0">
          <thead>
          <span class="titulotabla">Prefacturas aprobadas:</span>
          </thead>
        <tr>
          <th width="46" align="center">Item</th>
          <th width="82" align="center">Cliente</th>
          <th width="137" align="center">Nº Prefactura</th>
          <th width="166" align="center">N° Incidente</th>
          <th width="183" align="center">Fecha Incidente</th>
          <th width="74" align="center">Generar Factura</th>
        </tr>
       <%int i=0; %>
<c:forEach var="lista" items="${requestScope.listPrefactura}"> 
<%i++;%>
		<tr>
          <td align="center"><%=i%></td>
          <td align="center">${lista.strCodCliente}</td>
          <td align="center">${lista.strNumPrefactura}</td>
          <td align="center">${lista.strNumIncidente}</td>
		  <td align="center">${lista.strFechaIncidente}</td>
          <td align="center">
			<html:link action="a_generarfactura?prefactura=${lista.strNumPrefactura}">
			<img src="images/nuevo_azul.gif" alt="" border="0" />
			</html:link>
			</td>
        </tr>

</c:forEach>
    
      </table>
              <div class="separadovertical margenderecho" align="right"> <a href="index.html"><img src="images/salir.png" alt="Salir" width="71" height="25" border="0" /></a> </div>


</body>
</html>