<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:url var="jsCalendar" value="/javascript/triga_calendar/calendar_pe.js" />
	<c:url var="jsCalendarCss" value="/javascript/triga_calendar/calendar.css" />
	<c:url var="jsCalendarImagePath" value="/javascript/triga_calendar/img/" />
	<script language="JavaScript" src="${jsCalendar}"></script>
	<link rel="stylesheet" href="${jsCalendarCss}">
<title>Insert title here</title>

</head>
<body>
<s:form action="a_ProgramarOTInspeccionAsignarAction" method="post" scriptLanguage="">

<%if(request.getParameter("numTarjeta")!=null)
	session.setAttribute("tarjetaEquipo",request.getParameter("numTarjeta"));	%>
<h2>Orden de trabajo de inspecci�n</h2>
        <fieldset class="separadovertical">
          <legend>Asignaci�n de personal</legend><br>
          <table>
            <tr>
              
              <td align="right"><b> N� INCIDENTE :</b></td>
              <td>${sessionScope.b_incidente.strNumeroIncidente} </td>
              <td align="right"><b> RAZON SOCIAL :</b> </td>
              <td>${sessionScope.b_cliente.strRazSocCliente} </td>
              <td class="style2">&nbsp;</td>
            </tr>
            <tr>
              
              <td align="right"><b> RUC :</b></td>
              <td>${sessionScope.b_cliente.strRucCliente}</td>
              <td align="right"><b> N� TARJETA EQUIPO :<b></td>
                        
                  
              <td>${sessionScope.tarjetaEquipo}</td>
               
               
              <td class="style2">&nbsp;</td>
            </tr>
            <tr>
              
              <td align="right"><b>FECHA INSPECCION :</b></td>
              <td><html:text property="fechaInspeccion"></html:text>
		<script language="JavaScript">
					// whole calendar template can be redefined per individual calendar
					var A_CALTPL = {
						'months' : ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
						'weekdays' : ['do', 'lu', 'ma', 'mi', 'ju', 'vi', 'sa'],
						'yearscroll': true,
						'weekstart': 0,
						'centyear'  : 70,
						'imgpath' : '${jsCalendarImagePath}'
					};
					
					new tcal ({
						// if referenced by ID then form name is not required
						'controlname': 'fechaInspeccion'
					}, A_CALTPL);
				</script>
</td>
              <td align="right"><b>LUGAR ATENCION :</b></td>
              
              <td>
              <s:textfield name="lugarAtencion" value="b_incidente.strLugarAtencionCliente"> </s:textfield>
             
              </td>
              <td class="style2">&nbsp;</td>
            </tr>
            
            <tr>
            
              <td class="style2" align="right"><b>HORA INICIO :</b></td>
              <td>
              
              <s:select name="OTIBean.strHorInicio"
              		list="#application.l_hora" 
              		listKey="codigo"
              		listValue="codigo">                
		       
              </s:select>
              </td>
              <td align="right"><b>HORA FINAL :</b></td>
              <td><s:select name="OTIBean.strHorFin"
              		list="#application.l_hora" 
              		listKey="codigo"
              		listValue="codigo">                
		       
              </s:select>
              </td>
              <td>
				<html:image src="images/ver_tecnicos.png"></html:image>
              </td>
            </tr>
          </table>
        </fieldset>
</s:form> 
<font color="red">${requestScope.sms}</font>
<html:form action="a_registraOrdenTrabajoInspeccion">
        <table width="100%" cellpadding="5" cellspacing="0" class="gridview">
          <thead>
          <span class="titulotabla">Datos del T�cnico:</span>
          </thead>
          
          <tr align="center">
          <th>#</th>
            <th> Apellido Paterno</th>
            <th> Apellido Materno</th>
            <th> Nombre</th>
            <th> Especialidad</th>
          </tr>
          
          <c:forEach var="tecnico" items="${requestScope.listTecnicos}">
          <tr>
          <td align="center">
          <html:radio property="chkTecnico" value="${tecnico.strCodTecnico}" ></html:radio>
           </td>
          	 <td align="center">${tecnico.strApellidoPaterno}   </td>
          	 <td align="center">${tecnico.strApellidoMaterno}</td>
          	 <td align="center">${tecnico.strNombre}</td>
          	 <td align="center">${tecnico.strDescripcionEspecialidad}</td>	  
         </tr>
          
          
          </c:forEach>
          
          
        </table>
        <div class="separadovertical" align="right"> 			  
			<html:image src="images/asignar.png" onclick="verTecnico"> </html:image> 
			<html:link action="a_cancelarOTIAsignar">
				<img src="images/cancelar.png" alt="Cancelar" width="71" height="25" border="0" />
			</html:link> 
		 </div>
     
</html:form>
</body>
</html>