<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-jquery-tags" prefix="sj"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- InstanceBegin template="/Templates/plantilla.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${cssdise�o}" rel="stylesheet" type="text/css" />

</head>
<body class="twoColFixLtHdr">
<div id="contenedor">

<div>
<h2 class="titulo"><s:text name="pages.gestionarincidentes.buscarCliente.titulopagina"/></h2>
	<fieldset>
		<legend><s:text name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.Criterios"/></legend>
		<s:form method="post" action="a_buscarCliente">
			<s:hidden name="formOrigen" />
			<s:hidden name="codCliente" />
			<s:hidden name="anio" />
			<table>
				<tr>
					<td height="24"><s:text name="pages.buscarCliente.lblCliente" /></td>
					<td style="width: 353px"><s:textfield name="razSocCliente"
						id="txtRazSocCliente" cssStyle="width:100px" maxlength="100"/> 
						<s:text var="botonBuscar" name="pages.botones.buscar"/>
						<s:url var="imgBuscarUrl" value="%{botonBuscar}" /> 
						<s:submit type="image" src="%{imgBuscarUrl}" cssStyle="position:relative; top:5px" />
					</td>
				</tr>
			</table>
		</s:form>
	</fieldset>
	<br />

	<div>
	<table style="width: 100%;" class="gridview">
		<tr>
			<th><s:text
				name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.Seleccionar" /></th>
			<th><s:text
				name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.Codigo" /></th>
			<th><s:text
				name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.RazonSocial" /></th>
			<th><s:text
				name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.Ruc" /></th>
			<th><s:text
				name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.Email" /></th>
			
		</tr>
		<s:if test="%{#request.arr_clientes!=null}">
			<s:if test="%{#request.arr_clientes.size()==0}">
				<tr>
					<td colspan="5"><s:text name="pages.programartrabajo.buscarCliente.ListaClientes.cabecera.SinCoincidencia"/></td>
				</tr>
			</s:if>
			<s:else>
				<s:iterator var="cliente" value="#request.arr_clientes">
					<tr>
						<td align="center"><s:url var="linkDevolResult"
							action="a_devolverCliente">
							<s:param name="codCliente">${cliente.strCodCliente}</s:param>
							<s:param name="formOrigen">
								<s:property value="formOrigen" />
							</s:param>
							<s:param name="anio">
								<s:property value="anio" />
							</s:param>

						</s:url> <s:url var="imgSeleccionarUrl" value="/images/aprob_azul.gif" />
						<a href="${linkDevolResult}"> <img alt="Seleccionar"
							src="${imgSeleccionarUrl}" /> </a></td>
						<td><s:property value="#cliente.strCodCliente" /></td>
						<td><s:property value="#cliente.strRazSocCliente" /></td>
						<td><s:property value="#cliente.strRucCliente" /></td>
						<td><s:property value="#cliente.strEmailCliente" /></td>
					</tr>
				</s:iterator>
			</s:else>

		</s:if>
	</table>
	</div>
	<br />




<div class="separadovertical" align="right"><s:url
	var="linkIrPagOrigen" action="a_buscarClienteIrPaginaOrigen">
	<s:param name="formOrigen">
		<s:property value="formOrigen" />
	</s:param>
	<s:param name="codCliente">
		<s:property value="codCliente" />
	</s:param>
	<s:param name="anio">
		<s:property value="anio" />
	</s:param>
</s:url>
<s:text var="botonCancelar" name="pages.botones.cancelar"/>
 <a href="${linkIrPagOrigen}"> <s:url var="imgCancelarUrl"
	value="%{botonCancelar}" /> <img src="${imgCancelarUrl}"
	alt="Cancelar" width="71" height="25" border="0" /> </a></div>

</div>
</div>
</body>
</html>
