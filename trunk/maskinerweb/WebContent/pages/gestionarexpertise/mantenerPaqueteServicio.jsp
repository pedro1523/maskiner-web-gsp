<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib   prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<h2 class="titulo"><s:text name="pages.gestionarexpertise.mantenerPaquete.titulo" /> </h2>

<s:form action="a_cargarMantenerPaquete" method="post">

      <fieldset class="separadovertical" style="width:600px;">
      <legend><s:text name="pages.gestionarexpertise.mantenerPaquete.titulofield" /></legend>
      <table>
      <tr ><td><s:text name="pages.gestionarexpertise.mantenerPaquete.lblCodRegistrador"/>
	<span class="negrita margenderecho">${registrador}</span></td>
      
	<td>
	<label for="textfield"><s:text name="pages.gestionarexpertise.mantenerPaquete.criterio2"/>  </label>
	<span class="negrita">${fechaactual}</span></td></tr>
      
      <tr>
         <td>	
        <label for="textfield"><s:text name="pages.gestionarexpertise.mantenerPaquete.criterio4"/></label>
	<s:textfield name="nombrePaquete"  id="txtNombrePqte" cssStyle="width:100px"/>
		</td>
		</tr>
		
		</table>
		
<div class="separadoverticalsuperior" align="right">
				<s:url var="imgBuscarUrl" value="/images/buscar.png"/>
				
				<s:submit type="image" src="%{imgBuscarUrl}" />
			</div>	

        <span class="separadovertical" style="width:300px;">

      </span>
      </fieldset>
      
</s:form>

<br/>
<table class="separadoverticalsuperior" align="right">
<tr>
				<td align="right">

<s:a href="a_nuevoPaquete" >
				<img src="images/nuevo_azul.gif"></s:a></td></tr></table>
				<br/>
     <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
          <th width="10%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna0" />  </th>
       	  <th width="7%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna1" />  </th>
          <th width="17%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna2" /> </th>
          <th width="29%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna3"/> </th>
          <th width="36%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna4" /> </th>
          <th width="36%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna5" /> </th>
           <th width="36%" align="center"><s:text name="pages.gestionarexpertise.mantenerPaquete.tabla.columna6" />  </th>          
        </tr>
       		
       		<c:if test="${requestScope.listPaq!=null}" >
     		 <c:forEach var="paquete" items="${requestScope.listPaq}">
     		<tr>
     		<td align="center">xD</td>
     		 <td align="center">${paquete.strCodPaquete}</td>
	       		<td align="center">${paquete.strNombre}  </td>
	       		<td align="center">${paquete.datFechaRegistroPaquete}</td>
	       		<td align="center">${paquete.strMarcaMaqApliPaquete}</td>
	       		<td align="center">${paquete.strModeloMaqApliPaquete}</td>
	       		<td align="center">xD</td>
			 </tr>
		  </c:forEach>
		  </c:if>
   
       		 
     		
		  

	 	 
		  
	  </table>
              <div class="separadovertical margenderecho" align="right"> 
				<s:a action="a_homepage">
	        <img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
	        </s:a>
			 </div>

</body>
</html>