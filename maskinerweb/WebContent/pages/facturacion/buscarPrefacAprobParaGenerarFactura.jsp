<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<sj:head jqueryui="true"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url var="jsCalendar" value="/javascript/triga_calendar/calendar_pe.js" />
	<c:url var="jsCalendarCss" value="/javascript/triga_calendar/calendar.css" />
	<c:url var="jsCalendarImagePath" value="/javascript/triga_calendar/img/" />
	<script language="JavaScript" src="${jsCalendar}"></script>
	<link rel="stylesheet" href="${jsCalendarCss}">
<title>Insert title here</title>
</head>
<body>
<h2>Generar factura</h2>
    <s:form action="a_cpm_buscarPrefacturasAprobadas"
		method="post"> 
		<fieldset>
			<legend>Criterios:</legend>
			<div class="separadovertical"> 
			<label for="txtNombreEmpresa">Nombre de la empresa</label> 
			<s:textfield name="nombreEmpresa" id="txtNombreEmpresa"
				></s:textfield> 
			<label for="txtFechIncidente" class="margenizquierdo">Fecha de incidente</label> 
			<sj:datepicker name="fechaIncidente"
							   buttonImageOnly="true"
							   id="fechaInspeccion"
							   size="10" 
							   displayFormat="dd/mm/yy"
							   changeYear="true"
							   changeMonth="true"
							   cssStyle="margin-right:5px" />
			<label for="txtIncidente" class="margenizquierdo">Incidente</label>
				<s:textfield name="incidente" id="txtIncidente" ></s:textfield>
			</div>
			<div class="separadoverticalsuperior" align="right">
				<s:submit type="image"	src="images/buscar.png"></s:submit>
			</div>
		</fieldset>
	</s:form>
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
<s:iterator var="lista" value="#session.listPrefactura" > 
<%i++;%>
		<tr>
          <td align="center"><%=i%></td>
          <td align="center"><s:property value="#lista.strCodCliente"/> </td>
          <td align="center"><s:property value="#lista.strNumPrefactura"/> </td>
          <td align="center"><s:property value="#lista.strNumIncidente"/> </td>
		  <td align="center"><s:property value="#lista.strFechaIncidente"/> </td>
          <td align="center">
          	<s:url var="v_generarFactura" value="a_cpm_generarFactura">
          		<s:param name="prefactura">${lista.strNumPrefactura}</s:param>
          	</s:url>
          	<s:a href="%{v_generarFactura}">
          		<img src="images/nuevo_azul.gif" alt="" border="0" />
          	</s:a>
          
			</td>
        </tr>

</s:iterator>
    
      </table>
              <div class="separadovertical margenderecho" align="right">
	               <a href="index.html">
	               	<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
	               </a>
               </div>


</body>
</html>