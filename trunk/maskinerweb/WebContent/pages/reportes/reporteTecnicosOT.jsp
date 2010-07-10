<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<sj:head jqueryui="true"/>
</head>
<body>

<h2 class="titulo">Reporte de Técnicos por Orden de Trabajo</h2>
	
<s:form method="post" action="a_reporteTecnicosOT">
	<div class="separadovertical">
		<s:label key="pages.reportes.repTecOT.lblOrdenTrabajo" />
		<s:textfield name="numOrdenTrabajo" />
		<s:label key="pages.reportes.repTecOT.lblFechaInicio" />
		<sj:datepicker name="fechaInicio"
					   buttonImageOnly="true"
					   id="txtFechaInicio"
					   size="10" 
					   displayFormat="dd/mm/yy"
					   changeYear="true"
					   changeMonth="true"
					   cssStyle="margin-right:5px"
					   readonly="true" />
		<s:label key="pages.reportes.repTecOT.lblFechaFin" />
		<sj:datepicker name="fechaFin"
					   buttonImageOnly="true"
					   id="txtFechaFin"
					   size="10" 
					   displayFormat="dd/mm/yy"
					   changeYear="true"
					   changeMonth="true"
					   cssStyle="margin-right:5px"
					   readonly="true" />
	    <s:submit cssStyle="margin-left:20px" value="Generar Reporte" />
				
	</div>		  	
</s:form>


</body>
</html>