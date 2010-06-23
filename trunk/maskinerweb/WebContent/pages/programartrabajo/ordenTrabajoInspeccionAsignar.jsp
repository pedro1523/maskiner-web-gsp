<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url var="jsCalendar" value="/javascript/triga_calendar/calendar_pe.js" />
	<c:url var="jsCalendarCss" value="/javascript/triga_calendar/calendar.css" />
	<c:url var="jsCalendarImagePath" value="/javascript/triga_calendar/img/" />
	<script language="JavaScript" src="${jsCalendar}"></script>
	<link rel="stylesheet" href="${jsCalendarCss}">
<title><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.titulopagina" /></title>

</head>
<body>
<s:form action="a_ProgramarOTInspeccionAsignarAction" method="post" >

<%if(request.getParameter("numTarjeta")!=null )
	session.setAttribute("tarjetaEquipo",request.getParameter("numTarjeta"));	%>
<h2><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.titulo" /></h2>
        <fieldset class="separadovertical">
          <legend><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.legend" /></legend><br>
          <table>
            <tr>
              
              <td align="right"><b> <s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.nroincidente"/> </b></td>
              <td> ${sessionScope.b_incidente.strNumeroIncidente} </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.razonsocial"/> </b> </td>
              <td>${sessionScope.b_cliente.strRazSocCliente} </td>
              <td class="style2">&nbsp;</td>
            </tr>
            <tr>
              
              <td align="right"><b> <s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.ruc" /></b></td>
              <td>${sessionScope.b_cliente.strRucCliente}</td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.nrotarjetaequipo" /><b></td>
                        
                  
              <td>${sessionScope.tarjetaEquipo}</td>
               
               
              <td class="style2">&nbsp;</td>
            </tr>
            <tr>
              
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.fechainspeccion" /></b></td>
              <td>
              <div align="left"> <sj:datepicker name="OTIBean.strFecInspeccion" 
													 displayFormat="dd/mm/yy"  changeYear="true"	    /> </div>
			  </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.lugaratencion" /></b></td>
              
              <td>
              <s:textfield name="lugarAtencion" value="b_incidente.strLugarAtencionCliente"> </s:textfield>
             
              </td>
              <td class="style2">&nbsp;</td>
            </tr>
            
            <tr>
            
              <td class="style2" align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.horainicio" /> </b></td>
              <td>
              
              <s:select name="OTIBean.strHorInicio"
              		list="#application.l_hora" 
              		listKey="codigo"
              		listValue="codigo">                
		       
              </s:select>
              </td>
              <td align="right"><b><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.horafin" /></b></td>
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
          <span class="titulotabla"><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.titulotabla" />
          </span>
          </thead>
          
          <tr align="center">
          <th>#</th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna1" /></th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna2" /> </th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna3" /> </th>
            <th><s:text name="pages.programartrabajo.generarOT_inspeccion_asignar.columna4" /> </th>
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