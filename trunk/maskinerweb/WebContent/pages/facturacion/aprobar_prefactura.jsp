<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
<fmt:formatDate value="<%=new Date()%>" type="date" pattern="dd/MM/yyyy" var="fecha" /> 
      <div> <!-- InstanceBeginEditable name="ContenidoApp" -->
      <h2 class="titulo">Aprobar Prefactura</h2>
<br>
      <table width="700" border="0">
		<tr>
                <td align="right" ><b>Registrador :</b> </td>
				<td>
                ${sessionScope.usuariologueado.username}
				</td>
                <td align="right" ><b>Fecha :</b></td>
				<td>
                  ${fecha}
                </td>
        </tr>
		<tr>
			<td colspan="7"><br>  </td>
		</tr>

		<tr>
			<td align="right"><b>Cliente :</b>  </td>
			<td>${sessionScope.b_prefactura.strCodCliente} 			
			</td>
			<td align="right"><b>RUC :</b> </td>
			<td>${sessionScope.b_prefactura.strRuc}
			
		</tr>
		<tr>
			<td align="right" ><b>Direccion :</b> </td>
			<td>${sessionScope.b_prefactura.strDireccion}
		</tr>
		<tr>
			<td align="right"><b>N° Prefactura :</b> </td>
			<td>${sessionScope.b_prefactura.strNumPrefactura}
			
			<td align="right"><b>Fecha Prefactura :</b> </td>
			<td>03/02/2010</td>
		</tr>
      </table>
      <hr />
<table width="100%" cellpadding="5" cellspacing="0" class="gridview">
		<tr>
          <th width="139" align="center">Código</th>
          <th width="172" align="center">Descripción</th>
          <th width="149" align="center">Cantidad</th>
          <th align="center">PrecioUnitario</th>
          <th align="center">Importe</th>
        </tr>
						<s:set var="totalServicio" value="0" />
						<s:set var="totalMateriales" value="0" />
						<s:set var="totalAdicionales" value="0" />
						<s:set var="total" value="0"/>
<s:iterator var="lista" value="#session.a_lista" >
	<tr>
		<td colspan="5">
			<h3>Maquinaria: ${lista.strNumTarjeta}</h3>
		</td>
	</tr>

		<s:iterator var="listDetalle" value="#session.a_listaDetalle" >
				<s:if test="%{#lista.strLiquidacion == #listDetalle.strNumLiquidacion}"> 
					
      				<tr>
						<td align="center"><s:property value="#listDetalle.strCodigo"/></td>
						<td align="center"><s:property value="#listDetalle.strDescripcion"/></td>
						<td align="right"><s:property value="#listDetalle.intCantidad"/></td>
						<td align="right"><s:property value="#listDetalle.decPrecio"/></td>
						<td align="right"><s:property value="#listDetalle.decImporte"/></td>
					</tr>
						
						<s:if test="%{#listDetalle.strCodigo =='MA0000'}">
							<s:set var="totalAdicionales" value="%{#totalAdicionales + #listDetalle.decImporte }" />
						</s:if>
						<s:if test="%{#listDetalle.strCodigo != 'MA0000' && #listDetalle.strFlag != 'TC' }">
							<s:set var="totalMateriales" value="%{#totalMateriales + #listDetalle.decImporte  }" />
						</s:if>
						<s:if test="%{#listDetalle.strFlag == 'TC'}" >
							<s:set var="totalServicio" value="%{#totalServicio + #listDetalle.decImporte  }" />
						</s:if>
				 </s:if>
				 
		</s:iterator>
				<s:if test="%{#totalMateriales == null}">
			        	<s:set var="totalMateriales" value="0" />
			        </s:if>
			        <s:if test="%{#totalAdicionales == null}">
			        	<s:set var="totalAdicionales" value="0" />
			        </s:if>
			        <s:if test="%{#totalServicio == null}">
			        	<s:set var="totalServicio" value="0" />
			        </s:if>
				<tr>
			          <td colspan="3" rowspan="4" align="center" style="border-left:none; border-bottom:none;">&nbsp;</td>
			          <td width="118" align="right" class="gridview1 subtotalheader">Total Materiales</td>
			          <td width="120" align="center" class="gridview1 subtotalcontent"><s:property value="#totalMateriales"/></td>
			        </tr>
			        <tr>
			          <td align="right" class="gridview1 subtotalheader">Total Servicios</td>
			          <td align="center" class="gridview1 subtotalcontent"> <s:property  value="#totalServicio"/></td>
			        </tr>
			        <tr>
			          <td align="right" class="gridview1 subtotalheader">Total Adicionales</td>
			          <td align="center" class="gridview1 subtotalcontent"><s:property value="#totalAdicionales"/> </td>
			        </tr>
			        <tr>
			       <s:set var="subTotal" value="%{#totalMateriales + #totalAdicionales + #totalServicio}" />
			          <td align="right" class="gridview1 subtotalheader">SubTotal</td>
			          <td align="center" class="gridview1 subtotalcontent"><s:property value="#subTotal"/></td>
			   </tr>
<br>
<s:set var="total" value="%{#total + #subTotal}" />
<s:set var="totalAdicionales" value="0" />	
<s:set var="totalMateriales" value="0" />
<s:set var="totalServicio" value="0" />

</s:iterator>  
    
      </table>
<div align="left"> 
<s:url action="a_cpm_aprobarPrefactura" var="urlForm">
	<s:param name="monto">${total}</s:param>
</s:url>
<s:form  action="%{#urlForm}" >

Rechazar<input type="checkbox" value="1"  name="chkObservacion"/> <font color="Red">${requestScope.mensaje} </font><br>
observacion :<br>
<textArea  cols="30" rows="5" name="observacion"></textarea> 


<div class="separadovertical margenderecho" align="right">
      <table  cellpadding="5" cellspacing="0" class="gridview1 separadovertical">
        <tr>
	  
          <th width="118" align="right" bgcolor="#FFFFFF">Total</th>
          <td width="120"><strong>
            <label>  <s:property value="%{#total}"/>  </label>
            </strong></td>
        </tr>
      </table></div>

      
       <div class="separadovertical margenderecho" align="right">
       <s:submit type="image" src="images/guardar.png"></s:submit>	
 
		<a href="index.html">
			<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
		</a>
	</div>

    
 </s:form>
 </div>
</body>
</html>
