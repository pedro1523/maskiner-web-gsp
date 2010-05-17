<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/plantilla.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><bean:message key="pages.gestionarincidentes.buscarCliente.titulopagina"/></title>
<link href="${cssdiseño}" rel="stylesheet" type="text/css" />
	
</head>
<body class="twoColFixLtHdr">
<div id="contenedor">

    <h2 class="titulo">Buscar Materiales e Insumos</h2>
    <html:form  method="post" action="a_buscarMateriales">
    	<div class="separadovertical">
    		<label for="txtTipoMaterial">Tipo Material:</label>
    		<html:select property="tipoMaterial" styleId="txtTipoMaterial" >
    		    <html:option value="0">(todos)</html:option>
				<html:optionsCollection name="b_tiposMateriales" label="strTipoMaterial" value="intCodTipoMaterial"  />
    		</html:select>
    		<label for="txtDescripMaterial">Tipo Material:</label>
    		<html:text property="descripMaterial" styleId="txtDescripMaterial"></html:text>
    		<html:image src="images/buscar_azul.gif" ></html:image>
    	</div>
    </html:form>
    <div class="separadovertical" >
       	<table style="width: 100%;" class="gridview">
   			<tr>
	   			<th>Seleccionar</th>
	   			<th>Código</th>
	   			<th>Tipo</th>
	   			<th>Descripción</th>
	   			<th>Unidad Medida</th>
	   			<th>Precio Unitario</th>
   			</tr>
   			
   			<logic:notEmpty name="b_materiales">
   				<logic:iterate id="b_mat" name="b_materiales">
					<tr>
		          		<td align="center">
		          			<html:link action="a_buscarMaterialesDevolverMaterial?CodMaterial=${b_mat.strCodMaterial}">
								<html:img src="images/aprob_azul.gif" />
							</html:link>
						</td>	
						<td align="center"><bean:write name="b_mat" property="strCodMaterial"/> </td>
		          		<td><bean:write name="b_mat" property="strTipoMaterial"/> </td>
		          		<td><bean:write name="b_mat" property="strDescripMaterial"/> </td>
		          		<td align="center"><bean:write name="b_mat" property="strUnidadMedida"/> </td>
		          		<td align="center"><bean:write name="b_mat" property="bdPrecioUnitario"/> </td>
					</tr>
   				</logic:iterate>
   			</logic:notEmpty>
   			<logic:empty name="b_materiales">
   				<tr>
   					<td colspan="6">Sin datos que mostrar</td>
   				</tr>
   			</logic:empty>
   			
		</table>
	</div>
       
    <div align="right" class="separadovertical">
    	<html:link action="a_buscarMaterialesSalir">
     		<html:img src="images/salir.png" />
    	</html:link>
    </div>
	

</div>
</body>
</html>
