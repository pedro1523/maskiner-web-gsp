<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="csscontenido" value="/styles/contentStyles/generarOrdenTrabajo_Paso1.css" />
<link href="${csscontenido}" rel="stylesheet" type="text/css" />

<title>Insert title here</title>

<%
	String fecha = FormatoFecha.getFechaActual();
	UsuarioBean usr = (UsuarioBean)session.getAttribute("usuariologueado");
	String registrador = usr.getCodigoUsuario() + " - " + usr.getApellidoPaterno()
				 + " " + usr.getApellidoMaterno();
	request.setAttribute("fechaactual",fecha);
	request.setAttribute("registrador",registrador);
%>

</head>
<body>
  <h2 class="titulo"><bean:message key="pages.programartrabajo.generarot_p1.titulo" /></h2>
  <h3 class="subtitulo"><bean:message key="pages.programartrabajo.generarot_p1.subtitulo" /></h3>
    <div class="separadovertical">
      <label for="txtRegistrador"><bean:message key="pages.programartrabajo.generarot_p1.lblCodRegistrador" /></label>
      <input type="text" id="txtRegistrador" readonly="readonly" style="width: 200px"
      value="${registrador}" />
      
      <label for="txtFecha"><bean:message key="pages.programartrabajo.generarot_p1.lblFechaRegistro" /></label>
      <input type="text" id="txtFecha" readonly="readonly" value="${fechaactual}" />
    </div>
    <div class="separadovertical">
      <html:form method="post" action="a_cargarBuscarIncidente?formOrigen=generarOT">
	      <label for="txtCodIncidente"><bean:message key="pages.programartrabajo.generarot_p1.lblCodIncidente" /></label>
	      <html:text property="numIncidente" styleId="txtCodIncidente" size="6" maxlength="6" value="${sessionScope.b_incidente.strNumeroIncidente}"/>
		  <html:image src="images/buscar_azul.gif"/>
		  <div class="mensajeerror separadovertical"><html:errors/></div>
      </html:form>
    </div>
    <div class="separadovertical">
      <label for="txtCliente"><bean:message key="pages.programartrabajo.generarot_p1.lblCliente" /></label>
      <input type="text" id="txtCliente" readonly="readonly" style="width: 150px" value="${sessionScope.b_incidente.strRazonSocialCliente}" />
    </div>
    <span class="titulotabla"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.titulotabla" /></span>
    <table width="100%" border="0" class="gridview">
      <tr>
        <th width="7%" scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna1.cabecera" /></th>
        <th width="13%" scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna2.cabecera" /></th>
        <th width="19%" scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna3.cabecera" /></th>
        <th width="12%" scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna4.cabecera" /></th>
        <th width="13%" scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna5.cabecera" /></th>
        <th width="26%" scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna6.cabecera" /></th>
        <th scope="col"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna7.cabecera" /></th>
      </tr>
	  <logic:present name="b_incidente">
		<c:set var="itm" value="1" />
		<logic:iterate id="b_maq" name="b_incidente" property="arrMaquinariasXIncidente">
			<tr>
				<td align="center">${itm}</td>
				<td><bean:write name="b_maq" property="strNumeroTarjetaEquipo" /></td>
				<td><bean:write name="b_maq" property="strDescripcionMaquinaria" /></td>
				<td><bean:write name="b_maq" property="strMarcaMaquinaria" /></td>
				<td><bean:write name="b_maq" property="strModeloMaquinaria" /></td>
				<td><bean:write name="b_maq" property="strDescripcionAveria"/></td>
        		<td align="center">
        			<logic:equal name="b_maq" property="intEstadoAveria" value="1">
        				<span style="color: red; font-weight: bold"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna7.mensajeEstadoAveria1" /></span>
        			</logic:equal>
        			<logic:equal name="b_maq" property="intEstadoAveria" value="2">
	 			    	<html:link action="a_cargarGenerarOT_paso2?numtarj=${b_maq.strNumeroTarjetaEquipo}">
				    		<html:img src="images/generar.png"/>
				    	</html:link>
        			</logic:equal>
         			<logic:equal name="b_maq" property="intEstadoAveria" value="3">
        				<span style="color: green; font-weight: bold"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.columna7.mensajeEstadoAveria3" /></span>
        			</logic:equal>
        		</td>
			</tr>
			<c:set var="itm" value="${itm+1}"  />
		</logic:iterate>
	  </logic:present>
	  <logic:empty name="b_incidente">
	  	<tr>
	  		<td colspan="7"><bean:message key="pages.programartrabajo.generarot_p1.listaAverias.sinDatosParaMostrar" /></td>
	  	</tr>
	  </logic:empty>
	  
    </table>
    <div class="separadovertical margenderecho" align="right"> 
    	<html:link action="a_homepage">
    		<html:img src="images/salir.png"/>
    	</html:link>
    </div>
 </body>
</html>