<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/plantilla.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${cssdiseño}" rel="stylesheet" type="text/css" />
	
</head>
<body>
    <h2 class="titulo"><s:text name="pages.maestroequipos.buscarmaquinaria.titulo"/></h2>
    
    <s:form  method="post" action="a_cnm_buscarMaquinaria" >
      	<fieldset>
      		<legend><s:text name="pages.maestroequipos.buscarmaquinaria.fieldset.legend"/></legend>
      		<s:hidden name="formOrigen"/>
      		<s:hidden name="numTarjeta"/>
      		<s:hidden name="fechaInicio"/>
      		<s:hidden name="fechaFin"/>
      		      		
      		<s:label key="pages.maestroequipos.buscarmaquinaria.lblEmpresa"/>
      		<s:textfield name="razSocCliente" cssClass="margenderecho"/>
      		<s:label key="pages.maestroequipos.buscarmaquinaria.lblMarca"/>
      		<s:textfield name="marca" cssClass="margenderecho"/>
      		<s:label key="pages.maestroequipos.buscarmaquinaria.lblModelo"/>
      		<s:textfield name="modelo" cssClass="margenderecho"/>
      		<s:text var="buscarImgi18n" name="pages.botones.buscar" />
			<s:url var="buscarImgUrl" value="%{buscarImgi18n}" />
			<s:submit type="image" src="%{buscarImgUrl}" cssStyle="position:relative;top:8px" />
      	</fieldset>
    </s:form>
    <div class="separadovertical">
        <table style="width: 100%;" class="gridview">
   			<tr>
	   			<th width="30px"><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.seleccionar" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.numtarjeta" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.empresa" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.sucursal" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.tipo" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.numserie" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.marca" /></th>
	   			<th><s:text name="pages.maestroequipos.buscarmaquinaria.listamaquinarias.cabecera.modelo" /></th>
   			</tr>
			<s:if test="%{#request.arrMaquinarias!=null}">
				<s:if test="%{#request.arrMaquinarias.size()==0}">
					<tr>
						<td colspan="8">Sin coincidencias</td>
					</tr>
				</s:if>
				<s:else>
					<s:iterator var="maquinaria" value="#request.arrMaquinarias">
						<tr>
							<td align="center">
								<s:url var="linkDevolResult" action="a_cnm_devolverMaquinaria">
									<s:param name="numTarjeta">${maquinaria.strNumTarjeta}</s:param>
									<s:param name="formOrigen"><s:property value="formOrigen"/></s:param>
							    	<s:param name="fechaInicio"><s:property value="fechaInicio"/></s:param>
							    	<s:param name="fechaFin"><s:property value="fechaFin"/></s:param>
								</s:url>
								<s:url var="imgSeleccionarUrl" value="/images/aprob_azul.gif"/>
								<a href="${linkDevolResult}">
									<img alt="Seleccionar" src="${imgSeleccionarUrl}"/>
								</a>
							</td>
							<td><s:property value="#maquinaria.strNumTarjeta"/></td>
							<td><s:property value="#maquinaria.strRazonSocialCliente"/></td>
							<td><s:property value="#maquinaria.strDistritoSucursal"/></td>
							<td><s:property value="#maquinaria.strDescTipMaq"/></td>
							<td><s:property value="#maquinaria.strNumSerieMaquinaria"/></td>
							<td><s:property value="#maquinaria.strMarca"/></td>
							<td><s:property value="#maquinaria.strModMaquinaria"/></td>
						</tr>
					</s:iterator>
				</s:else>	
			</s:if>
		</table>
    </div>
    
	<div class="separadovertical" align="right">
		<s:url var="linkIrPagOrigen" action="a_cnm_buscarMaquinariaIrPaginaOrigen">
			<s:param name="formOrigen"><s:property value="formOrigen"/></s:param>
			<s:param name="numTarjeta"><s:property value="numTarjeta"/></s:param>
	    	<s:param name="fechaInicio"><s:property value="fechaInicio"/></s:param>
	    	<s:param name="fechaFin"><s:property value="fechaFin"/></s:param>
		</s:url>
		<a href="${linkIrPagOrigen}">
			<s:text var="imgCancelarI18n" name="pages.botones.cancelar"/>
			<s:url var="imgCancelarUrl" value="%{imgCancelarI18n}"/>
			<img src="${imgCancelarUrl}" alt="Cancelar" width="71" height="25" border="0" />
		</a>
	</div>


</body>
</html>
