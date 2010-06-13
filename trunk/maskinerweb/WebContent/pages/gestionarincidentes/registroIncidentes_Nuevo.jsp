<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	ArrayList<DetalleRegistroIncidenteBean> DetalleIni = new ArrayList<DetalleRegistroIncidenteBean>();
	session.setAttribute("DetalleIni",DetalleIni);
	
	String fecha = FormatoFecha.getFechaActual();
	UsuarioBean usr = (UsuarioBean)session.getAttribute("usuariologueado");
	String registrador = usr.getCodigoUsuario() + " - " + usr.getApellidoPaterno()
				 + " " + usr.getApellidoMaterno();
	request.setAttribute("fechaactual",fecha);
	request.setAttribute("registrador",registrador);
 %>


<script type="text/javascript">
	function enviarSubmitAgregarALista(){
		document.forms["frmNuevoIncidente"].action="<%= request.getContextPath() %>/a_AgregarIncidenteALista.do";
		document.forms["frmNuevoIncidente"].submit();
	}
	function enviarSubmitBuscarMaquinarias(){
		document.forms["frmNuevoIncidente"].action="<%= request.getContextPath() %>/a_buscarMaquinaria.do";
		document.forms["frmNuevoIncidente"].submit();
	}
	function enviarSubmitQuitarIndidenteDeLista(intNumeroItem){
		document.forms["frmNuevoIncidente"].action="<%= request.getContextPath() %>/a_QuitarIncidenteDeLista.do?numFila=" + intNumeroItem;
		document.forms["frmNuevoIncidente"].submit();
	}
</script>

<script type="text/javascript">

/***********************************************
* Textarea Maxlength script- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

function ismaxlengthTxtDescripcion(){
	var mlength=300;
	var obj = document.getElementById("txtDescripcion");
	if (obj.value.length>mlength)
		obj.value=obj.value.substring(0,mlength);
}

</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Incidentes</title>

</head>
<body>
    <html:form  styleId="frmNuevoIncidente" method="post" action="a_cargarRegistroIncidente">
	<h2 class="titulo">Nuevo Registro de Incidentes</h2>
          <div>
            <table border="0" style="width: 617px">
              <tr>
                <td align="left" style="width: 335px">Registrador : 
                <html:text property="Registrador" value="${registrador}" style="width: 200px" readonly="true"></html:text></td>
                <td align="right" style="width: 250px">Fecha :
                  <html:text property="Fecha" value="${fechaactual}" readonly="true"></html:text>
                </td>
              </tr>
            </table>
            <br>
          </div>
          
          <div>
            <table  class="separadovertical" style="border-style: hidden; border-width: thin">
              <tr>
                <td colspan="2"> Cliente: </td>
              	<td>
              		<html:text  property="Cliente" readonly="true" value="${sessionScope.cliente.strRazSocCliente}" ></html:text>
              		<html:hidden property="CodCliente" value="${sessionScope.cliente.strCodCliente}"/>
              	</td>
              	<td>
              		<html:link action="a_buscarCliente">
              		<html:img page="/images/buscar_azul.gif" />
              		</html:link>
              	</td>
              </tr>
            </table>
            <br>
          </div>

          

          <div>
            <fieldset style="width: 617px" >
              <legend>Detalle por Incidente</legend>
              <table>
                <tr>
	                <td > Sucursal (Localización): </td>
	              	<td>
	              	<html:select property="Sucursal">
							<html:option value="001" >-- Seleccionar --</html:option>
							<c:forEach var="sucursal" items="${sessionScope.cliente.arrSucursalBean}">
								<html:option value="${sucursal.strNumSucursal}">${sucursal.strDescDistrito}</html:option>
							</c:forEach>

					</html:select>
						<html:link href="javascript:enviarSubmitBuscarMaquinarias()" >
              				<html:img page="/images/buscar_azul.gif"/>
						</html:link>
					</td>
              	</tr>
                <tr>
	                <td style="width: 165px">Nro de Tarjeta:</td>
	                <td>
	                	<table style="width: 100%;" class="gridview">
	                		<tr>
	                			<th style="width: 19px" align="center" style="width: 18px">#</th>
	                			<th style="width: 74px" align="center">Nro Tarjeta</th>
	                			<th style="width: 103px" align="center">Descripción</th>
	                			<th style="width: 101px" align="center">Estado</th>
	                		</tr>
	                		<tr>
	                			<c:forEach var="maquinarias" items="${maquinarias}">
	                				<tr>
	                					<td><html:radio property="chk" value="${maquinarias.strNumTarjeta}"></html:radio></td>
	                					<td>${maquinarias.strNumTarjeta}</td>
	                					<td>${maquinarias.strDescMaq}</td>
	                					<td>${maquinarias.strDesEstMaquinaria}</td>
	                				</tr>
	                			</c:forEach>
	                		</tr>
	                	</table>
					<br>
                  	</td>
                </tr>
                <tr>
	                <td>Naturaleza de la Avería :</td>
	                <td colspan="3" style="width: 433px">
 	                	<html:select property="cboNatAveria" >
							<option value="-1">-- Seleccionar --</option>
							<c:forEach var="averia" items="${averias}">
								<option value="${averia.intCodItemTabla}">${averia.strDescTabla}</option>
							</c:forEach>
						</html:select>
					</td>
	            </tr>
                <tr >
                  <td>Descripción:</td>
                  <td style="width: 439px"><html:textarea property="Descripcion" styleId="txtDescripcion"  style="width: 100%; height: 74px" onkeyup="return ismaxlengthTxtDescripcion()"></html:textarea></td>
                </tr>
              </table>
            </fieldset>
          </div>
          <div align="right">
				<html:link href="javascript:enviarSubmitAgregarALista()">
          			<html:img page="/images/bot_mas.gif"/>
				</html:link>          		

           </div>
          <table cellspacing="0" cellpadding="5" class="gridview" width="100%">
            <tr>
			  <th width="10%" align="center">Quitar</th>
              <th width="11%" align="center"> Nro Tarjeta </th>
              <th width="30%" align="center">Naturaleza de Avería</th>
              <th width="30%" align="center">Descripción</th>
            </tr>

			<logic:present name="mensajeerror" scope="request">
	 		 	<div class="mensajeerror separadoverticalsuperior"><bean:write name="mensajeerror" scope="request"/> </div>
			</logic:present>

 			<c:forEach var="Detalles" items="${sessionScope.Detalle}">
				<tr>
					<td>
						<html:link href="javascript:enviarSubmitQuitarIndidenteDeLista('${Detalles.intNumeroItem}')">
          					<html:img page="/images/bot_mas (1).gif"/>
          				</html:link>
					</td>
 					<td>${Detalles.strNumeroTarjetaEquipo}</td>
 					<td>${Detalles.intNaturalezaAveria}</td>
 					<td>${Detalles.strDescripcionNaturalezaAveria}</td>
				</tr>
 			</c:forEach>
 
          </table>
          <br>
          <div align="right">
          		<html:link action="a_registrarIncidente"><html:img page="/images/guardar.png"/></html:link>
          		<html:link action="a_homepage"><html:img page="/images/salir.png"/></html:link> 
          </div>
       
    <logic:present name="mensajeerror1" scope="request">
	  	<div class="mensajeerror separadoverticalsuperior"><bean:write name="mensajeerror1" scope="request"/> </div>
	</logic:present>

     </html:form>


</body>
</html>