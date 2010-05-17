<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/plantilla.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><bean:message key="pages.gestionarincidentes.buscarCliente.titulopagina"/></title>
<link href="${cssdiseño}" rel="stylesheet" type="text/css" />
	
</head>
<body class="twoColFixLtHdr">
<div id="contenedor">

      <div>
    	<h2>Buscar Cliente</h2>
      <html:form  method="post" action="a_buscarCliente">
        <div >
          <table>
            <tr>
              <td height="24" >Cliente : </td>
              <td style="width: 353px">
					<html:text property="RazSocCliente" />
				<html:image src="images/buscar_azul.gif" >
	              		<!-- <img src="images/buscar_azul.gif" width="18" height="18" alt="Buscar" style="vertical-align:middle" /> -->
	              </html:image>
              </td>
            </tr>
          </table >
          </br>
          
        <div >
        <table style="width: 100%;" class="gridview">
   			<tr>
   			<th>Codigo</th>
   			<th>Razon Social</th>
   			<th>Ruc</th>
   			<th>Email</th>
   			<th>Seleccionar</th>
   			</tr>
		       <c:forEach var="cliente" items="${requestScope.clientes}">
					<tr>
						<td align="center">${cliente.strCodCliente} </td>
		          		<td align="center">${cliente.strRazSocCliente} </td>
		          		<td align="center">${cliente.strRucCliente} </td>
		          		<td align="center">${cliente.strEmailCliente}  </td>
		          		<td align="center"><html:link action="a_devolverCliente?CodCliente=${cliente.strCodCliente}">
										  <img src="images/nuevo_azul.gif" alt="" border="0" /></html:link>
						</td>	
					</tr>
				</c:forEach>
			</table>
			</div>
        </div>
        </br>
        
        <div align="right" class="separadovertical">
        	<html:link action="a_cargarRegistroIncidente">
        		<html:img src="images/salir.png"/>
        	</html:link>
        </div>
      </html:form>
</div>
</div>
</body>
</html>
