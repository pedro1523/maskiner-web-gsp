<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sj:head jqueryui="true"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.titulopagina" /></title>
<script type="text/javascript">
	function validarCampos(){
		var fecha 	= document.forms["frmoti"].frmoti.fechaInspeccion.value;
		var hInicio = document.forms["frmoti"].frmoti.horaInicio.value;
		var hFin	= document.forms["frmoti"].frmoti.horaFin.value;
		
		if(fecha.equals("")){
			alert('Ingrese Fecha de Inspección');
			return false;
		}
		if(hInicio>=hFin){
			alert('Hora inicio no puede ser mayo o igual a la hora fin');
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

	<%if(request.getParameter("numTarjeta")!=null)
	session.setAttribute("tarjetaEquipo",request.getParameter("numTarjeta") );	%>
<s:form action="a_cpm_ProgramarOTInspeccionAsignarAction" method="post"  name="frmoti" >


<h2><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.titulo" /></h2>
        <fieldset class="separadovertical">
          <legend><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.legend" /></legend><br>
          <table>
            <tr>
              
              <td align="right"><b> <s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.nroincidente"/> </b></td>
              <td> <s:property value="#session.b_incidente.strNumeroIncidente"/> </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.razonsocial"/> </b> </td>
              <td><s:property value="#session.b_cliente.strRazSocCliente"/>  </td>
              <td class="style2">&nbsp;</td>
            </tr>
            <tr>
              
              <td align="right"><b> <s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.ruc" /></b></td>
              <td><s:property value="#session.b_cliente.strRucCliente"/> </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.nrotarjetaequipo" /></b></td>
                        
               <s:param name="tarjeta" value="numTarjeta"></s:param>  
              <td>${sessionScope.tarjetaEquipo}    </td>
               
               
              <td class="style2">&nbsp;</td>
            </tr>
            <tr>
              
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.fechainspeccion" /></b></td>
              <td>
              <div align="left"> 
             
              		<sj:datepicker name="fechaInspeccion"
							   buttonImageOnly="true"
							   id="fechaInspeccion"
							   size="10" 
							   displayFormat="dd/mm/yy"
							   changeYear="true"
							   changeMonth="true"
							   cssStyle="margin-right:5px" 
							   value="%{#session.fechaInspeccion}"
							     />
              
             
               </div>
			  </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.lugaratencion" /></b></td>
              
              <td>
             <s:textfield name="lugarAtencion" value="%{#session.b_incidente.strLugarAtencionCliente}"> </s:textfield>
             
              </td>
              <td class="style2">&nbsp;</td>
            </tr>
            
            <tr>
            
              <td class="style2" align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.horainicio" /> </b></td>
              <td>
              
              <s:select name="horaInicio"
              		list="#application.l_hora" 
              		listKey="codigo"
              		listValue="codigo">                
		       
              </s:select>
              </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.horafin" /></b></td>
              <td><s:select name="horaFin"
              		list="#application.l_hora" 
              		listKey="codigo"
              		listValue="codigo">                
		       
              </s:select>
              </td>
              <td>
              <s:submit value="Ver Tecnicos" type="image" src="images/ver_tecnicos.png" onclick="javascript:validarCampos()"></s:submit>
              
				<!--<html:image src="images/ver_tecnicos.png"></html:image>-->
              </td>
            </tr>
            <tr>
            	<td colspan="4">
            		<font color="red">${sessionScope.mensajeError}  </font>
            	</td>
            </tr>
          </table>
        </fieldset>
</s:form> 
<!--<font color="red"><s:property value="requestScope.sms"/> </font>-->
<s:form action="a_cpm_registraOrdenTrabajoInspeccion">
        <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
          <thead>
          <span class="titulotabla">
          	<s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.titulotabla" />
          </span>
          </thead>
          
          <tr align="center">
          <th>#</th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna1" /></th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna2" /> </th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna3" /> </th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna4" /> </th>
          </tr>
          
          <s:iterator var="tecnico" value="#session.listTecnicos">
          	<tr>
          		 <td align="center"><input type="radio" name="chkTecnico" value="${tecnico.strCodTecnico}"> </td>
          		 <td align="center"><s:property value="#tecnico.strApellidoPaterno"/> </td>
	          	 <td align="center"><s:property value="#tecnico.strApellidoMaterno"/>   </td>
	          	 <td align="center"><s:property value="#tecnico.strNombre"/> </td>
	          	 <td align="center"><s:property value="#tecnico.strDescripcionEspecialidad"/> </td>	
          	</tr>
          
          </s:iterator>
          
          
          
          
        </table>
      	<div class="separadovertical" align="right"> 	
      		<s:submit src="images/asignar.png" type="image"></s:submit>
      		<s:a href="a_cpm_cancelarOTIAsignar">
      			<img src="images/cancelar.png" alt="Cancelar" width="71" height="25" border="0" />
      		</s:a>	  
			<!--<html:image src="images/asignar.png" onclick="verTecnico"> </html:image> 
			<html:link action="a_cancelarOTIAsignar">
				<img src="images/cancelar.png" alt="Cancelar" width="71" height="25" border="0" />
			</html:link> 
		 --></div>
     
</s:form>
</body>
</html>