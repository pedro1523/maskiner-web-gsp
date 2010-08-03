<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%!
	UsuarioBean usr;
	boolean 	prueba;
%>


</head>
<body>
	<ul id="menu4">
	  <li>
	  	<s:a action="a_homepage"><s:text name="pages.guicomun.menulateral.paginainicio"/></s:a>
	  </li>
		
	  <%
	  		usr = (UsuarioBean)session.getAttribute("usuariologueado");
	  	  	prueba = usr.tieneRol("04") || usr.tieneRol("01");
	  	    request.setAttribute("prueba",prueba);
	  %>
	  
	<s:if test="#request.prueba">
  		<li>
			<s:a action="a_cargarRegistroIncidente"><s:text name="pages.guicomun.menulateral.registrarincidente"></s:text> </s:a>
  		</li>
	</s:if>
	
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
 
	  <s:if test="#request.prueba">
		  <li><s:a action="a_cpm_cargarOTInspeccion"><s:text name="pages.guicomun.menulateral.generarotinspeccion"/></s:a></li>
	  	  <li><s:a action="a_cnm_cargarGenerarOT"><s:text name="pages.guicomun.menulateral.generarot"/></s:a></li>
	  </s:if>
	  
	  
	  <%
	  		prueba = usr.tieneRol("03") || usr.tieneRol("01");
	        request.setAttribute("prueba",prueba);
	  %>
	  <s:if test="#request.prueba">
	  	  <li><s:a action="a_cargarInformeLiquidacion"><s:text name="pages.guicomun.menulateral.registrarinfliquidacion"/></s:a></li>
	  </s:if>
	  
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	        request.setAttribute("prueba",prueba);
	  %>
	  <s:if test="#request.prueba">
	  	  <li><s:a action="a_cpm_cargarPrefactura"><s:text name="pages.guicomun.menulateral.aprobarprefactura"/></s:a></li>
	  </s:if>

	  <%
	  		prueba = usr.tieneRol("04") || usr.tieneRol("01");
	        request.setAttribute("prueba",prueba);
	  %>
	  <s:if test="#request.prueba">
	  	  <li><s:a action="a_cpm_cargarFactura"><s:text name="pages.guicomun.menulateral.generarfactura"/></s:a></li>
	  </s:if>

	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	  		request.setAttribute("prueba",prueba);
	  %>
	  <s:if test="#request.prueba">
		  <li><a href="#"><s:text name="pages.guicomun.menulateral.mantenerclientes"/></a></li>
		  <li><a href="#"><s:text name="pages.guicomun.menulateral.mantenerequipos"/></a></li>
		 
	  </s:if>
	  
	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
	        request.setAttribute("prueba",prueba);
	  %>
	 <s:if test="#request.prueba">
 		<li><a href="#"><s:text name="pages.guicomun.menulateral.mantenerpaquetes"/></a></li>
  	 </s:if>
   	  <%
	  		prueba = usr.tieneRol("02") || usr.tieneRol("01");
   	        request.setAttribute("prueba",prueba);
	  %>
	 <s:if test="#request.prueba">
	  	  <li><s:a action="a_cnm_repGastMaq"><s:text name="pages.guicomun.menulateral.reportegastosmaquinaria"/></s:a></li>
	      <li><s:a action="a_cnm_repUtiMaq"><s:text name="pages.guicomun.menulateral.reporteutilizacionmaquinaria"/></s:a></li>
	      <li><s:a action="a_cnm_repFreInc"><s:text name="pages.guicomun.menulateral.reportefrecuenciaincidente"/></s:a></li>
	      <li><s:a action="a_cnm_repHisMaq"><s:text name="pages.guicomun.menulateral.reportehistorialmaquinaria"/></s:a></li>
		  <li><s:a action="a_cnm_repTecOT"><s:text name="pages.guicomun.menulateral.reportetecnicosporot"/></s:a></li>
	      
	 </s:if>
	  

	  <li><s:a action="a_cerrarsesion"><s:text name="pages.guicomun.menulateral.cerrarsesion"/></s:a></li>
	</ul>
	
</body>
</html>