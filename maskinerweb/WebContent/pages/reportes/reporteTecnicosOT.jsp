<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/mskFunciones.js"/></script>

</head>
<body>

<h2 class="titulo"><s:text name="pages.reportes.repTecOT.titulo"/></h2>
    <fieldset>
     	<legend><s:text name="pages.reportes.repTecOT.fielset.legend" /></legend>
		<s:form method="post" action="a_cnm_generarRepTecnicosOT" onsubmit="borrarErrores('fieldError')">
			<s:label key="pages.reportes.repTecOT.lblOrdenTrabajo" />
			<s:textfield name="numOrdenTrabajo" maxlength="6"/>
			<s:text var="generarImgi18n" name="pages.botones.generarreporte" />
			<s:url var="generarImgUrl" value="%{generarImgi18n}" />
			<s:submit type="image" src="%{generarImgUrl}" cssStyle="position:relative; top:5px; margin-left:20px"/>
		</s:form>
 	</fieldset>
 	<div id="fieldError">
	 	<s:fielderror cssClass="mensajeerror lista separadoverticalsuperior" />
 	</div>
</body>
</html>