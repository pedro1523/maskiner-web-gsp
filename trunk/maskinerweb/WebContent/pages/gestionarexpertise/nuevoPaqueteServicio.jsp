<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.maskiner.smc.gestionarexpertise.bean.MaterialesBean"%>
<%@page import="com.maskiner.smc.gestionarexpertise.bean.HerramientaBean"%> 
<%@page import="com.maskiner.smc.gestionarexpertise.bean.ActividadesBean"%>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>
<html>



<%ArrayList<HerramientaBean> HerramientaIni = new ArrayList<HerramientaBean>();
session.setAttribute("HerramientaIni",HerramientaIni);

%>
<%ArrayList<MaterialesBean> MaterialesIni = new ArrayList<MaterialesBean>();
session.setAttribute("MaterialesIni",MaterialesIni);
%>
<%
ArrayList<ActividadesBean> ActividadesIni = new ArrayList<ActividadesBean>();
session.setAttribute("ActividadesIni",ActividadesIni);
%>

<script type="text/javascript">
	function enviarSubmitAgregarALista(){
		document.forms["frmAgregaHerr"].action="<%= request.getContextPath() %>/a_AgregarHerramientaALista.do";
		document.forms["frmAgregaHerr"].submit();
	}

	function enviarSubmitAgregarAMateriales(){
		document.forms["frmAgregaHerr"].action="<%= request.getContextPath() %>/a_AgregarMaterialaLista.do";
		document.forms["frmAgregaHerr"].submit();
	}

	function enviarSubmitAgregarActividades(){
		document.forms["frmAgregaHerr"].action="<%= request.getContextPath() %>/a_AgregarActividadesALista.do";
		//alert(document.forms["frmAgregaHerr"].action);
		document.forms["frmAgregaHerr"].submit();
	}
	function enviarSubmitQuitarActividades(intNumItemActxPaquete){
		document.forms["frmAgregaHerr"].action="<%= request.getContextPath() %>/a_QuitarActividadesDeLista.do?numFila=" + intNumItemActxPaquete;
		document.forms["frmAgregaHerr"].submit();
	}
	function enviarSubmitQuitarHerramienta(intItemHerramienta){
		document.forms["frmAgregaHerr"].action="<%= request.getContextPath() %>/a_QuitarActividadesDeLista.do?numFila=" + intItemHerramienta;
		document.forms["frmAgregaHerr"].submit();
	}
	
	</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
    String fecha = FormatoFecha.getFechaActual();
	UsuarioBean usr = (UsuarioBean)session.getAttribute("usuariologueado");
	String registrador = usr.getCodigoUsuario() + " - " + usr.getApellidoPaterno()
						 + " " + usr.getApellidoMaterno();
	request.setAttribute("fechaactual",fecha);
	request.setAttribute("registrador",registrador);
	
