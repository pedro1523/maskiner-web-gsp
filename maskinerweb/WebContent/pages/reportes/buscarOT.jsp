<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/plantilla.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<c:url var="jsCalendar" value="/javascript/triga_calendar/calendar_pe.js" />
	<c:url var="jsCalendarCss" value="/javascript/triga_calendar/calendar.css" />
	<c:url var="jsCalendarImagePath" value="/javascript/triga_calendar/img/" />


	<script language="JavaScript" src="${jsCalendar}"></script>
	<link rel="stylesheet" href="${jsCalendarCss}" />
	<link href="${cssdiseño}" rel="stylesheet" type="text/css" />
<title><bean:message key="pages.reportes.buscarOT.titulopagina"/></title>

	
</head>
<body class="twoColFixLtHdr">
<div id="contenedor">

      <div>
    	<h2 class="titulo"><bean:message key="pages.reportes.buscarOT.titulo"/></h2>
      <html:form  method="post" action="a_buscarOT">
        <div >
          <table class="separadovertical">
            <tr>
              <td height="24" >Nombre de Cliente:
              	<html:text property="RazSocCliente" />
              </td>
              
			<td><label for="txtFechIni" class="margenizquierdo">Fecha inicio:</label>
				<html:text	property="fechainicio" styleId="txtFechIni" size="10"></html:text>
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
			
			<td>
				<label for="txtFechFin" class="margenizquierdo">Fecha fin:</label>
				<html:text	property="fechafin" styleId="txtFechFin" size="10"></html:text>
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
            <td>
            	<html:image	src="images/buscar.png" style="margin-left:25px;vertical-align:middle"></html:image>
            </td>  
            </tr>
          </table >
          <br/>
          
        <div >
        	<table style="width: 100%;" class="gridview">
	   			<tr>
		   			<th>Codigo OT</th>
		   			<th>Cod. Cliente</th>
		   			<th>Nombre Cliente</th>
		   			<th>Fecha OT</th>
		   			<th>Seleccionar</th>
	   			</tr>
	<!--		       <c:forEach var="cliente" items="${requestScope.clientes}">-->
	<!--					<tr>-->
	<!--						<td align="center">${cliente.strCodCliente} </td>-->
	<!--		          		<td align="center">${cliente.strRazSocCliente} </td>-->
	<!--		          		<td align="center">${cliente.strRucCliente} </td>-->
	<!--		          		<td align="center">${cliente.strEmailCliente}  </td>-->
	<!--		          		<td align="center"><html:link action="a_devolverCliente?CodCliente=${cliente.strCodCliente}">-->
	<!--										  <img src="images/nuevo_azul.gif" alt="" border="0" /></html:link>-->
	<!--						</td>	-->
	<!--					</tr>-->
	<!--				</c:forEach>-->
	   			<tr>
		   			<td>OT0001</td>
		   			<td>CL2124</td>
		   			<td>Fuerza Marítima Oceano S.A.</td>
		   			<td>12/05/1997</td>
		   			<td align="center"><html:img src="images/aprob_azul.gif"/></td>
	   			</tr>
	   			<tr>
		   			<td>OT3201</td>
		   			<td>CL2022</td>
		   			<td>Portuaria Aduanera Sol Azul</td>
		   			<td>25/11/2001</td>
		   			<td align="center"><html:img src="images/aprob_azul.gif"/></td>
	   			</tr>
	   			<tr>
		   			<td>OT6522</td>
		   			<td>CL0025</td>
		   			<td>Multinacional Perea S.A.</td>
		   			<td>07/08/2003</td>
		   			<td align="center"><html:img src="images/aprob_azul.gif"/></td>
	   			</tr>
	   			<tr>
		   			<td>OT6552</td>
		   			<td>CL7541</td>
		   			<td>Barcos Unidos Garcia S.A.</td>
		   			<td>13/10/1999</td>
		   			<td align="center"><html:img src="images/aprob_azul.gif"/></td>
	   			</tr>
		

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
