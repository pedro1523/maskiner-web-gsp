<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="titulo">Aprobar Prefactura</h2>
      <br />
      <br />
      <p class="avisoconfirmacion">La prefactura Nº. <s:property value="#session.NumPrefac"/>  ha sido aprobada correctamente.</p>
      <br />
      <br />
      <hr/>
      <div class="separadovertical margenderecho" align="right">
   	    <s:a action="a_homepage">
    		<img src="images/salir.png"/>
    	</s:a>
      </div>
</body>
</html>