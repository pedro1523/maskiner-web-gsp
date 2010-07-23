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

<title>Insert title here</title>
</head>
<body>
<h2 class="titulo">Buscar Prefactura</h2>
<s:form action="a_cpm_buscarPrefacturas"> 
		<fieldset>
			<legend>Criterios:</legend>
			<div class="separadovertical"> 
			<label for="txtNombreEmpresa">Nombre de la empresa</label> 
			<s:textfield name="nombreEmpresa" id="txtNombreEmpresa" >  </s:textfield> 
			<label for="txtFechIncidente" class="margenizquierdo">Fecha de incidente</label> 
			<!--<s:textfield	name="fechaIncidente" id="txtFechIncidente" ></s:textfield>-->
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
			<!--<html:image	src="images/buscar.png"></html:image>--></div>
			<s:submit type="image" src="images/buscar.png"></s:submit>
		</fieldset>
	</s:form>

      <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
          <th width="7%" align="center">Item</th>
          <th width="17%" align="center">Nª Prefacrura</th>
          <th width="29%" align="center">Nª Incidente</th>
          <th width="36%" align="center">Fecha Incidente</th>
          <th width="11%" align="center">Aprobar Prefactura</th>
        </tr>
<%int i=0; %>
			 <s:iterator var="lista" value="#session.listPrefactura1">
			 <%++i;%>
			 	<tr>
			 		<td align="center"><%=i%></td>
			        <td align="center"> <s:property value="#lista.strNumPrefactura"/> </td>
			        <td align="center"><s:property value="#lista.strNumOrdTrabajo"/> </td>
			        <td align="center"><s:property value="#lista.strFecIncidente"/></td>
			        <td align="center">
			          <s:url var="mostrarPrefactura" action="a_cpm_mostrarPrefactura">
			          	<s:param name="prefactura">${lista.strNumPrefactura}</s:param>
			          	<s:param name="incidente">${lista.strNumOrdTrabajo}</s:param>
			          </s:url>
			          <s:a href="%{mostrarPrefactura}">
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