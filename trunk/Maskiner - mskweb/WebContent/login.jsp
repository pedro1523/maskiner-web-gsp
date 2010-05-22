<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="cssdiseño" value="/styles/loginStyles.css" />

<link href="${cssdiseño}" rel="stylesheet" type="text/css" />

<title><bean:message key="login.titulopagina"/></title>
</head>
<body>
	<div id="container">
		<div id="head">
			<img alt="Maskiner S.A." src="images/logo_maskiner.png">
		</div>
		<div id="body">
			<h1><bean:message key="app.tituloaplicacion" /></h1>
			<fieldset>
				<legend><bean:message key="login.titulologin"/></legend>
				<s:form action="a_logueo.do" method="post">
					<div id="controlessuperiores">
						<label for="usuario" id="lblUsuario"><bean:message key="login.lblusuario"/></label>
						<s:textfield id="usuario" name="usuario"/>
					</div>
					<div id="controlescentrales">
						<label for="password" id="lblPassword"><bean:message key="login.lblpassword"/></label>
						<s:password id="password" name="password"/>
					</div>
					<div align="right">
						<s:submit><bean:message key="login.submit"/></s:submit>
					</div>
				</s:form>
			</fieldset>
			<div class="mensajeerror"><c:out value="${requestScope.mensaje}"/></div>
		</div>
	</div>
</body>
</html>