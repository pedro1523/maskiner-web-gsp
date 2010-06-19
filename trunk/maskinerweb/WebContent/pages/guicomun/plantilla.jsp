<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="cssdise�o" value="/styles/designStyles.css" />

<link href="${cssdise�o}" rel="stylesheet" type="text/css" />

<tiles:useAttribute name="titulo_pagina" scope="request" id="titulopagina" />

<title><s:text name="%{#request.titulopagina}"/></title>
</head>
<body class="twoColFixLtHdr">
	<div id="container">
	    <div id="header">
	      <tiles:insertAttribute name="cabecera" />
	    </div> <!-- end #header -->
	    <div id="sidebar1">
			<tiles:insertAttribute name="menu" />
	    </div> <!-- end #sidebar1 -->
	    <div id="mainContent">
			<tiles:insertAttribute name="contenido" />
	    </div> <!-- end #mainContent -->
	    <!-- Este elemento de eliminaci�n siempre debe ir inmediatamente despu�s del div #mainContent para forzar al div #container a que contenga todos los elementos flotantes hijos -->
	    <br class="clearfloat" />
	    <div id="footer">
	    	<tiles:insertAttribute name="pie" />
	    </div> <!-- end #footer -->
	</div> <!-- end #container -->
</body>
</html>