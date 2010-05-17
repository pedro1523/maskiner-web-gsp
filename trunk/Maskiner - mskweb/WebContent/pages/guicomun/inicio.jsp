<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="csscontenido" value="/styles/contentStyles/inicio.css" />
<link href="${csscontenido}" rel="stylesheet" type="text/css" />

<title>Insert title here</title>
</head>
<body>
   	<h3><bean:message key="pages.guicomun.inicio.titulo" arg0="${sessionScope.usuariologueado.nombres}" /></h3>
   	<div align="center"><img src="images/logo_frontis.png" width="657" height="500" alt="Maskiner" /></div>
</body>
</html>