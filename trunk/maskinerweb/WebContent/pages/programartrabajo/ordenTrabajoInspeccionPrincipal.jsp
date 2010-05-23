<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="">
<h2 class="titulo">Orden de trabajo de inspección</h2>
        <fieldset style="width:400px">
          <legend>Orden de trabajo de inspección</legend>
          <table class="separadovertical" style="border-style: hidden; border-width: thin">
            <tr>
              <td colspan="2"> Registro de Incidentes: </td>
              <td><input id="txtIncidente" type="text" value="${sessionScope.b_incidente.strNumeroIncidente}" size="6" /></td>
              <td>
              	<html:link action="a_cargarBuscarIncidente1?formOrigen=generarOTInspec">
              		<html:img page="/images/buscar_azul.gif"/>
              	</html:link>
              </td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </fieldset>
        <div class="separadovertical">
          <span class="titulotabla">Orden de Trabajo</span>
          <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
            <tr align="center">
              <th> ITEM</th>
              <th> Registro de Incidente</th>
              <th> Cliente</th>
              
            </tr>
            <tr>
              <td align="center"> 1</td>
              <td align="center">${sessionScope.b_incidente.strNumeroIncidente}</td>
              <td align="center">${sessionScope.b_incidente.strRazonSocialCliente}</td>
              
            </tr>
          </table>
        </div>
        <div class="titulotabla">Atención por Orden de Trabajo de Inspección</div>       
        <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
          <tr align="center">
            <th>Item</th>
            <th> Nº Tarjeta de Equipo</th>
            <th> Avería por Categoria</th>
            <th> Descripcion</th>
            <th> Asignar Personal</th>
          </tr>
          
		<logic:present name="b_incidente">
			<c:set var="itm" value="1" />
			<logic:iterate id="b_maq" name="b_incidente" property="arrMaquinariasXIncidente">
				<tr>
					<td align="center">${itm}</td>
					<td><bean:write name="b_maq" property="strNumeroTarjetaEquipo" /></td>
					<td><bean:write name="b_maq" property="strDescripcionNaturalezaAveria" /></td>
					<td><bean:write name="b_maq" property="strDescripcionAveria"/></td>
         					<td align="center">
         					<html:link action="a_OTIAsignar?numTarjeta=${b_maq.strNumeroTarjetaEquipo}">
							<img src="images/nuevo_azul.gif" border="0" />
							</html:link>
							</td>
				</tr>
				<c:set var="itm" value="${itm+1}"  />
			</logic:iterate>
		</logic:present>
        </table>
        <div class="separadovertical margenderecho" align="right"> 
        <html:link action="a_homepage.do">
        <img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
        </html:link>
        
         </div>
   </form>     

</body>
</html>