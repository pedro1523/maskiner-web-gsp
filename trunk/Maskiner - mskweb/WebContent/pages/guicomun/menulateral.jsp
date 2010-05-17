<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%!UsuarioBean usr;
	boolean prueba;%>


</head>
<body>
	<ul id="menu4">
	  <li><html:link action="a_homepage"><bean:message key="pages.guicomun.menulateral.paginainicio"/></html:link></li>
		
	  <%
			  	usr = (UsuarioBean)session.getAttribute("usuariologueado");
			  	  		prueba = usr.tieneRol("04") || usr.tieneRol("01");
			  	  		request.setAttribute("prueba",prueba);
			  %>
		
	  <c:if test="${requestScope.prueba}">
	  		<li><html:link action="a_cargarRegistroIncidente"><bean:message key="pages.guicomun.menulateral.registrarincidente"/></html:link></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${requestScope.prueba}">
		  <li><html:link action="a_cargarOTInspeccion"><bean:message key="pages.guicomun.menulateral.generarotinspeccion"/></html:link></li>
	  	  <li><html:link action="a_cargarGenerarOT"><bean:message key="pages.guicomun.menulateral.generarot"/></html:link></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("03") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${requestScope.prueba}">
	  	  <li><html:link action="a_cargarInformeLiquidacion"><bean:message key="pages.guicomun.menulateral.registrarinfliquidacion"/></html:link></li>
	  </c:if>
	  
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${requestScope.prueba}">
	  	  <li><html:link action="a_cargarPrefactura"><bean:message key="pages.guicomun.menulateral.aprobarprefactura"/></html:link></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("04") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${requestScope.prueba}">
	  	  <li><html:link action="a_cargarFactura"><bean:message key="pages.guicomun.menulateral.generarfactura"/></html:link></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${requestScope.prueba}">
		  <li><html:link action="a_cargarMantenerCliente"><bean:message key="pages.guicomun.menulateral.mantenerclientes"/></html:link></li>
		  <li><a href="#"><bean:message key="pages.guicomun.menulateral.mantenerequipos"/></a></li>
		 
	  </c:if>
	  
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	 <c:if test="${requestScope.prueba}">
  		<li><html:link action="a_cargarMantenerPaquete"><bean:message key="pages.guicomun.menulateral.mantenerpaquetes"/></html:link></li>
  		</c:if>
   <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	 <c:if test="${requestScope.prueba}">
	  	  <li><html:link action="a_repGastMaq"><bean:message key="pages.guicomun.menulateral.reporteGastosMaquinaria"/></html:link></li>
	      <li><html:link action="a_repUtiMaq"><bean:message key="pages.guicomun.menulateral.reporteUtilizacionMaquinaria"/></html:link></li>
	      <li><html:link action="a_repFreInc"><bean:message key="pages.guicomun.menulateral.reporteFrecuenciaIncidente"/></html:link></li>
	      <li><html:link action="a_repHisMaq"><bean:message key="pages.guicomun.menulateral.reporteHistorialMaquinarias"/></html:link></li>
			<li><html:link action="a_repTecOT"><bean:message key="pages.guicomun.menulateral.reporteTecnicosOT"/></html:link></li>
	      
	 </c:if>
	  

	  <li><html:link action="a_cerrarsesion"><bean:message key="pages.guicomun.menulateral.cerrarsesion"/></html:link></li>
	</ul>
	
</body>
</html>