<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>
    
</head>
<body>
	<h2 class="titulo"><s:text name="pages.reportes.repFreInc.titulo" /></h2>
    <fieldset>
      <legend><s:text name="pages.reportes.repFreInc.fieldsetCriterios" /></legend>
	  <s:form method="post" action="a_cnm_generarRepFrecIncid">
	      <div class="separadoverticalinferior">
	        <s:text name="pages.reportes.repFreInc.lblcliente" />
	        <s:textfield name="cliente.strCodCliente"/>
	        <s:a action="a_buscarCliente">
	        	<s:param name="formOrigen">repFrecInc</s:param>
	        	<s:url var="imgBuscarAzulUrl" value="/images/buscar_azul.gif"/>
	        	<img src="${imgBuscarAzulUrl}" style="margin-right:25px;vertical-align:middle"/>
	        </s:a>
	        <s:text name="pages.reportes.repFreInc.lblannio" />
	        <s:textfield name="anio" />
	        <s:submit cssStyle="margin-left:20px" value="Generar Reporte" />
	      </div>
	      <s:actionerror/>
	  </s:form>      
    </fieldset>

</body>
</html>