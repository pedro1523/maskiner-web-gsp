<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 

<c:url var="cssimpresion" value="/styles/designImpresion.css" />

<link href="${cssimpresion}" media="print" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height:210px" class="separadovertical">
<fmt:formatDate value="<%=new Date()%>" type="date"  dateStyle="full" var="fecha" />
        <div style="width:260px;float:left"> <img name="tractor" src="images/logomaskiner.png" width="260" height="185" alt="Logo" /> </div>
        <div style="float:right; width:480px">
          <table width="100%" border="0">
            <tr>
              <td height="49" align="center"><span style="font-size:18px; font-weight:bold">R.U.C. 20515490311</span></td>
            </tr>
            <tr>
              <td height="34" align="center"><span style="font-size:18px; font-weight:bold">FACTURA</span></td>
            </tr>
            <tr>
              <td height="23" align="center"><span style="font-size:18px; font-weight:bold">Nº ${sessionScope.b_factura.strNumSerie} - ${sessionScope.b_factura.strNumFactura}</span></td>
            </tr>
            <tr>
              <td align="right"><p>&nbsp;</p></td>
            </tr>
            <tr>
              <td align="right"><span style="font-size:12px">${fecha}</span></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="separadovertical">
        <table>
          <tr>
            <td width="58"><strong>Raz Soc: </strong></td>
            <td width="238"><strong>Coorporacion Talara</strong></td>
            <td width="50"><strong>R.U.C.</strong></td>
            <td width="168"><strong>10121425691</strong></td>
          </tr>
        </table>
      </div>
      <div class="separadovertical">
        <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
          <tr>
            <th width="110" align="center">Codigo</th>
            <th width="457" align="center">Servicio</th>
            <th width="151" align="center">Monto (S/.)</th>
          </tr>
<c:forEach var="df" items="${sessionScope.a_lista}">
 		<tr>
            <td width="110" align="center">${df.intCodServicio}</td>
            <td width="457" align="center">${df.strDescripcion}</td>
            <td width="151" align="right">${df.dblMonto}</td>
          </tr>

</c:forEach>          

        </table>
      </div>
      <div align="right" >
        <table cellpadding="5" cellspacing="0" class="gridview1 separadovertical">
          <tr>
            <th align="right" bgcolor="#FFFFFF">Subtotal</th>
            <td>${sessionScope.b_factura.bdecSubTotal}</td>
          </tr>
          <tr>
            <th align="right" bgcolor="#FFFFFF">IGV</th>
            <td>
         ${sessionScope.b_factura.strIgv}
          </tr>
          <tr>
            <th align="right" bgcolor="#FFFFFF">Descuento</th>
            <td>${sessionScope.b_factura.bdecMontoDescuento}</td>
          </tr>
          <tr>
            <th width="105" align="right" bgcolor="#FFFFFF">Total</th>
            <td width="149"><strong>
              <label>${sessionScope.b_factura.bdesTotal}</label>
              </strong></td>
          </tr>
        </table>
      </div>
      <span class="separadovertical"><b>SON: ${sessionScope.monto}</b> </span>
      <hr />
      <div class="separadovertical margenderecho" align="right" id="botones_factura"> 
      <s:a href="javascript:print()">
      	<img src="images/imprimir.png" alt="Aceptar" width="71" height="25" border="0" style="margin-right:10px" />
      </s:a>
      	
		<s:a action="a_homepage">
			<img src="images/salir.png" alt="Salir" width="71" height="25" border="0" />
		 </s:a>
		 </div>
</body>
</html>