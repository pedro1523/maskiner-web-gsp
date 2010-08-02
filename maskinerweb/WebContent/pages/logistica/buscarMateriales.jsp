    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/plantilla.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><s:text name="pages.logistica.buscarMateriales.titulopagina" /></title>
<link href="${cssdiseño}" rel="stylesheet" type="text/css" />
	
</head>
<body class="twoColFixLtHdr">
<div id="contenedor">

    <h2 class="titulo"><s:text name="pages.logistica.buscarMateriales.subtitulo" /></h2>
    <s:form  method="post" action="a_buscarMateriales">
    	<div class="separadovertical">
    		<s:text name="pages.logistica.buscarMateriales.lblTipoMaterial" />
			<s:select name="tipoMaterial" 
		               	list="#session.b_tiposMateriales" 
		                listKey="intCodTipoMaterial" 
		                listValue="strTipoMaterial"/>

    		<s:text name="pages.logistica.buscarMateriales.lblDescripcionMaterial" />
    		<s:textfield name="descripMaterial"></s:textfield>
			<s:url var="imgBuscarUrl" value="/images/buscar.png"/>
				<s:submit type="image" src="%{imgBuscarUrl}" />
    	</div>
    </s:form>
    <div class="separadovertical" >
       	<table style="width: 100%;" class="gridview">
   			<tr>
	   			<th><s:text name="pages.logistica.buscarMateriales.listaMateriales.columna.Seleccionar" /></th>
	   			<th><s:text name="pages.logistica.buscarMateriales.listaMateriales.columna.Codigo" /></th>
	   			<th><s:text name="pages.logistica.buscarMateriales.listaMateriales.columna.Tipo" /></th>
	   			<th><s:text name="pages.logistica.buscarMateriales.listaMateriales.columna.Descripcion" /></th>
	   			<th><s:text name="pages.logistica.buscarMateriales.listaMateriales.columna.UnidadMedida" /> </th>
	   			<th><s:text name="pages.logistica.buscarMateriales.listaMateriales.columna.PrecioUnitario" /> </th>
   			</tr>
   			<s:if test="%{#request.b_materiales!=null}">
				<s:if test="%{#request.b_materiales.size()==0}">
					<tr>
						<td colspan="6">No hay coincidencias</td>
					</tr>
				</s:if>
				<s:else>
				<s:iterator var="b_mat" value="#request.b_materiales">			
					<tr>
		          		<td align="center">
							<s:url var="linkDevolResult" action="a_buscarMaterialesDevolverMaterial">
								<s:param name="CodMaterial">${b_mat.strCodMaterial}</s:param>
							</s:url>
							<s:url var="imgSeleccionarUrl" value="/images/aprob_azul.gif"/>
							<a href="${linkDevolResult}">
								<img alt="Seleccionar" src="${imgSeleccionarUrl}"/>
							</a>
		          			
						</td>	
						<td align="center"><s:property value="#b_mat.strCodMaterial"/> </td>
		          		<td><s:property value="#b_mat.strTipoMaterial"/> </td>
		          		<td><s:property value="#b_mat.strDescripMaterial"/></td>
		          		<td align="center"><s:property value="#b_mat.strUnidadMedida"/> </td>
		          		<td align="center"><s:property value="#b_mat.bdPrecioUnitario"/></td>
					</tr>
   				

				</s:iterator>
				</s:else>		
			</s:if>

		</table>
	</div>
       
    <div align="right" class="separadovertical">
		<s:a action="a_buscarMaterialesSalir">
			<img src="images/salir.png" />
		</s:a>
    </div>
	

</div>
</body>
</html>
