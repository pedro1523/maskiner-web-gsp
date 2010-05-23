<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>
    
</head>
<body>
	<h2 class="titulo">Historial de Maquinaria</h2>
<table>

	<tr>

		<!--  aqui va el cuerpo -->
		<td class="separadovertical">
			<html:form method="post" action="a_reporteMaquinariaHis">
			<table class="control" >
				<tr>
					
			        <br/><br/>
				   
					<td>Maquinaria: </td>
					<td>
						<html:text property="maquinaria" />  
						<html:img src="images/buscar_azul.gif" style="margin-right:25px;vertical-align:middle"/>  
					</td>
				
					<td>
						<html:submit> Generar Reporte </html:submit>
					</td>
				</tr>
			</table>

			</html:form>
		
		
		</td>


	</tr>



</table>


</body>
</html>