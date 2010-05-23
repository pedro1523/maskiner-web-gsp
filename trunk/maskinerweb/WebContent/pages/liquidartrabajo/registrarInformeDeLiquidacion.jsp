<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean"%>
<%
	ArrayList<MaterialesXLiquidacionBean> MaterialesIni = new ArrayList<MaterialesXLiquidacionBean>();
	session.setAttribute("materialesIni",MaterialesIni);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	function buscarMaterialInterno(){
		document.forms["frmRegistrarLiquidacion"].action="<%=request.getContextPath()%>/a_cargarBuscarMateriales.do";
		document.forms["frmRegistrarLiquidacion"].submit();
	}
	function agregarMaterial(){
		document.forms["frmRegistrarLiquidacion"].action="<%=request.getContextPath()%>/a_agregarMaterialAlista.do";
		document.forms["frmRegistrarLiquidacion"].submit();
	}
</script>

</head>
<body>
<h2 class="titulo">Registrar Informe de Liquidación</h2>
<html:form styleId="frmRegistrarLiquidacion"
	action="a_registrarInformeLiquidacion">
	<div class="separadovertical">
<label for="txtNumOrdenTrabajo">N°Orden de Trabajo:</label> 
<html:text property="numOrdenTrabajo" value="${strNumeroOT}" readonly="true"></html:text></div>
	<fieldset><legend>Datos de la Maquina</legend>
	<table class="separadovertical">
		<tbody>
			<tr>
				<td style="padding:  5px 5px 5pt 5px;"><label>N° Tarjeta de Equipo </label></td>
				<td width="10"> : </td>
				<td>
					<bean:write name="b_maquinaria" property="strNumTarjeta"/>
				</td>
				<td width="20"></td>
				<td style="5pt 5px 5pt 5px;"><label>Modelo </label></td>
				<td width="10"> : </td>
				<td style="padding: 0pt 0pt 0pt 5px;">
				<bean:write name="b_maquinaria" property="strModMaquinaria"/></td>
			</tr>
			<tr>
				<td style="padding: 5px 5px 5pt 5px;"><label>Marca </label></td>
				<td width="10"> : </td>
				<td>
				<bean:write name="b_maquinaria" property="strDescMarMaq"/>
				</td>
				<td width="20"></td>
				<td style="padding: 5px 5px 5pt 5px;"><label>N°de Serie  </label></td>
				<td width="10"> : </td>
				<td><bean:write name="b_maquinaria" property="strNumSerieMaquinaria"/>  </td>
			</tr>
		</tbody>
	</table>
	<table>
		<tbody>
			<tr>
				<td style="height: 25px"><label>Ubicación </label></td>
				<td width="10"> : </td>
				<td style="padding: 0pt 0pt 0pt 5px;">
				<bean:write name="b_maquinaria" property="strDirSucursal"/></td>
			</tr>
			<tr>
				<td><label>Valor en Horómetro</label></td>
				<td width="10"> : </td>
				<td style="padding: 0pt 0pt 0pt 5px;">
				<html:text property="valorHorometro" readonly="false" value="${b_maquinaria.strMedHorometro}">
				</html:text></td>
			</tr>
		</tbody>
	</table>
	</fieldset>
	<br />
	<fieldset style=""><legend>Datos de la Atención</legend>
	<table>
		<tbody>
			<tr>
				<td style="padding: 8px; background-color: rgb(238, 238, 238);">
				<table>
					<tbody>
						<tr>
							<td colspan="2"><label>Materiales Adicionales
							Utilizados</label> <input type="radio" checked="checked" name="Material"/> </td>
							<td></td>
						</tr>
						<tr>
							<td><label>Material:</label></td>
							<td><html:text property="materialInterno" readonly="true" value="${b_material.strDescTipoMaterial}"></html:text></td>
							<td><html:link href="javascript:buscarMaterialInterno();">
								<html:img src="images/buscar_azul.gif" />
							</html:link></td>
						</tr>
						<tr>
							<td><label>Descripción:</label></td>
							<td><html:text property="descripcionMaterialInterno" readonly="true" value="${b_material.strDescripMaterial}"></html:text>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				</td>
				<td></td>
				<td></td>
				<td style="padding: 8px; background-color: rgb(238, 238, 238);">
				<table>
					<tbody>
						<tr>
							<td><label>Material Externo:</label></td>
							<td> <input type="radio" name="Material"/></td>
						</tr>
						<tr>
							<td><label>Descripción: </label></td>
							<td><html:text property="descripcionMaterialExterno"></html:text>
							</td>
						</tr>
						<tr>
							<td><label> Monto Unitario:</label></td>
							<td><html:text property="montoUnitarioMaterialExterno"></html:text>
							</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<br />
	<table>
		<tbody>
			<tr>
				<td width="59"><label>Cantidad: </label></td>
				<td width="111"><html:text property="cantidadMaterial"></html:text>
				</td>
				<td width="124"><html:link href="javascript:agregarMaterial();">
					<html:img src="images/agregar.png" />
				</html:link></td>
			</tr>
		</tbody>
	</table>
    <logic:present name="mensajeerror" scope="request">
	  	<div class="mensajeerror separadoverticalsuperior"><bean:write name="mensajeerror" scope="request"/> </div>
	</logic:present>
	<br />
	<table cellpadding="5" cellspacing="0" class="gridview" width="100%">
		<tbody>
			<tr align="center">
				<th>Item</th>
				<th>Tipo</th>
				<th>Descripción</th>
				<th>Cantidad</th>
				<th>Prec.Uni (S/.)</th>
				<th>Total (S/.)</th>
			</tr>
			<tr>
     			<c:forEach var="material" items="${Materiales}">
     				<tr>
						<td>${material.intItem}</td>
     					<td>${material.strDescripTipoMaterial}</td>
     					<td>${material.strDescripMaterial}</td>
     					<td>${material.intCantidad}</td>
						<td>${material.decPrecioUnitario}</td>
						<td>${material.decMontoTotal}</td>
     				</tr>
     			</c:forEach>
     		</tr>
				

		</tbody>
	</table>
	<br />
	<span class="titulotabla">Ingrese las horas trabajadas por los
	técnicos</span>
	<table cellpadding="5" cellspacing="0" class="gridview">
		<tr>
			<th align="center">Nombre</th>
			<th align="center">Hora Inicio</th>
			<th align="center">Hora Fin</th>
		</tr>
		<tr>
   			<c:forEach var="tecnico" items="${tecnicos}">
   				<tr>
	   				<td>${tecnico.strNombreCompleto}</td>
					<td><html:text property="horaInicio" value=""></html:text></td>
					<td><html:text property="horaFin" value=""></html:text></td>
   				</tr>
   			</c:forEach>
     	</tr>
	</table>
	<br />
	<label>Descripción de Atención Realizada:</label> <br />
	<html:textarea property="descripcionAtencionRealizada"
		style="width: 97%; height: 50px;"></html:textarea> <br />
	<br />
	<label>Aporte de Conocimiento:</label> <br />
	<html:textarea property="aporteConocimiento"
		style="width: 97%; height: 50px;"></html:textarea></fieldset>
    <logic:present name="mensajeerror1" scope="request">
	  	<div class="mensajeerror separadoverticalsuperior"><bean:write name="mensajeerror1" scope="request"/> </div>
	</logic:present>
	<div class="separadoverticalsuperior" align="right">
		<html:image src="images/registrar.png"></html:image> 
		<html:link action="a_homepage">
			<html:img src="images/salir.png" />
		</html:link>
	</div>
</html:form>

</body>
</html>