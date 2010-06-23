<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Nuevo Cliente</h2>
      <form id="form1" name="form1" method="post" action="">
        <table border="0" style="width: 617px">
          <tr>
            <td align="right" style="width: 244px">Registrador:&nbsp;&nbsp;
              <input readonly="readonly" name="fech_reg"></td>
            <td align="right">Fecha:&nbsp;&nbsp;
              <input readonly="readonly" name="fech_reg"></td>
          </tr>
        </table>
        <br>
        <div>
          <fieldset style="width: 617px; height: 120px" >
            <legend>Datos Generales</legend>
            <table style="width: 603px">
              <tr >
                <td style="width: 89px">Razón Social:</td>
                <td colspan="3"><input style="width: 459px"></td>
              </tr>
              <tr>
                <td>Nro RUC :</td>
                <td ><input style="width: 93px"></td>
                <td align="justify" style="width: 76px">E-mail: </td>
                <td align="justify" style="width: 268px"><input style="width: 255px"></td>
              </tr>
              <tr >
                <td style="width: 89px">Descripción:</td>
                <td colspan="3"><textarea style="width: 462px"></textarea></td>
              </tr>
            </table>
          </fieldset>
          <fieldset class="separadovertical">
            <legend>Localización de Sucursales</legend>
            <table>
              <tr >
                <td style="width: 89px">Distrito:</td>
                <td colspan="3"><select style="width: 177px">
                  </select></td>
              </tr>
              <tr>
                <td>Dirección :</td>
                <td colspan="3"><input style="width: 477px"></td>
              </tr>
              <tr >
                <td>Teléfono:</td>
                <td style="width: 170px"><input style="width: 150px"></td>
                <td style="width: 60px">Fax:</td>
                <td><input style="width: 150px"></td>
              </tr>
              <tr >
                <td>Contacto:</td>
                <td colspan="2"><input style="width: 293px"></td>
                <td align="center"><input type="image" src="images/bot_mas.gif" align="bottom" title="Agregar sucursal">
                  <input type="image" src="images/bot_mas (1).gif" align="bottom" title="Quitar sucursal"></td>
              </tr>
            </table>
            <br>
            <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
              <tr>
                <th align="center" style="width: 30px; background-color: #A8A8A8"> # </th>
                <th align="center" style="width: 87px; background-color: #A8A8A8"> Distrito </th>
                <th align="center" style="width: 176px; background-color: #A8A8A8"> Dirección </th>
                <th align="center" style="width: 70px; background-color: #A8A8A8">Teléfono</th>
                <th align="center" style="width: 83px; background-color: #A8A8A8">Fax</th>
                <th align="center" style="width: 144px; background-color: #A8A8A8">Contacto</th>
              </tr>
              <tr>
                <td align="center" ><input type="radio"></td>
                <td align="center" > Chorrillos </td>
                <td align="left" > Jr. Delfin 112 </td>
                <td align="center" >7654321</td>
                <td align="center" >945678900</td>
                <td align="center" >Carlos Perales</td>
              </tr>
              <tr>
                <td align="center" ><input type="radio"></td>
                <td align="center" > Magdalena </td>
                <td align="left" > Calle Lima 123 </td>
                <td align="center" >6756432</td>
                <td align="center" >988456540</td>
                <td align="center" >Ricardo Puentes</td>
              </tr>
              <tr>
                <td align="center" ><input type="radio"></td>
                <td align="center" > Surquillo </td>
                <td align="left" > Los Pinos 987 Surquillo </td>
                <td align="center" >5557654</td>
                <td align="center" >985678760</td>
                <td align="center" >Alejandro Quintana</td>
              </tr>
            </table>
          </fieldset>
        </div>
        <div align="right"> <a href="nuevoCliente_confirmacion.html"><img src="images/guardar.png" alt="Guardar" width="71" height="25" border="0" /></a><a href="mantenerClientes.html"><img src="images/cancelar.png" alt="Cancelar" width="71" height="25" border="0" style="margin-left:10px;" /></a></div>
      </form>
</body>
</html>