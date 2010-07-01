<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form action="">
<h2 class="titulo">Orden de trabajo de inspección</h2>
        <fieldset style="width:400px">
          <legend>Orden de trabajo de inspección</legend>
          <table class="separadovertical" style="border-style: hidden; border-width: thin">
            <tr>
              <td colspan="2"> Registro de Incidentes: </td>
              <td>
              <s:textfield name="b_incidente.strNumeroIncidente" /> 
              <!--<input id="txtIncidente" type="text" value="${sessionScope.b_incidente.strNumeroIncidente}" size="6" />--></td>
              
              <td>
	              <s:url id="buscarIncidente" action="a_cpm_cargarBuscarIncidente1" >
	              	<s:param name="formOrigen">generarOTInspec</s:param>
	              </s:url>      
	              <a href="${buscarIncidente}">
	              	<img alt="Buscar Incidente" src="./images/buscar_azul.gif">
	              </a>
	              
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
              <td align="center"><s:property value="#session.b_incidente.strNumeroIncidente"/></td>
              <td align="center"><s:property value="#session.b_incidente.strRazonSocialCliente"/></td>
             
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
          
          
          	<s:set var="itm" value="1" />
          		<s:iterator var="b_maq" value="#session.b_incidente.arrMaquinariasXIncidente" >
          			<tr>
          				<td align="center">${itm}</td>
						<td><s:property value="#b_maq.strNumeroTarjetaEquipo" /></td>
						<td><s:property value="#b_maq.strDescripcionNaturalezaAveria" /></td>
						<td><s:property value="#b_maq.strDescripcionAveria"/></td>
						<td align="center">
							<s:url var="v_asignar" action="a_cpm_OTIAsignar"> 
								<s:param name="numTarjeta"><s:property value="#b_maq.strNumeroTarjetaEquipo"/></s:param>
								<!--<s:param name="numIncidente"><s:property value="#b_maq.strNumeroIncidente" />  </s:param>-->
							</s:url>
							<s:a href="%{v_asignar}">
								<img src="images/nuevo_azul.gif" border="0" />
							</s:a>
						</td>
          			</tr>
          			<s:set var="itm" value="#itm+1"  />
          		</s:iterator>
          	
        </table>
        <div class="separadovertical margenderecho" align="right"> 
	        <s:a action="a_homepage">
	        <img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
	        </s:a>        
        </div>
      
       
   </s:form>     

</body>
</html>