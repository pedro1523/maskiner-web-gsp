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
	<h1 style="text-shadow: 2px 2px 5px #333"> 
		<img alt="Que pena!!!" src="<s:url value="/images/triste7.gif"/>" style="vertical-align: middle; margin-right: 10px;" />
		Que pena!!!!!... ha ocurrido un error de aplicaci�n...
	</h1>
	<div style="font-weight:bold">Nombre del error:</div><br>
	<div style="border: 1px inset silver; padding: 10px; background-color: #EEEEEE ">
		<s:property value="exception"/>
	</div>
	<div style="font-weight:bold; margin: 15px 0 15px 0">Detalle del error:</div>
	<div style="border: 1px inset silver; padding: 10px; background-color: #EEEEEE ">
		<s:property value="exceptionStack"/>
	</div>
</body>
</html>