<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 class="titulo"><bean:message key="pages.gestionarexpertise.modificarPaquete.titulo" /> </h2>
	<html:form action="a_modificarPaquete" method="post">
		<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.modificarPaquete.titulofield" />  </legend>
			<table>
			<tr ><td><label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio8"/></label>
	<html:text property="codReg" /></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio9"/>  </label>
	<html:text property="FechaPaq" /></td></tr>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio1"/>  </label>
	<html:text property="codigoPaqueteNuevo" /></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio2"/>  </label>
	<html:text property="nombrePaqueteNuevo" /></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio3"/>  </label>
	<html:text property="marcaPaqueteNuevo" />
	</td></tr>
	<tr><td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio4"/>  </label>
	<html:text property="modeloPaqueteNuevo" /></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio5"/>  </label>
	<html:text property="numTecxPaq" /></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio6"/>  </label>
	<html:text property="cantHorasxPaq" /></td>
	</tr>
	<tr><td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaquete.criterio7"/>  </label>
	<html:text property="horometroPaquete" />
			</td></tr>
				</table>
		</fieldset>
		
		<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.titulofield" />  </legend>
			<table>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.criterio1"/>  </label>
	<html:select property="herraPaquete" >
	<html:option value="">--Seleccione--</html:option>
	      	<c:forEach var="herram" items="${herramienta}">
								<option value="${herram.strCodHerramienta}">${herram.strDescripcionHerram}</option>
							</c:forEach>
	</html:select></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.criterio2"/>  </label>
	<html:text property="cantHerraPaquete" >
	
	</html:text></td>
	<td align="center"><input type="image" src="images/bot_mas.gif" align="bottom" title="Agregar sucursal">
                  <input type="image" src="images/bot_mas (1).gif" align="bottom" title="Quitar sucursal"></td>
			
	</tr>
	<tr><td>
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
         <th width="36%" align="center">#</th>
          <th width="7%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.tabla.columna1" />  </th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.tabla.columna2" /> </th>
          <th width="29%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.tabla.columna3"/> </th>
                    
        </tr>
     
		<c:forEach var="paquete" items="${requestScope.listPaquete}">
			<tr>
				<td align="center">${paquete.strCodPaquete}</td>
          		<td align="center">${paquete.strNombre}  </td>
          		<td align="center">${paquete.strMarcaMaqApliPaquete}</td>
          		<td align="center">${paquete.strModeloMaqApliPaquete}</td>
          </tr>
		</c:forEach>
	  </table>
		</fieldset>
		
			<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.modificarPaqueteMat.titulofield" />  </legend>
			<table>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaqueteMat.criterio1"/>  </label>
	<html:select property="materialPaquete" >
	<html:option value="">--Seleccione--</html:option>
	      	<c:forEach var="materiales" items="${material}">
								<option value="${materiales.strCodMaterial}">${materiales.strDescrMat}</option>
							</c:forEach>
	 </html:select></td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaqueteHerr.criterio2"/>  </label>
	<html:text property="cantMatPaquete" ></html:text></td>
	<td align="center"><input type="image" src="images/bot_mas.gif" align="bottom" title="Agregar sucursal">
                  <input type="image" src="images/bot_mas (1).gif" align="bottom" title="Quitar sucursal"></td>
			
	</tr>
	<tr><td>
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
         <th width="36%" align="center">#</th>
          <th width="7%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteMat.tabla.columna1" />  </th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteMat.tabla.columna2" /> </th>
          <th width="29%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteMat.tabla.columna3"/> </th>
                    
        </tr>
     
		<c:forEach var="paquete" items="${requestScope.listPaquete}">
			<tr>
				<td align="center">${paquete.strCodPaquete}</td>
          		<td align="center">${paquete.strNombre}  </td>
          		<td align="center">${paquete.strMarcaMaqApliPaquete}</td>
          		<td align="center">${paquete.strModeloMaqApliPaquete}</td>
          </tr>
		</c:forEach>
	  </table>
		</fieldset>
		
		<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.modificarPaqueteAct.titulofield" />  </legend>
			<table>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.modificarPaqueteAct.criterio"/>  </label>
	<html:text property="actPaquete" /></td>
	<td align="center"><input type="image" src="images/bot_mas.gif" align="bottom" title="Agregar sucursal">
                  <input type="image" src="images/bot_mas (1).gif" align="bottom" title="Quitar sucursal"></td>
			
	</tr>
	<tr><td>
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
         <th width="36%" align="center">#</th>
          <th width="7%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteAct.tabla.columna1" />  </th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.modificarPaqueteAct.tabla.columna2" /> </th>
                    
        </tr>
     
		<c:forEach var="paquete" items="${requestScope.listPaquete}">
			<tr>
				<td align="center">${paquete.strCodPaquete}</td>
          		<td align="center">${paquete.strNombre}  </td>
          		<td align="center">${paquete.strMarcaMaqApliPaquete}</td>
          		<td align="center">${paquete.strModeloMaqApliPaquete}</td>
          </tr>
		</c:forEach>
	  </table>
		</fieldset>
		<table>
		<tr>
		<td class="separadovertical margenderecho" align="right"><html:link action="a_homepage">
					<img src="images/guardar.png" alt="Guardar" width="71" height="25" border="0" />
				</html:link></td>
		<td colspan="4" class="separadovertical margenderecho" align="right"><html:link action="a_homepage">
					<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
				</html:link></td>
		</tr>
		</table>
		              
	</html:form>
	
	
</body>
</html>