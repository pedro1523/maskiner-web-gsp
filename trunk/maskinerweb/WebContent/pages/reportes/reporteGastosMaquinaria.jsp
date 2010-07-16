<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sj:head jqueryui="true"/>
<title>Insert title here</title>
<script type="text/javascript">
	function abrirBuscarMaquinaria(){
		document.forms["frmGenerarReporteMaquinariaGasto"].action="<%= request.getContextPath() %>/a_cnm_cargarBuscarMaquinaria.do";
		document.forms["frmGenerarReporteMaquinariaGasto"].submit();
	}
	
</script>
    
</head>
<body>

<h2 class="titulo"><s:text name="pages.reportes.repGasMaq.titulo"/></h2>

<div class="separadovertical">
	<s:form method="post" action="a_cnm_generarReporteMaquinariaGasto" id="frmGenerarReporteMaquinariaGasto">
		<s:label key="pages.reportes.repGasMaq.lblnumtarjeta"/>
		<s:textfield name="numTarjeta" maxlength="6"  id="txtNumTarjeta" value="NT0001"/>
		<s:hidden name="formOrigen" value="d_repGastMaq"/>
		<s:a value="javascript:abrirBuscarMaquinaria()">
			<s:url var="buscarImgUrl" value="/images/buscar_azul.gif"/>
			<img src="${buscarImgUrl}"/>
		</s:a>
		<sj:datepicker name="fechaInicio" value="12/05/2009"
					   buttonImageOnly="true"
					   id="txtFechaInicio"
					   size="10" 
					   readonly="true"
					   displayFormat="dd/mm/yy"
					   changeYear="true"
					   changeMonth="true" cssStyle="margin-left:10px" />
		<sj:datepicker name="fechaFin" value="15/07/2010"
					   buttonImageOnly="true"
					   id="txtFechaFin"
					   size="10" 
					   readonly="true"
					   displayFormat="dd/mm/yy"
					   changeYear="true"
					   changeMonth="true" cssStyle="margin-left:10px" />
		
	   <s:submit cssStyle="margin-left:20px" value="Generar Reporte" />
		
	</s:form>
</div>

</body>
</html>