<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 class="titulo"><s:text name="pages.liquidartrabajo.registrarILPaso3.titulo" /></h2>
      <br />
      <br />
      <p class="avisoconfirmacion"><s:text name="pages.liquidartrabajo.registrarILPaso3.avisoConfirmacion1" /> ${idLiq} <s:text name="pages.liquidartrabajo.registrarILPaso3.avisoConfirmacion2" /></p>
      <br />
      <br />
      <hr/>
      <div class="separadovertical margenderecho" align="right">
		<s:a action="a_homepage">
	    		<img src="images/salir.png" />
	    </s:a>
	</div>
</body>
</html>