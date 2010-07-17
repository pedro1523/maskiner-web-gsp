<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function abrirBuscarMaquinaria(){
		document.forms["frmReporteUtilizMaquinaria"].action="<%= request.getContextPath() %>/a_cnm_cargarBuscarMaquinaria.do";
		document.forms["frmReporteUtilizMaquinaria"].submit();
	}
	
</script>


<title>Insert title here</title>
    
</head>
<body>
<h2 class="titulo"><s:text name="pages.reportes.repUtiMaq.titulo"/></h2>

	<fieldset>
		<legend><s:text name="pages.reportes.repUtiMaq.fielset.legend"/></legend>
		<s:form method="post" action="a_cnm_reporteUtilizMaquinaria" id="frmReporteUtilizMaquinaria">
			<s:label key="pages.reportes.repUtiMaq.lblNumTarjeta"/>
			<s:textfield name="numTarjeta" maxlength="6"/>
			<s:hidden name="formOrigen" value="d_repUtiMaq"/>
			<s:a value="javascript:abrirBuscarMaquinaria()">
				<s:url var="buscarImgUrl" value="/images/buscar_azul.gif"/>
				<img src="${buscarImgUrl}"/>
			</s:a>
			<s:text var="generarImgi18n" name="pages.botones.generarreporte" />
			<s:url var="generarImgUrl" value="%{generarImgi18n}" />
			<s:submit type="image" src="%{generarImgUrl}" cssStyle="position:relative; top:5px; margin-left:20px"/>
		</s:form>
	</fieldset>
	<s:fielderror cssClass="mensajeerror lista separadoverticalsuperior" />

</body>
</html>