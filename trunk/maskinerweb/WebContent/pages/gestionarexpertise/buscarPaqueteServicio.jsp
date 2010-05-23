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
<title><bean:message key="pages.gestionarexpertise.buscarPaquete.titulopagina"/> </title>
</head>
<body>
<h2 class="titulo"><bean:message key="pages.gestionarexpertise.buscarPaquete.titulo" /> </h2>
<html:form action="a_buscarPaquete" method="post">
      <fieldset class="separadovertical" style="width:400px;">
      	<legend><bean:message key="pages.gestionarexpertise.buscarPaquete.titulofield" />  </legend>
        <label for="textfield"><bean:message key="pages.gestionarexpertise.buscarPaquete.criterio"/>  </label>
	<html:text property="txtNombrePaquete" />
<html:submit > buscar </html:submit>	

        <span class="separadovertical" style="width:300px;">

      </span>
      </fieldset>
</html:form>
      <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
        <tr>
          <th width="7%" align="center"><bean:message key="pages.gestionarexpertise.buscarPaquete.tabla.columna1" />  </th>
          <th width="17%" align="center"><bean:message key="pages.gestionarexpertise.buscarPaquete.tabla.columna2" /> </th>
          <th width="29%" align="center"><bean:message key="pages.gestionarexpertise.buscarPaquete.tabla.columna3"/> </th>
          <th width="36%" align="center"><bean:message key="pages.gestionarexpertise.buscarPaquete.tabla.columna4" /> </th>
		  <th width="36%" align="center">#</th>          
        </tr>
     
		<c:forEach var="paquete" items="${requestScope.listPaquete}">
			<tr>
				<td align="center">${paquete.strCodPaquete}</td>
          		<td align="center">${paquete.strNombre}  </td>
          		<td align="center">${paquete.strMarcaMaqApliPaquete}</td>
          		<td align="center">${paquete.strModeloMaqApliPaquete}</td>
          		<td align="center"><html:link action="a_mostrarPaquete?codPaquete=${paquete.strCodPaquete}">
								  <img src="images/nuevo_azul.gif" alt="" border="0" /></html:link>
				</td>	
			</tr>
		
		</c:forEach>
		
       
      </table>
              <div class="separadovertical margenderecho" align="right"> 
				<html:link action="a_salirBuscarPaquete">
					<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
				</html:link>
			 </div>

</body>
</html>