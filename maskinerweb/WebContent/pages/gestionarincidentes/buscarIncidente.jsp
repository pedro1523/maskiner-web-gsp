<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<sj:head jqueryui="true"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
    
</head>
<body>
	<h2 class="titulo">Buscar incidente de servicio</h2>
	<s:url var="actionFormUrl" action="a_buscarIncidentes">
		<!-- ${param.formOrigen} -->
		<s:param name="formOrigen"><s:property value="formOrigen"/></s:param>
	</s:url>
	<s:form action="%{actionFormUrl}" method="post">
		<fieldset>
			<legend>Criterios:</legend>
			<div class="separadovertical"> 
				<label for="txtNombreEmpresa">Nombre de la empresa</label> 
				<s:textfield name="nombreEmpresa" id="txtNombreEmpresa" cssStyle="width:100px"/>
				<label for="txtFechIncidente" class="margenizquierdo">Fecha de incidente</label>
				<sj:datepicker name="fechaIncidente"
							   buttonImageOnly="true"
							   id="txtFechIncidente"
							   size="10" 
							   displayFormat="dd/mm/yy"
							   changeYear="true"
							   changeMonth="true"
							   cssStyle="margin-right:5px" />
				
				<label for="txtIncidente" class="margenizquierdo">Incidente</label>
				<s:textfield name="incidente" id="txtIncidente" cssStyle="width:150px"/>
			</div>
			<div class="separadoverticalsuperior" align="right">
				<s:url var="imgBuscarUrl" value="/images/buscar.png"/>
				<s:submit type="image" src="%{imgBuscarUrl}" />
			</div>
		</fieldset>
	</s:form>
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
		<s:if test="%{#request.arr_incidentes!=null}">
			<s:if test="%{#request.arr_incidentes.size()==0}">
				<tr>
					<td colspan="5">Sin coincidencias</td>
				</tr>
			</s:if>
			<s:else>
				<s:iterator var="b_incid" value="#request.arr_incidentes">
					<tr>
						<td align="center">
							<s:url var="linkDevolResult" action="a_buscarIncidenteDevolverResultado">
								<s:param name="numIncidente">${b_incid.strNumeroIncidente}</s:param>
								<s:param name="formOrigen"><s:property value="formOrigen"/></s:param>
							</s:url>
							<a href="${linkDevolResult}">
								<img alt="Seleccionar" src="images/aprob_azul.gif">
							</a>
						</td>
						<td><s:property value="#b_incid.strNumeroIncidente"/></td>
						<td><s:property value="#b_incid.dtFechaIncidente"/></td>
						<td><s:property value="#b_incid.strDescripcionIncidente"/></td>
						<td><s:property value="#b_incid.strRazonSocialCliente"/></td>
					</tr>
				</s:iterator>
			</s:else>
		</s:if>
	</table>
	
	<div class="separadovertical" align="right">
		<s:url var="linkIrPagOrigen" action="a_buscarIncidenteIrAPaginaOrigen">
			<s:param name="formOrigen"><s:property value="formOrigen"/></s:param>
		</s:url>
		<a href="${linkIrPagOrigen}">
			<s:url var="imgCancelarUrl" value="/images/cancelar.png"/>
			<img src="${imgCancelarUrl}" alt="Cancelar" width="71" height="25" border="0" />
		</a>
	</div>
</body>
</html>