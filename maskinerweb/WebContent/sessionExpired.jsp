<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><s:text name="error.sessionexpired.titulopagina"/></title>
</head>
<body>
	<h1 style="text-shadow: 2px 2px 5px #333"> 
		<img src="<s:url value="/images/triste7.gif"/>" style="vertical-align: middle; margin-right: 10px;" />
		<s:text name="error.sessionexpired.titulo"/>
	</h1>
</body>
</html>