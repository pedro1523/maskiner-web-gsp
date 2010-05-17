<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="cssdiseño" value="/styles/designStyles.css" />

<link href="${cssdiseño}" rel="stylesheet" type="text/css" />

<tiles:useAttribute name="titulo_pagina" id="titulopagina" />

<title><bean:message key="${titulopagina}" /></title>
</head>
<body class="twoColFixLtHdr">
	<div id="container">
	    <div id="header">
	      <tiles:insert attribute="cabecera" />
	    </div> <!-- end #header -->
	    <div id="sidebar1">
			<tiles:insert attribute="menu" />
	    </div> <!-- end #sidebar1 -->
	    <div id="mainContent">
			<tiles:insert attribute="contenido" />
	    </div> <!-- end #mainContent -->
	    <!-- Este elemento de eliminación siempre debe ir inmediatamente después del div #mainContent para forzar al div #container a que contenga todos los elementos flotantes hijos -->
	    <br class="clearfloat" />
	    <div id="footer">
	    	<tiles:insert attribute="pie" />
	    </div> <!-- end #footer -->
	</div> <!-- end #container -->
</body>
</html>