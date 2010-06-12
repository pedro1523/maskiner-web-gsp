<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><s:text name="pages.gestionarexpertise.buscarPaquete.titulopagina"/> </title>
</head>
<body>
<h2 class="titulo"><s:text name="pages.gestionarexpertise.buscarPaquete.titulo" /> </h2>
	<s:form action="a_buscarPaquete" method="post">
      <fieldset class="separadovertical" style="width:400px;">
      	<legend><s:text name="pages.gestionarexpertise.buscarPaquete.titulofield" />  </legend>
        <label for="textfield"><s:text name="pages.gestionarexpertise.buscarPaquete.criterio"/>  </label>
		<s:textfield name="txtNombrePaquete" />
		<s:submit type="image" src="images/buscar.png" cssStyle="vertical-align:middle; margin-left:10px"/>
      </fieldset>
	</s:form>
    <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
      <tr>
        <th width="7%" align="center"><s:text name="pages.gestionarexpertise.buscarPaquete.tabla.columna1" />  </th>
        <th width="17%" align="center"><s:text name="pages.gestionarexpertise.buscarPaquete.tabla.columna2" /> </th>
        <th width="29%" align="center"><s:text name="pages.gestionarexpertise.buscarPaquete.tabla.columna3"/> </th>
        <th width="36%" align="center"><s:text name="pages.gestionarexpertise.buscarPaquete.tabla.columna4" /> </th>
  		<th width="36%" align="center">#</th>          
      </tr>
   
	  <c:forEach var="paquete" items="${requestScope.listPaquete}">
		<tr>
			<td align="center">${paquete.strCodPaquete}</td>
       		<td align="center">${paquete.strNombre}  </td>
       		<td align="center">${paquete.strMarcaMaqApliPaquete}</td>
       		<td align="center">${paquete.strModeloMaqApliPaquete}</td>
        	<td align="center">
        		<s:url action="a_mostrarPaquete" var="mostrarPaqueteUrl">
        			<s:param name="codPaquete">${paquete.strCodPaquete}</s:param>
        		</s:url>
        		<s:url value="images/nuevo_azul.gif" var="imagenNuevoAzulUrl"/>
        		<a href="${mostrarPaqueteUrl}">
        			<img alt="" src="${imagenNuevoAzulUrl}" >
        		</a>
			</td>	
		</tr>
	  </c:forEach>
    </table>
    <div class="separadovertical margenderecho" align="right"> 
   		<s:url action="a_salirBuscarPaquete" var="salirBuscarPaqueteUrl"/>
    	<s:url value="images/salir.png" var="imagenSalirUrl"/>
    	<a href="${salirBuscarPaqueteUrl}">
    		<img alt="Salir" src="${imagenSalirUrl}">
    	</a>
	</div>

</body>
</html>