<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
     <s:form action="a_cargarBuscarIncidenteLiquidacion?formOrigen=RegistrarLiquidacion" method="post">
        <div>
            <table border="0" style="width: 617px">
              <tr>
                <td align="left" style="width: 300px"> 
                	<s:text name="pages.liquidartrabajo.registrarIL.lblCodRegistrador" />
				    <span class="negrita margenderecho">${registrador}</span>
				</td>
                <td align="center" style="width: 250px"> 
                	<s:text name="pages.liquidartrabajo.registrarIL.lblFechaRegistro" />
      				<span class="negrita">${fechaactual}</span>
                </td>
              </tr>
            </table>
            <br>
        </div>
        <br/>

        <fieldset style="width:500px;">
          <legend><s:text name="pages.liquidartrabajo.registrarIL.lblFechaRegistro" /></legend>
          	<div class="separadovertical">
        	 <s:text name="pages.liquidartrabajo.registrarIL.lblCodIncidente" />
     			<span class="negrita margenderecho"><s:property value="#session.incidente.strNumeroIncidente"/></span>
				<s:submit type="image" src="images/buscar_azul.gif"/>
		  	</div>
			<div class="separadovertical">			
                <s:text name="pages.liquidartrabajo.registrarIL.lblRazSocCliente" />
				<span class="negrita margenderecho"><s:property value="#session.incidente.strCodigoCliente"/></span>
			</div>
			<div class="separadovertical">
				<s:text name="pages.liquidartrabajo.registrarIL.lblFechaAtencion" />
				<span class="negrita margenderecho"><s:property value="#session.incidente.dtFechaIncidente"/></span>
			</div>
        </fieldset>
        <br />
        <fieldset>
          <legend> <s:text name="pages.liquidartrabajo.registrarIL.legendDetalle" /></legend>
          <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
            <tr>
              <th width="17%"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.cabecera.OrdenTrabajo" /></th>
              <th width="27%"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.cabecera.NummTarjeta" /></th>
              <th width="25%"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.cabecera.ClasificacionAveria" /></th>
              <th width="11%"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.cabecera.Registrado" /></th>
            </tr>
           <s:if test="%{#session.incidente != null}">
				<s:if test="%{#session.incidente.arrOrdenDeTrabajoXIncidente.size()>0}">
			<c:set var="itm" value="1" />
				<s:iterator var="b_OT" value="#session.incidente.arrOrdenDeTrabajoXIncidente"  >
				
					<tr>
						<td><s:property value="#b_OT.strNumeroOT"/></td>
						<td><s:property value="#b_OT.strNumeroTarjeta"/></td>
						<td><s:property value="#b_OT.strTipoAveria"/></td>
	         			<td align="center">
							<s:if test="#b_OT.strEstadoAveria==1">		
		        				<span style="color: red; font-weight: bold"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.Registrado.mensajeEstadoOT1" /></span>
							</s:if>
		        			<s:if test="#b_OT.strEstadoAveria==2">		
		        				<span style="color: red; font-weight: bold"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.Registrado.mensajeEstadoOT2" /></span>
							</s:if>
							<s:if test="#b_OT.strEstadoAveria==3">		
								<s:a action="a_cargarRegistrarInformeLiquidacionPaso2" >
									<img src="images/generar.png" />
							      	<s:param name="numOT" >${b_OT.strNumeroOT}</s:param>							     
						     	</s:a>
							</s:if>
							<s:if test="#b_OT.strEstadoAveria==4">		
		        				<span style="color: red; font-weight: bold"><s:text name="pages.liquidartrabajo.registrarIL.detalleEquipos.Registrado.mensajeEstadoOT4" /></span>
							</s:if>
        				</td>
					</tr>
					<c:set var="itm" value="${itm+1}"  />
				</s:iterator>
				</s:if>
      	<s:else>
	 	  	<tr>
		  		<td colspan="7"><s:text name="pages.liquidartrabajo.registrarIL.listaOrdenes.sinDatosParaMostrar" /></td>
		  	</tr>
      	</s:else>
			</s:if>

          </table>
        </fieldset>
        <div class="separadovertical margenderecho" align="right"> 
	        <s:a action="a_homepage">
	    		<img src="images/salir.png" />
	    	</s:a>
		</div>
      </s:form>

</body>
</html>