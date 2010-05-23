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
  <h2 class="titulo"><bean:message key="pages.programartrabajo.generarot_p2.titulo" /></h2>
  <h3 class="subrayado"><bean:message key="pages.programartrabajo.generarot_p2.subtitulo" /></h3>
  <form action="" method="post">
    <div class="separadovertical">
      <label for="txtRegistrador"><bean:message key="pages.programartrabajo.generarot_p2.lblRegistrador" /></label>
      <input type="text" id="txtRegistrador" style="width: 160px" readonly="readonly" value="${registrador}" />
      <label for="txtFecha" class="margenizquierdo"><bean:message key="pages.programartrabajo.generarot_p2.lblFecha" /></label>
      <input type="text" id="txtFecha" style="width: 60px" readonly="readonly" value="${fechaactual}" />
    </div>
    <div class="separadovertical">
      <label for="txtCodIncidente"><bean:message key="pages.programartrabajo.generarot_p2.lblCodIncidente" /></label>
      <input type="text" id="txtCodIncidente" style="width: 40px" readonly="readonly" value="${sessionScope.b_ordentrabajo.strNumIncidente}" />
      <label for="txtCliente" class="margenizquierdo"><bean:message key="pages.programartrabajo.generarot_p2.lblCliente" /></label>
      <input type="text" id="txtCliente" style="width: 150px" readonly="readonly" value="${sessionScope.b_incidente.strRazonSocialCliente}" />
    </div>
    
    <fieldset>
      <legend><bean:message key="pages.programartrabajo.generarot_p2.fieldsetEquipo" /></legend>
      <div class="separadoverticalinferior">
        <label for="txtNumTarjeta"><bean:message key="pages.programartrabajo.generarot_p2.lblNumTarjeta" /></label>
        <input type="text" id="txtNumTarjeta" style="width: 40px" readonly="readonly" value="${sessionScope.b_ordentrabajo.strNumTarjeta}" />
        <label for="txtDescripcion" class="margenizquierdo"><bean:message key="pages.programartrabajo.generarot_p2.lblDescripcion" /></label>
        <input type="text" id="txtDescripcion" style="width: 250px" readonly="readonly" value="${sessionScope.b_ordentrabajo.strDescripcionMaquinaria}" />
        <label for="txtMarca" class="margenizquierdo"><bean:message key="pages.programartrabajo.generarot_p2.lblMarca" /></label>
        <input type="text" id="txtMarca" style="width: 140px" readonly="readonly" value="${sessionScope.b_ordentrabajo.strMarcaMaquinaria}" />
      </div>
      <div>
        <label for="txtModelo"><bean:message key="pages.programartrabajo.generarot_p2.lblModelo" /></label>
        <input type="text" id="txtModelo" style="width: 100px" readonly="readonly" value="${sessionScope.b_ordentrabajo.strModeloMaquinaria}" />
        <label for="txtAveria" class="margenizquierdo"><bean:message key="pages.programartrabajo.generarot_p2.lblAveria" /></label>
        <input type="text" id="txtAveria" style="width: 300px" readonly="readonly" value="${sessionScope.b_ordentrabajo.strDescripcionAveria}" />
      </div>
      
    </fieldset>
    
    <fieldset class="separadovertical">
      <legend><bean:message key="pages.programartrabajo.generarot_p2.fieldsetAsignarPaquetes" /></legend>
        <html:link action="a_buscarPaquete?codMaquinaria=${sessionScope.b_ordentrabajo.strCodMaquinaria}">
        	<html:img src="images/agregar.png" style="vertical-align:middle;"/>
        </html:link>
          
		  <logic:notEmpty name="b_ordentrabajo" property="arrPaquetesXOT">
		  <div class="separadoverticalsuperior">
	        <table width="70%" border="0" cellpadding="5" cellspacing="0" class="gridview">
	          <tr>
	            <th width="8%" scope="col"><bean:message key="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna1" /></th>
	            <th width="20%" scope="col"><bean:message key="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna2" /></th>
	            <th width="49%" scope="col"><bean:message key="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna3" /></th>
	            <th scope="col"><bean:message key="pages.programartrabajo.generarot_p2.grillapaquetesXot.cabecera.columna4" /></th>
	          </tr>
			<c:set var="itm" value="1" />
			<logic:iterate id="b_paqot" name="b_ordentrabajo" property="arrPaquetesXOT" >
				<tr>
					<td align="center">${itm}</td>
					<td><bean:write name="b_paqot" property="strCodPaquete" /></td>
					<td><bean:write name="b_paqot" property="strNombrePaquete" /></td>
	        		<td align="center">
				    	<html:link action="a_quitarPaqueteDeOT?codPqte=${pageScope.b_paqot.strCodPaquete}">
				    		<html:img src="images/quitar.gif"/>
				    	</html:link>
	        		</td>
				</tr>
				<c:set var="itm" value="${itm+1}"  />
			</logic:iterate>
 	       </table>
	     </div>
		  </logic:notEmpty>
		  <logic:present name="mensajeerror" scope="request">
		  	<div class="mensajeerror separadoverticalsuperior"><bean:write name="mensajeerror" scope="request"/> </div>
		  </logic:present>
     </fieldset>
    <div class="separadovertical margenderecho" align="right"> 
    	<html:link action="a_irAGenerarOT_paso1">
    		<html:img src="images/atras.png"/>
    	</html:link>
    	<html:link action="a_cargarGenerarOT_paso3">
    		<html:img src="images/siguiente.png"/>
    	</html:link>
    	<html:link action="a_homepage">
    		<html:img src="images/salir.png"/>
    	</html:link>
    </div>
    <logic:present name="mensajeerror1" scope="request">
	  	<div class="mensajeerror separadoverticalsuperior"><bean:write name="mensajeerror1" scope="request"/> </div>
	</logic:present>
    
  </form>
</body>
</html>