<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Mantenimiento de Clientes</h2>
      <form id="form1" name="form1" method="post" action="">
        <div align="right">
        	<label>Fecha: </label><input readonly="readonly" name="fech_reg" style="width: 125px">
        </div>
        <div>
          <fieldset style="width: 546px;" class="separadovertical">
            <legend>Búsqueda</legend>
            <div style="width:80%;float:left;">
                <div class="separadoverticalinferior">
                  <label>Razón Social:</label>
                  <input type="text" style="width: 350px" />
              </div>
                <div><span class="separadoverticalinferior">
                  <label>RUC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                  <input type="text" />
                </span></div>
            </div>
            <div style="clear:both"></div>
            
          </fieldset>
          <div align="right">
    <table>
                  <tr>
                    <td><input type="image" src="images/buscar_azul.gif" align="bottom" title="Aprobar Registro de Incidentes"></td>
                    <td><a href="nuevoCliente.html"><img src="images/nuevo_azul.gif" alt="Nuevo Cliente" width="18" height="18" 
                    border="0" /></a></td>
                  </tr>
                </table>
          </div>
          <div align="right" class="separadoverticalinferior"></div>
          <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
            <tr>
              <th width="57" align="center" style="width: 45px"> Modificar </th>
              <th width="104" align="center"> Código </th>
              <th width="323" align="center"> Descripción </th>
              <th width="112" align="center"> RUC</th>
              <th width="102" align="center"> Fecha Registro</th>
            </tr>
            <tr>
              <td align="center"><a href="modificarCliente.html"><img src="images/modificar.gif" alt="Modificar" width="18" height="18" border="0" /></a></td>
              <td align="center"> CLI0001</td>
              <td> Gloria S.A.</td>
              <td align="center"> 10106532587</td>
              <td align="center"> 11/12/2008</td>
            </tr>
            <tr>
              <td align="center"><a href="modificarCliente.html"><img src="images/modificar.gif" alt="Modificar" width="18" height="18" border="0" /></a></td>
              <td align="center"> CLI0002</td>
              <td> Empresa ALICORP SAA </td>
              <td align="center"> 20236542472</td>
              <td align="center"> 24/12/2007</td>
            </tr>
            <tr>
              <td align="center"><a href="modificarCliente.html"><img src="images/modificar.gif" alt="Modificar" width="18" height="18" border="0" /></a></td>
              <td align="center"> CLI0003</td>
              <td> Lactinax SAA </td>
              <td align="center"> 20215628772 </td>
              <td align="center"> 01/05/2008</td>
            </tr>
            <tr>
              <td align="center"><a href="modificarCliente.html"><img src="images/modificar.gif" alt="Modificar" width="18" height="18" border="0" /></a></td>
              <td align="center"> CLI0004</td>
              <td> Caladonia Warehouses</td>
              <td align="center"> 22547894872</td>
              <td align="center"> 24/10/2009</td>
            </tr>
            <tr>
              <td align="center"><a href="modificarCliente.html"><img src="images/modificar.gif" alt="Modificar" width="18" height="18" border="0" /></a></td>
              <td align="center"> CLI0005</td>
              <td> Andean Food Asociation</td>
              <td align="center"> 10106584578</td>
              <td align="center"> 31/09/2009</td>
            </tr>
          </table>
        </div>
        <br>
        <div align="right"> <a href="index.html"><img src="images/salir.png" alt="Salir" width="71" height="25" border="0" /></a></div>
      </form>

</body>
</html>