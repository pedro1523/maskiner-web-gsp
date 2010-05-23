<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>
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
	  <li>
	  	<s:a action="a_homepage"><s:text name="pages.guicomun.menulateral.paginainicio"/></s:a>
	  </li>
		
	  <%
	  		usr = (UsuarioBean)session.getAttribute("usuariologueado");
	  	  	prueba = usr.tieneRol("04") || usr.tieneRol("01");
	  	  	pageContext.setAttribute("prueba",prueba);
	  %>
	  
	<c:if test="${pageScope.prueba}">
  		<li>
			<s:a action="a_cargarRegistroIncidente"><s:text name="pages.guicomun.menulateral.registrarincidente"></s:text> </s:a>
  		</li>
	</c:if>
	
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		pageContext.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${pageScope.prueba}">
		  <li><s:a action="a_cargarOTInspeccion"><s:text name="pages.guicomun.menulateral.generarotinspeccion"/></s:a></li>
	  	  <li><s:a action="a_cargarGenerarOT"><s:text name="pages.guicomun.menulateral.generarot"/></s:a></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("03") || usr.tieneRol("01");
	  		pageContext.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${pageScope.prueba}">
	  	  <li><s:a action="a_cargarInformeLiquidacion"><s:text name="pages.guicomun.menulateral.registrarinfliquidacion"/></s:a></li>
	  </c:if>
	  
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		pageContext.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${pageScope.prueba}">
	  	  <li><s:a action="a_cargarPrefactura"><s:text name="pages.guicomun.menulateral.aprobarprefactura"/></s:a></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("04") || usr.tieneRol("01");
	  		pageContext.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${pageScope.prueba}">
	  	  <li><s:a action="a_cargarFactura"><s:text name="pages.guicomun.menulateral.generarfactura"/></s:a></li>
	  </c:if>

	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		pageContext.setAttribute("prueba",prueba);
	  %>
	  <c:if test="${pageScope.prueba}">
		  <li><s:a action="a_cargarMantenerCliente"><s:text name="pages.guicomun.menulateral.mantenerclientes"/></s:a></li>
		  <li><a href="#"><s:text name="pages.guicomun.menulateral.mantenerequipos"/></a></li>
		 
	  </c:if>
	  
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		pageContext.setAttribute("prueba",prueba);
	  %>
	 <c:if test="${pageScope.prueba}">
  		<li><s:a action="a_cargarMantenerPaquete"><s:text name="pages.guicomun.menulateral.mantenerpaquetes"/></s:a></li>
  	 </c:if>
   	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
   			pageContext.setAttribute("prueba",prueba);
	  %>
	 <c:if test="${pageScope.prueba}">
	  	  <li><s:a action="a_repGastMaq"><s:text name="pages.guicomun.menulateral.reporteGastosMaquinaria"/></s:a></li>
	      <li><s:a action="a_repUtiMaq"><s:text name="pages.guicomun.menulateral.reporteUtilizacionMaquinaria"/></s:a></li>
	      <li><s:a action="a_repFreInc"><s:text name="pages.guicomun.menulateral.reporteFrecuenciaIncidente"/></s:a></li>
	      <li><s:a action="a_repHisMaq"><s:text name="pages.guicomun.menulateral.reporteHistorialMaquinarias"/></s:a></li>
		  <li><s:a action="a_repTecOT"><s:text name="pages.guicomun.menulateral.reporteTecnicosOT"/></s:a></li>
	      
	 </c:if>
	  

	  <li><s:a action="a_cerrarsesion"><s:text name="pages.guicomun.menulateral.cerrarsesion"/></s:a></li>
	</ul>
	
</body>
</html>