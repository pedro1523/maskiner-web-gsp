<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<sj:head jqueryui="true"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><s:text name="pages.facturacion.prefactura_buscar.titulopagina" /></title>
</head>
<body>
<h2 class="titulo"><s:text name="pages.facturacion.prefactura_buscar.titulo" /></h2>
<s:form action="a_cpm_buscarPrefacturas"> 
		<fieldset>
			<legend><s:text name="pages.facturacion.prefactura_buscar.legend" /></legend>
			<div class="separadovertical"> 
			<label for="txtNombreEmpresa"><s:text name="pages.facturacion.prefactura_buscar.empresa" /></label> 
			<s:textfield name="nombreEmpresa" id="txtNombreEmpresa" >  </s:textfield> 
			<label for="txtFechIncidente" class="margenizquierdo"><s:text name="pages.facturacion.prefactura_buscar.fecha" /></label> 
			<!--<s:textfield	name="fechaIncidente" id="txtFechIncidente" ></s:textfield>-->
			<sj:datepicker name="fechaIncidente"
							   buttonImageOnly="true"
							   id="fechaInspeccion"
							   size="10" 
							   displayFormat="dd/mm/yy"
							   changeYear="true"
							   changeMonth="true"
							   cssStyle="margin-right:5px" />
				<label for="txtIncidente" class="margenizquierdo"><s:text name="pages.facturacion.prefactura_buscar.incidente" /></label>
				<s:textfield name="incidente" id="txtIncidente" ></s:textfield>
			</div>
			<div class="separadoverticalsuperior" align="right">
			<!--<html:image	src="images/buscar.png"></html:image>--></div>
			<s:submit type="image" src="images/buscar.png"></s:submit>
		</fieldset>
	</s:form>

      <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
          <th width="7%" align="center"><s:text name="pages.facturacion.prefactura_buscar.column1" /></th>
          <th width="17%" align="center"><s:text name="pages.facturacion.prefactura_buscar.column2" /></th>
          <th width="29%" align="center"><s:text name="pages.facturacion.prefactura_buscar.column3" /></th>
          <th width="36%" align="center"><s:text name="pages.facturacion.prefactura_buscar.column4" /></th>
          <th width="11%" align="center"><s:text name="pages.facturacion.prefactura_buscar.column5" /></th>
        </tr>
<%int i=0; %>
			 <s:iterator var="lista" value="#session.listPrefactura1">
			 <%++i;%>
			 	<tr>
			 		<td align="center"><%=i%></td>
			        <td align="center"> <s:property value="#lista.strNumPrefactura"/> </td>
			        <td align="center"><s:property value="#lista.strNumOrdTrabajo"/> </td>
			        <td align="center"><s:property value="#lista.strFecIncidente"/></td>
			        <td align="center">
			          <s:url var="mostrarPrefactura" action="a_cpm_mostrarPrefactura">
			          	<s:param name="prefactura">${lista.strNumPrefactura}</s:param>
			          	<s:param name="incidente">${lista.strNumOrdTrabajo}</s:param>
			          </s:url>
			          <s:a href="%{mostrarPrefactura}">
			          	<img src="images/nuevo_azul.gif" alt="" border="0" /> 
			          </s:a>			
				  </td>
			 	</tr>
			 </s:iterator>
</table>
      <div class="separadovertical margenderecho" align="right">
			 <s:a action="a_homepage">
	        	<s:text var="salirImgi18n" name="pages.botones.salir" />
	        	<s:url var="salirImgUrl" value="%{salirImgi18n}" />
	        <img src="${salirImgUrl}" alt="Salir" width="71" height="25" border="0" />
	        </s:a>  
	 </div>

</body>
</html>