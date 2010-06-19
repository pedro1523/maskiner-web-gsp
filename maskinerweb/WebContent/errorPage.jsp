<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><s:text name="error.titulopagina"/></title>
</head>
<body>
	<h1 style="text-shadow: 2px 2px 5px #333"> 
		<img alt="Queeee peeeena!!!" src="<s:url value="/images/triste7.gif"/>" style="vertical-align: middle; margin-right: 10px;" />
		<s:text name="error.titulo"/>
	</h1>
	<div style="font-weight:bold"><s:text name="error.lblnombreerror"/></div><br>
	<div style="border: 1px inset silver; padding: 10px; background-color: #EEEEEE; -moz-box-shadow: 3px 3px 5px #333;-webkit-box-shadow: 3px 3px 5px #333; ">
		<s:property value="exception"/>
	</div>
	<div style="font-weight:bold; margin: 15px 0 15px 0"><s:text name="error.lbldetalleerror"/></div>
	<div style="border: 1px inset silver; padding: 10px; background-color: #EEEEEE; -moz-box-shadow: 3px 3px 5px #333;-webkit-box-shadow: 3px 3px 5px #333; ">
		<s:property value="exceptionStack"/>
	</div>
</body>
</html>