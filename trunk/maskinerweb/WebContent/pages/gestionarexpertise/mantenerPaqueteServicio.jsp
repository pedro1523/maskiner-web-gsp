<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<h2 class="titulo"><bean:message key="pages.gestionarexpertise.mantenerPaquete.titulo" /> </h2>
<html:form action="a_cargarMantenerPaquete" method="post">
      <fieldset class="separadovertical" style="width:600px;">
      <legend><bean:message key="pages.gestionarexpertise.mantenerPaquete.titulofield" />  </legend>
      <table>
      <tr ><td><label for="textfield"><bean:message key="pages.gestionarexpertise.mantenerPaquete.lblCodRegistrador"/></label>
	<html:text property="codReg" readonly="readonly" style="width: 200px"
      value="${registrador}"/></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.mantenerPaquete.criterio2"/>  </label>
	<html:text property="FechaPaq" readonly="readonly" value="${fechaactual}"/></td></tr>
      
      <tr><td>	
        <label for="textfield"><bean:message key="pages.gestionarexpertise.mantenerPaquete.criterio4"/>  </label>
	<html:text property="nombrePaquete" />
		</td></tr>
		</table>
<html:image	src="images/buscar.png"></html:image>	

        <span class="separadovertical" style="width:300px;">

      </span>
      </fieldset>
      
</html:form>

<br/>
<table class="separadoverticalsuperior" align="right">
<tr>
				<td align="right">
<html:link action="a_nuevoPaquete" >
				<img src="images/nuevo_azul.gif"></html:link></td></tr></table>
				<br/>
     <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
          <th width="10%" align="center">Modificar</th>
          <th width="7%" align="center"><bean:message key="pages.gestionarexpertise.mantenerPaquete.tabla.columna1" />  </th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.mantenerPaquete.tabla.columna2" /> </th>
          <th width="29%" align="center"><bean:message key="pages.gestionarexpertise.mantenerPaquete.tabla.columna3"/> </th>
          <th width="36%" align="center"><bean:message key="pages.gestionarexpertise.mantenerPaquete.tabla.columna4" /> </th>
          <th width="36%" align="center"><bean:message key="pages.gestionarexpertise.mantenerPaquete.tabla.columna5" /> </th>
           <th width="36%" align="center">Ver Paquete</th>          
        </tr>
     
		<c:forEach var="mantenPaquete" items="${requestScope.listPaq}">
			<tr>
			<td align="center"><html:link action="a_nuevoPaquete?codPaquete=${mantenPaquete.strCodPaquete}">
								  <img src="images/modificar.gif" alt="" border="0" /></html:link>
				</td>
				<td align="center">${mantenPaquete.strCodPaquete}</td>
          		<td align="center">${mantenPaquete.strNombre}  </td>
          		<td align="center">${mantenPaquete.datFechaRegistroPaquete }</td>
          		<td align="center">${mantenPaquete.strMarcaMaqApliPaquete}</td>
          		<td align="center">${mantenPaquete.strModeloMaqApliPaquete}</td>
          		<td align="center"><html:link action="a_mostrarPaquete?codPaquete=${mantenpaquete.strCodPaquete}">
								  <img src="images/obser_azul.gif" alt="" border="0" /></html:link>
				</td>	
			</tr>
		
		</c:forEach>
		
       
      </table>
              <div class="separadovertical margenderecho" align="right"> 
				<html:link action="a_homepage">
					<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
				</html:link>
			 </div>

</body>
</html>