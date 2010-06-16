<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
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

<h2 class="titulo">Reporte de T�cnicos por Orden de Trabajo</h2>
	
<table>

	<tr>

		<!--  aqui va el cuerpo -->
		<td class="separadovertical">
			<html:form method="post" action="a_reporteTecnicosOT">
			<table class="control separadovertical" >
				<tr>
					
				   <td>Orden de Trabajo: </td>
					<td>
						<html:text property="ot" />
						<html:link action="a_irbuscarOT">
							<html:img src="images/buscar_azul.gif" style="margin-right:5px;vertical-align:middle"/>  
						</html:link>  
					</td>
					
					<!--
									
					<td><label for="txtFechIni" class="margenizquierdo">Fecha inicio</label>  </td> 
					<td><html:text	property="fechainicio" styleId="txtFechIni" size="10"></html:text>
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
						'controlname': 'txtFechIni'    
					}, A_CALTPL);
					</script> 
						
					</td>
					
					<td><label for="txtFechFin" class="margenizquierdo">Fecha fin</label>  </td>
					<td><html:text	property="fechafin" styleId="txtFechFin" size="10"></html:text>
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
						'controlname': 'txtFechFin'   
					}, A_CALTPL);
					</script> 
						
					</td>
					
					-->
					
					<td>
						<html:submit styleClass="margenizquierdo">Generar Reporte</html:submit>
					</td>
				</tr>
			</table>

			</html:form>
		
		
		</td>


	</tr>



</table>


</body>
</html>