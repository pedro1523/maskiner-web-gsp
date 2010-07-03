<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>
    
</head>
<body>
	<h2 class="titulo"><s:text name="pages.reportes.repFreInc.titulo" /></h2>
<table>

	<tr>

		<!--  aqui va el cuerpo -->
		<td class="separadovertical">
			<s:form method="post" action="a_reporteMaquinariaFre">
			<table class="control" >
				<tr>
					<td><s:text name="pages.reportes.repFreInc.lblcliente" /></td>
					<td>
						<s:textfield name="cliente" label="hola" labelposition="left" labelSeparator=":" value="34" />
<!--						<html:img src="images/buscar_azul.gif" style="margin-right:25px;vertical-align:middle"/>  -->
					</td>
					
					<td><s:text name="pages.reportes.repFreInc.lblannio" /></td>
					<td>
						<s:textfield name="anio" />
					</td>
					
					<td>
						<s:submit cssStyle="margin-left:20px" value="Generar Reporte" />
					</td>
				</tr>
			</table>

			</s:form>
		
		
		</td>


	</tr>



</table>


</body>
</html>