<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="cssdiseño" value="/styles/loginStyles.css" />

<link href="${cssdiseño}" rel="stylesheet" type="text/css" />
 
<title><s:text name="login.titulopagina"/></title>
</head>
<body onload="document.forms[0].txtPassword.focus()" >
	<div id="container">
		<div id="head">
			<img alt="Maskiner S.A." src="images/logo_maskiner.png">
		</div>
		<div id="body">
			<h1><s:text name="app.tituloaplicacion" /></h1>
			<fieldset>
				<legend><s:text name="login.titulologin"/></legend>
				<s:form action="a_logueo" method="post">
					<div id="controlessuperiores">
						<label for="usuario" id="lblUsuario"><s:text name="login.lblusuario"/></label>
						<s:textfield id="txtUsuario" name="usuario" value="juanca"/>
					</div>
					<div id="controlescentrales">
						<label for="password" id="lblPassword"><s:text name="login.lblpassword"/></label>
						<s:password id="txtPassword" name="password"/>
					</div>
					<div align="right">
						<s:text var="submittext" name="login.submit"/>
						<s:submit value="%{submittext}"/>
					</div>
				</s:form>
			</fieldset>
			<div class="mensajeerror"><s:property value="mensaje"/></div>
		</div>
	</div>
</body>
</html>