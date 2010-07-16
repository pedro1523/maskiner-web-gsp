<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>

<script type="text/javascript">
	function abrirBuscarCliente(){
		document.forms["frmGenerarRepFrecIncid"].action="<%= request.getContextPath() %>/a_cargarBuscarCliente.do";
		document.forms["frmGenerarRepFrecIncid"].submit();
	}
	
</script>


</head>
<body>
	<h2 class="titulo"><s:text name="pages.reportes.repFreInc.titulo" /></h2>
    <fieldset>
      <legend><s:text name="pages.reportes.repFreInc.fieldsetCriterios" /></legend>
	  <s:form name="frmReporteIncidentes" method="post" action="a_cnm_generarRepFrecIncid" id="frmGenerarRepFrecIncid">
	      <div class="separadoverticalinferior">
	        <s:text name="pages.reportes.repFreInc.lblcliente" />
	        <s:textfield name="codCliente"/>
			<s:a value="javascript:abrirBuscarCliente()">
				<s:url var="buscarImgUrl" value="/images/buscar_azul.gif"/>
				<img src="${buscarImgUrl}"/>
			</s:a>
	        <s:text name="pages.reportes.repFreInc.lblannio" />
	        <s:textfield name="anio" />
	        <s:hidden name="formOrigen" value="repFrecInc"/>
	        <s:submit cssStyle="margin-left:20px" value="Generar Reporte" />
	      </div>
	      <s:fielderror cssClass="mensajeerror lista" />
	  </s:form>      
    </fieldset>

</body>
</html>