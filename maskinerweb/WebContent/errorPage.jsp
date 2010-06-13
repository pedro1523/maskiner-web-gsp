<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1> :( Que pena!!!!!... ha ocurrido un error en la aplicación</h1>
	<div style="font-weight:bold">Nombre de error:</div><br>
	<div style="border: 1px inset silver; padding: 10px; background-color: #EEEEEE ">
		<s:property value="exception"/>
	</div>
	<div style="font-weight:bold; margin: 15px 0 15px 0">Detalle de error:</div>
	<div style="border: 1px inset silver; padding: 10px; background-color: #EEEEEE ">
		<s:property value="exceptionStack"/>
	</div>
</body>
</html>