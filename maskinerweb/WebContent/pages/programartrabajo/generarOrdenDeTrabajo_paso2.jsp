<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:url var="csscontenido" value="/styles/contentStyles/generarOrdenTrabajo_Paso2.css" />
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
  <h2 class="titulo"><s:text name="pages.programartrabajo.generarot_p2.titulo" /></h2>
  <h3 class="subrayado"><s:text name="pages.programartrabajo.generarot_p2.subtitulo" /></h3>

    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p2.lblRegistrador" />
      <span class="negrita margenderecho">${registrador}</span>
      <s:text name="pages.programartrabajo.generarot_p2.lblFecha" />
      <span class="negrita">${fechaactual}</span>
    </div>
    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p2.lblCodIncidente" />
      <span class="negrita margenderecho">${sessionScope.b_ordentrabajo.strNumIncidente}</span>
      <s:text name="pages.programartrabajo.generarot_p2.lblCliente" />
      <span class="negrita"><s:property value="#session.b_incidente.strRazonSocialCliente"/></span>
    </div>
    
    <fieldset>
      <legend><s:text name="pages.programartrabajo.generarot_p2.fieldsetEquipo" /></legend>
      <div class="separadoverticalinferior">
        <s:text name="pages.programartrabajo.generarot_p2.lblNumTarjeta" />
        <span class="negrita margenderecho">${sessionScope.b_ordentrabajo.strNumTarjeta}</span>
        <s:text name="pages.programartrabajo.generarot_p2.lblDescripcion" />
        <span class="negrita margenderecho"><s:property value="#session.b_ordentrabajo.strDescripcionMaquinaria"/></span>
        <s:text name="pages.programartrabajo.generarot_p2.lblMarca" />
        <span class="negrita"><s:property value="#session.b_ordentrabajo.strMarcaMaquinaria"/></span>
      </div>
      <div>
        <s:text name="pages.programartrabajo.generarot_p2.lblModelo" />
        <span class="negrita margenderecho"><s:property value="#session.b_ordentrabajo.strModeloMaquinaria"/></span>
        <s:text name="pages.programartrabajo.generarot_p2.lblAveria" />
        <span class="negrita"><s:property value="#session.b_ordentrabajo.strDescripcionAveria"/></span>
      </div>
      
    </fieldset>
    
    <fieldset class="separadovertical">
      <legend><s:text name="pages.programartrabajo.generarot_p2.fieldsetAsignarPaquetes" /></legend>
      	<s:url var="buscarPaqueteUrl" action="a_mostrarBuscarPaquete">
      		<s:param name="codMaquinaria">${sessionScope.b_ordentrabajo.strCodMaquinaria}</s:param>
      	</s:url>
		<s:text var="agregarImgi18n" name="pages.botones.agregar" />
		<s:url var="agregarImgUrl" value="%{agregarImgi18n}" />
      	<a href="${buscarPaqueteUrl}">
      		<img alt="Agregar" src="${agregarImgUrl}" style="vertical-align:middle;">
      	</a>
      	<s:if test="%{#session.b_ordentrabajo.arrPaquetesXOT.size()>0}">
			<div class="separadoverticalsuperior">
		        <table width="70%" border="0" cellpadding="5" cellspacing="0" class="gridview">
		        	<tr>
			            <th width="8%" scope="col"><s:text name="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna1" /></th>
			            <th width="20%" scope="col"><s:text name="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna2" /></th>
			            <th width="49%" scope="col"><s:text name="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna3" /></th>
			            <th scope="col"><s:text name="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna4" /></th>
		        	</tr>
					<c:set var="itm" value="1" />
					<s:iterator var="b_paqot" value="#session.b_ordentrabajo.arrPaquetesXOT">
						<tr>
							<td align="center">${itm}</td>
							<td><s:property value="#b_paqot.strCodPaquete"/></td>
							<td><s:property value="#b_paqot.strNombrePaquete"/></td>
			        		<td align="center">
			        			<s:url action="a_cnm_quitarPaqueteDeOT" var="quitarPaqueteUrl">
			        				<s:param name="codPqte"><s:property value="#b_paqot.strCodPaquete"/></s:param>
			        			</s:url>
			        			<s:url value="images/quitar.gif" var="imagenQuitarUrl"/>
			        			<a href="${quitarPaqueteUrl}">
			        				<img alt="Quitar" src="${imagenQuitarUrl}">
			        			</a>
			        		</td>
						</tr>
						<c:set var="itm" value="${itm+1}"  />
					</s:iterator>
	 	    	</table>
	    	</div>
       	</s:if>
       	<s:if test="%{#request.mensajeerror!=null}">
		  	<div class="mensajeerror separadoverticalsuperior"><s:property value="#request.mensajeerror"/></div>
       	</s:if>
    </fieldset>
    <div class="separadovertical margenderecho" align="right"> 
    
		<s:text var="atrasImgi18n" name="pages.botones.atras" />
		<s:url var="atrasImgUrl" value="%{atrasImgi18n}" />
    	<s:a action="a_cnm_irAGenerarOT_paso1">
    		<img alt="Atrás" src="${atrasImgUrl}"/>
    	</s:a>
    
 		<s:text var="siguienteImgi18n" name="pages.botones.siguiente" />
		<s:url var="siguienteImgUrl" value="%{siguienteImgi18n}" />
    	<s:a action="a_cnm_cargarGenerarOT_paso3">
    		<img alt="Siguiente" src="${siguienteImgUrl}">
    	</s:a>
    
 		<s:text var="salirImgi18n" name="pages.botones.salir" />
		<s:url var="salirImgUrl" value="%{salirImgi18n}" />
    	<s:a action="a_homepage">
    		<img alt="Salir" src="${salirImgUrl}">
    	</s:a>
    </div>
    <s:if test="#request.mensajeerror1!=null">
	  	<div class="mensajeerror separadoverticalsuperior"><s:property value="#request.mensajeerror1"/></div>
    </s:if>

</body>
</html>