%>
</head>
<body>
<h2 class="titulo"><bean:message key="pages.gestionarexpertise.nuevoPaquete.titulo" /> </h2>
	
	<html:form  styleId="frmAgregaHerr" action="a_nuevoPaquete" method="post">
		
		<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.nuevoPaquete.titulofield" />  </legend>
			<div>
			<table>
			<tr ><td><label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio8"/></label>
	<html:text property="codReg" readonly="readonly" style="width: 200px"
      value="${registrador}" /></td>
	<td colspan="8" align="right" >
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio9"/>  </label>
	<html:text property="FechaPaq" readonly="readonly" value="${fechaactual}"/></td></tr></table>
		</div>	
		<div>
		<table>
			<tr><td align="left">
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio1"/>  </label>
	<html:text property="codigoPaqueteNuevo" /></td>
	<td align="center">
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio2"/>  </label>
	<html:text property="nombrePaqueteNuevo" /></td>
	<td align="right">
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio3"/>  </label>
	<html:text property="marcaPaqueteNuevo" />
	</td></tr></table></div>
	<div>
	<table>
	<tr><td colspan="4" >
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio4"/>  </label>
	<html:text property="modeloPaqueteNuevo" /></td>
	<td align="center">
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio5"/>  </label>
	<html:text property="numTecxPaq" /></td>
	<td align="right">
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio6"/>  </label>
	<html:text property="cantHorasxPaq" /></td>
	</tr>
	</table></div>
	<table>
	<tr><td align="left">
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaquete.criterio7"/>  </label>
	<html:text property="horometroPaquete" />
			</td></tr>
				</table>
		</fieldset>
		
		<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.nuevoPaqueteHerr.titulofield" />  </legend>
			<table>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaqueteHerr.criterio1"/>  </label>
	<html:select property="herraPaquete" >
		      	<html:option value="">--Seleccione--</html:option>
	      	<c:forEach var="herram" items="${herramienta}">
								<option value="${herram.strCodHerramienta}">${herram.strDescripcionHerram}</option>
							</c:forEach>
	      	</html:select>
	</td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaqueteHerr.criterio2"/>  </label>
	<html:text property="cantHerraPaquete" /></td>
	<td align="right">
				<html:link href="javascript:enviarSubmitAgregarALista()">
          			<html:img page="/images/bot_mas.gif"/>
				</html:link>
           </td>		
	</tr>
	<tr><td>
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
         <th width="10%" align="center">Eliminar</th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.nuevoPaqueteHerr.tabla.columna2" /> </th>
          <th width="29%" align="center"><bean:message key="pages.gestionarexpertise.nuevoPaqueteHerr.tabla.columna3"/> </th>
                    
        </tr>
		<c:forEach var="DetalleHerr" items="${sessionScope.Herramienta}">
			<tr>
				<td><html:link action="javascript:enviarSubmitQuitarHerramienta('${DetalleHerr.intItemHerramienta}')"><html:img page="/images/bot_mas (1).gif" title="Quitar avería" /></html:link></td>		
				<td align="center">${DetalleHerr.strCodHerramienta}</td>
          		<td align="center">${DetalleHerr.intCantidadHerramientaxPqte}  </td>
          </tr>
		</c:forEach>
	  </table>
		</fieldset>
		
			<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.nuevoPaqueteMat.titulofield" />  </legend>
			<table>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaqueteMat.criterio1"/>  </label>
		<html:select property="materialPaquete" >
	      	<html:option value="">--Seleccione--</html:option>
	      	<c:forEach var="materiales" items="${material}">
								<option value="${materiales.strCodMaterial}">${materiales.strDescrMat}</option>
							</c:forEach>
	      	</html:select>
	</td>
	<td>
	<label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaqueteHerr.criterio2"/>  </label>
	<html:text property="cantMatPaquete" /></td>
	<td align="right">
				<html:link href="javascript:enviarSubmitAgregarAMateriales()">
          			<html:img page="/images/bot_mas.gif"/>
				</html:link>
              </td>			
	</tr>
	<tr><td>
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
         <th width="10%" align="center">Eliminar</th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.nuevoPaqueteMat.tabla.columna2" /> </th>
          <th width="29%" align="center"><bean:message key="pages.gestionarexpertise.nuevoPaqueteMat.tabla.columna3"/> </th>
                    
        </tr>
     
		<c:forEach var="DetalleMat" items="${sessionScope.Materiales}">
			<tr>
			<td><html:link action="a_quitarMaterial"><html:img page="/images/bot_mas (1).gif" title="Quitar avería" /></html:link></td>
				<td align="center">${DetalleMat.strCodMaterial}</td>
          		<td align="center">${DetalleMat.intCantidadMat}  </td>
          </tr>
		</c:forEach>
	  </table>
		</fieldset>
		<fieldset>
			<legend><bean:message key="pages.gestionarexpertise.nuevoPaqueteAct.titulofield" />  </legend>
			<table>
			<tr><td>
			  <label for="textfield"><bean:message key="pages.gestionarexpertise.nuevoPaqueteAct.criterio"/>  </label>
	<html:text property="actPaquete" />
	</td>
	<td align="right">
				<html:link href="javascript:enviarSubmitAgregarActividades()">
          			<html:img page="/images/bot_mas.gif"/>
				</html:link>
              </td>
	</tr>
	<tr><td>
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
         <th width="10%" align="center">Eliminar</th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.nuevoPaqueteAct.tabla.columna2" /> </th>
        </tr>
		<c:forEach var="DetalleAct" items="${sessionScope.Actividades}">
			<tr>
			<td><html:link href="javascript:enviarSubmitQuitarActividades('${DetalleAct.strCodPaquetexAct}')"><html:img page="/images/bot_mas (1).gif" title="Quitar avería" /></html:link></td>
				
				<td align="center">${DetalleAct.strDescripcionAct}</td>
				
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