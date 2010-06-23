<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:url var="csscontenido" value="/styles/contentStyles/inicio.css" />
<link href="${csscontenido}" rel="stylesheet" type="text/css" />

<title>Insert title here</title>
</head>
<body>
  	<h3> 
		<!-- <bean:message key="pages.guicomun.inicio.titulo" arg0="${sessionScope.usuariologueado.nombres}" />-->
   		<s:text name="pages.guicomun.inicio.titulo">
   			<s:param>${sessionScope.usuariologueado.nombres}</s:param>
   		</s:text>
   	</h3>
   	<div align="center"><img src="images/logo_frontis.png" width="657" height="500" alt="Maskiner" /></div>
</body>
</html>