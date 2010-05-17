<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Date"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

<c:forEach var="lista" items="${sessionScope.a_lista}" >
	<tr>
		<td colspan="5">
			<h3>Maquinaria: ${lista.strNumTarjeta}</h3>
		</td>
	</tr>

		<c:forEach var="listDetalle" items="${sessionScope.a_listaDetalle}" >
				<c:if test="${lista.strLiquidacion == listDetalle.strNumLiquidacion}"> 
					
      				<tr>
						<td align="center">${listDetalle.strCodigo}</td>
						<td align="center">${listDetalle.strDescripcion}</td>
						<td align="right">${listDetalle.intCantidad}</td>
						<td align="right">${listDetalle.decPrecio}</td>
						<td align="right">${listDetalle.decImporte}</td>
					</tr>
						<c:if test="${listDetalle.strCodigo=='MA0000'}">
							<c:set var="totalAdicionales" value="${totalAdicionales + listDetalle.decImporte}" />
						</c:if>
						<c:if test="${listDetalle.strCodigo!='MA0000' && listDetalle.strFlag!='TC' }">
							<c:set var="totalMateriales" value="${totalMateriales+listDetalle.decImporte}" />
						</c:if>
						<c:if test="${listDetalle.strFlag=='TC'}" >
							<c:set var="totalServicio" value="${totalServicio+listDetalle.decImporte}" />
						</c:if> 
							
				 </c:if>
							
		</c:forEach>
			
			<tr>
			          <td colspan="3" rowspan="4" align="center" style="border-left:none; border-bottom:none;">&nbsp;</td>
			          <td width="118" align="right" class="gridview1 subtotalheader">Total Materiales</td>
			          <td width="120" align="center" class="gridview1 subtotalcontent"><c:out value="${totalMateriales}"></c:out> </td>
			        </tr>
			        <tr>
			          <td align="right" class="gridview1 subtotalheader">Total Servicios</td>
			          <td align="center" class="gridview1 subtotalcontent"><c:out value="${totalServicio}"></c:out> </td>
			        </tr>
			        <tr>
			          <td align="right" class="gridview1 subtotalheader">Total Adicionales</td>
			          <td align="center" class="gridview1 subtotalcontent"><c:out value="${totalAdicionales}"></c:out> </td>
			        </tr>
			        <tr><c:set var="subTotal" value="${totalMateriales + totalAdicionales + totalServicio}" />
			          <td align="right" class="gridview1 subtotalheader">SubTotal</td>
			          <td align="center" class="gridview1 subtotalcontent">${subTotal}</td>
			   </tr>
<br>
<c:set var="total" value="${total + subTotal}" />
<c:set var="totalAdicionales" value="0" />	
<c:set var="totalMateriales" value="0" />
<c:set var="totalServicio" value="0" />

</c:forEach>  
    
      </table>
<div align="left"> 
<html:form action="a_aprobarPrefactura?monto=${total}">
Rechazar<input type="checkbox" value="1"  name="chkObservacion"/> <font color="Red">${requestScope.mensaje} </font><br>
observacion :<br>
<textArea  cols="30" rows="5" name="observacion"></textarea> 

</div>
<div class="separadovertical margenderecho" align="right">
      <table  cellpadding="5" cellspacing="0" class="gridview1 separadovertical">
        <tr>
	  
          <th width="118" align="right" bgcolor="#FFFFFF">Total</th>
          <td width="120"><strong>
            <label><c:out value="${total}"></c:out> </label>
            </strong></td>
        </tr>
      </table></div>

      
       <div class="separadovertical margenderecho" align="right">
			<html:image src="images/guardar.png" >
				
			 </html:image>			
 
		<a href="index.html">
			<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
		</a>
	</div>
</html:form>
     </div>
 

</body>
</html>
