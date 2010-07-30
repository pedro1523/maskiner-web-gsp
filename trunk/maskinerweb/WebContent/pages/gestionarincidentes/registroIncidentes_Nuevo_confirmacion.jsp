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
      <h2 class="titulo"><s:text name="pages.gestionarincidentes.registrarIncidente_Nuevo.titulo"/></h2>
      <br />
      <br />
      <p class="avisoconfirmacion">
       <s:text name="pages.gestionarincidentes.regincidentes.confirmacion1"/>
      ${id} <s:text name="pages.gestionarincidentes.regincidentes.confirmacion2"/></p>
      <br />
      <br />
      <hr/>
      <div class="separadovertical margenderecho" align="right"><a href="a_homepage.do"><img src="images/aceptar.png" alt="Salir" width="71" height="25" border="0" /></a></div>


</body>
</html>