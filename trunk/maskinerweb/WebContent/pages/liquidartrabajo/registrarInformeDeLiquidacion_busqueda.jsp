<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date"%>
<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String fecha = FormatoFecha.getFechaActual();
	UsuarioBean usr = (UsuarioBean)session.getAttribute("usuariologueado");
	String registrador = usr.getCodigoUsuario() + " - " + usr.getApellidoPaterno()
				 + " " + usr.getApellidoMaterno();
	request.setAttribute("fechaactual",fecha);
	request.setAttribute("registrador",registrador);
 %>
<head>
<fmt:formatDate value="<%=new Date() %>" type="date" pattern="dd/MM/yyyy" var="fecha" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Generar Informe de Liquidación</h2>
     <html:form action="a_cargarInformeLiquidacion" method="post">
        <div>
            <table border="0" style="width: 617px">
              <tr>
                <td align="left" style="width: 300px">Registrador : 
                <html:text property="Registrador" value="${registrador}" style="width: 200px" readonly="true"></html:text></td>
                <td align="center" style="width: 250px">Fecha :
                  <html:text property="Fecha" value="${fechaactual}" readonly="true"></html:text>
                </td>
              </tr>
            </table>
            <br>
        </div>
        <br/>

        <fieldset style="width:500px;">
          <legend>Datos del incidente</legend>
          <table>
            <tr>
              <td width="98"><label for="NumIncidente">N° de Incidente:</label></td>
              <td width="40" style="padding: 0pt 0pt 0pt 5px;">
				<html:text property="NumIncidente" value="${incidente.strNumeroIncidente}"></html:text>
			  </td>
              <td width="20">
				<html:link href="a_cargarBuscarIncidenteLiquidacion.do?formOrigen=RegistrarLiquidacion">
					<img src="images/buscar_azul.gif" width="18" height="18" alt="Buscar" />
				</html:link>
			  </td>
            </tr>
          </table>
          <br />
          <table>
            <tr>
              <td width="44"><label for="Cliente">Cliente:</label></td>
              <td width="169" style="padding: 0pt 0pt 0pt 5px;">
				<html:text property="Cliente" value="${incidente.strCodigoCliente}"></html:text>
			  </td>
              <td width="32"></td>
              <td width="116"><label for="especialidadMed">Fecha de Atención:</label></td>
              <td width="69" style="padding: 0pt 0pt 0pt 5px;">	
				<html:text property="FechaAtencion" value="${incidente.dtFechaIncidente}"></html:text>
			  </td>
            </tr>
          </table>
        </fieldset>
        <br />
        <fieldset>
          <legend>Detalle de  Orden de Trabajo por Incidente</legend>
          <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
            <tr>
              <th width="17%">Orden de Trabajo</th>
              <th width="27%">NºTarjeta de Equipo</th>
              <th width="25%">Clasificación Avería</th>
              <th width="11%">Registrado</th>
            </tr>
           
			<logic:present name="incidente">
			<c:set var="itm" value="1" />
				<logic:iterate id="b_OT" name="incidente" property="arrOrdenDeTrabajoXIncidente">
					<tr>
						<td><bean:write name="b_OT" property="strNumeroOT" /></td>
						<td><bean:write name="b_OT" property="strNumeroTarjeta" /></td>
						<td><bean:write name="b_OT" property="strTipoAveria"/></td>
	         			<td align="center">
		        			<logic:equal name="b_OT" property="strEstadoAveria" value="1">
		        				<span style="color: red; font-weight: bold">O/T inspección no generada</span>
		        			</logic:equal>
		        			<logic:equal name="b_OT" property="strEstadoAveria" value="2">
			 			    	<span style="color: red; font-weight: bold">O/T no generada</span>
		        			</logic:equal>
		         			<logic:equal name="b_OT" property="strEstadoAveria" value="3">
								<html:link action="a_cargarRegistrarInformeLiquidacionPaso2?numOT=${b_OT.strNumeroOT}">
						    		<html:img src="images/generar.png"/>
						    	</html:link>
							</logic:equal>
		        			<logic:equal name="b_OT" property="strEstadoAveria" value="4">
								<html:link action="a_cargarRegistrarInformeLiquidacionPaso2?numOT=${b_OT.strNumeroOT}">
						    		<html:img src="images/generar.png"/>
								</html:link>
			 			    	<span style="color: green; font-weight: bold">Inf.Liq. generado</span>
		        			</logic:equal>
        				</td>
					</tr>
					<c:set var="itm" value="${itm+1}"  />
				</logic:iterate>
			</logic:present>
			<logic:empty name="incidente">
				  	<tr>
				  		<td colspan="7" align="center">Sin Ordenes que mostrar</td>
				  	</tr>
			</logic:empty>

          </table>
        </fieldset>
        <div class="separadovertical margenderecho" align="right"> <html:link action="a_homepage"><img src="images/salir.png" alt="Salir" width="71" height="25" border="0" /></html:link> </div>
      </html:form>

</body>
</html>