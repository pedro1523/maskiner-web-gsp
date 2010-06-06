<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

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
<body onload="document.forms[0].txtCodIncidente.focus()">
  <h2 class="titulo"><s:text name="pages.programartrabajo.generarot_p1.titulo" /></h2>
  <h3 class="subtitulo"><s:text name="pages.programartrabajo.generarot_p1.subtitulo" /></h3>
    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p1.lblCodRegistrador" />
      <span class="negrita margenderecho">${registrador}</span>
      
      <s:text name="pages.programartrabajo.generarot_p1.lblFechaRegistro" />
      <span class="negrita">${fechaactual}</span>
     </div>
    <div class="separadovertical">
      <s:form method="post" action="a_cargarBuscarIncidente?formOrigen=generarOT">
	      <label for="txtCodIncidente"><s:text name="pages.programartrabajo.generarot_p1.lblCodIncidente" /></label>
	      <s:textfield name="numIncidente"  id="txtCodIncidente" size="6" maxlength="6"/>
	     
		  <s:submit type="image" src="images/buscar_azul.gif"/>
		  <div class="mensajeerror separadovertical">
		  	<s:actionerror/>
		  </div>
      </s:form>
    </div>
    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p1.lblCodIncidente" />
      <span class="negrita margenderecho"><s:property value="#session.b_incidente.strNumeroIncidente"/></span>
    </div>
    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p1.lblCliente" />
      <span class="negrita margenderecho"><s:property value="#session.b_incidente.strRazonSocialCliente"/></span>
    </div>
    <span class="titulotabla"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.titulotabla" /></span>
    <table width="100%" border="0" class="gridview">
      <tr>
        <th width="7%" scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna1.cabecera" /></th>
        <th width="13%" scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna2.cabecera" /></th>
        <th width="19%" scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna3.cabecera" /></th>
        <th width="12%" scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna4.cabecera" /></th>
        <th width="13%" scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna5.cabecera" /></th>
        <th width="26%" scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna6.cabecera" /></th>
        <th scope="col"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna7.cabecera" /></th>
      </tr>
      
      <s:if test="%{#session.b_incidente != null}">
      	<s:if test="%{#session.b_incidente.arrMaquinariasXIncidente.size()>0}">
			<s:set var="itm" value="1" />
			<s:iterator var="b_maq" value="#session.b_incidente.arrMaquinariasXIncidente"  >
				<tr>
					<td align="center">${itm}</td>
					<td><s:property value="#b_maq.strNumeroTarjetaEquipo"/></td>
					<td><s:property value="#b_maq.strDescripcionMaquinaria" /></td>
					<td><s:property value="#b_maq.strMarcaMaquinaria" /></td>
					<td><s:property value="#b_maq.strModeloMaquinaria" /></td>
					<td><s:property value="#b_maq.strDescripcionAveria"/></td>
	        		<td align="center">
	        			<s:if test="#b_maq.intEstadoAveria==1">
	        				<span style="color: red; font-weight: bold"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna7.mensajeEstadoAveria1" /></span>
	         			</s:if>
	         			<s:if test="#b_maq.intEstadoAveria==2">
	         				<s:url var="urlCargarOTPaso2" action="a_cargarGenerarOT_paso2">
	         					<s:param name="numtarj">${b_maq.strNumeroTarjetaEquipo}</s:param>
	         				</s:url>
	         				<s:a href="%{urlCargarOTPaso2}">
	         					<img src="images/generar.png" />
	         				</s:a>
	         			</s:if>
	         			<s:if test="#b_maq.intEstadoAveria==3">
	        				<span style="color: green; font-weight: bold"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.columna7.mensajeEstadoAveria3" /></span>
	         			</s:if>
	        		</td>
				</tr>
				<s:set var="itm" value="#itm+1"  />
			</s:iterator>
		</s:if>
      	<s:else>
	 	  	<tr>
		  		<td colspan="7"><s:text name="pages.programartrabajo.generarot_p1.listaAverias.sinDatosParaMostrar" /></td>
		  	</tr>
      	</s:else>
	  </s:if>
	  
    </table>
    <div class="separadovertical margenderecho" align="right"> 
    	<s:a action="a_homepage">
    		<img src="images/salir.png" />
    	</s:a>
    </div>
 </body>
</html>