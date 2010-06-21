<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="/struts-jquery-grid-tags" prefix="sjg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="csscontenido" value="/styles/contentStyles/generarOrdenTrabajo_Paso4.css" />
<link href="${csscontenido}" rel="stylesheet" type="text/css" />
<sj:head jqueryui="true"/>
<title>Insert title here</title>
</head>
<body>
  <h2 class="titulo"><s:text name="pages.programartrabajo.generarot_p4.titulo"/></h2>
  <h3 class="subrayado"><s:text name="pages.programartrabajo.generarot_p4.subtitulo"/></h3>
  <form action="" method="post">
    <p class="avisoconfirmacion separadovertical"><s:text name="pages.programartrabajo.generarot_p4.confirmacion"/></p>
    <div class="titulotabla"><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.titulotabla"/></div>
    <table>
      <tr>
      	<td>
	      <table id="resumen_izq" border="0" cellpadding="0px" cellspacing="0" class="gridview1 ">
	        <tr>
	          <th width="53%"><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna1"/></th>
	          <td width="47%"><s:property value="#session.b_ordentrabajo.strNumOrdenTrabajo"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna2"/></th>
	          <td><s:property value="#session.b_ordentrabajo.strNumIncidente"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna3"/></th>
	          <td><s:property value="#request.razonsocialcliente"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna4"/></th>
	          <td><s:property value="#session.b_ordentrabajo.strNumTarjeta"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna5"/></th>
	          <td><s:property value="#session.b_ordentrabajo.strDescripcionMaquinaria"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna6"/></th>
	          <td><s:property value="#session.b_ordentrabajo.strMarcaMaquinaria"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna7"/></th>
	          <td><s:property value="#session.b_ordentrabajo.strModeloMaquinaria"/></td>
	        </tr>
	        <tr>
	          <th><s:text name="pages.programartrabajo.generarot_p4.tabladatosot.columna8"/></th>
	          <td><s:property value="#session.b_ordentrabajo.strDescripcionAveria"/></td>
	        </tr>
	      </table>
	      <table id="resumen_der" border="0" cellpadding="0" cellspacing="0" class="gridview">
	        <tr>
	          <th width="17%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaasignaciones.columna1"/></th>
	          <th width="25%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaasignaciones.columna2"/></th>
	          <th scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaasignaciones.columna3"/></th>
	          <th scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaasignaciones.columna4"/></th>
	        </tr>
	        
	        <s:if test="%{#session.b_ordentrabajo.arrPaquetesXOT.size()>0}">
	        	<s:iterator var="b_paqot" value="#session.b_ordentrabajo.arrPaquetesXOT">
	        		<tr>
	        			<td><s:property value="#b_paqot.strCodPaquete"/></td>
	        			<td><s:property value="#b_paqot.strNombrePaquete"/></td>
	        			<td>
	        				<logic:notEmpty name="b_paqot" property="arrTecnicosAsignados">
	        					<ul class="listaTecnicos">
	         					<logic:iterate id="b_tcopaqot" name="b_paqot" property="arrTecnicosAsignados">
	         						<li>
										<bean:write name="b_tcopaqot" property="strApellidoPaterno" />&nbsp;
										<bean:write name="b_tcopaqot" property="strApellidoMaterno" />,&nbsp;
										<bean:write name="b_tcopaqot" property="strNombre" />
	         						</li>
	         					</logic:iterate>
	        					</ul>
	        				</logic:notEmpty>
	        			</td>
	        			<td align="center">
	        				<logic:notEmpty name="b_paqot" property="dtFechEjecOrdenTrabajo" >
	        					<bean:write name="b_paqot" property="dtFechEjecOrdenTrabajo" format="dd/MM/yyyy"/><br/>
	        					<bean:write name="b_paqot" property="tmHoraInicio" format="hh:mm"/> - 
	        				    <bean:write name="b_paqot" property="tmHoraFin" format="hh:mm"/>
	        				</logic:notEmpty>
	        			</td>
	        		</tr>
	        	
	        	</s:iterator>
	        </s:if>
	      </table>    
      	</td>
      </tr>
    </table>
   
    <logic:notEmpty name="b_incidente">
        <c:set var="cuentaMaquiRevisadas" value="0"/>
        <logic:iterate id="b_maq" name="b_incidente" property="arrMaquinariasXIncidente">
        	<logic:equal name="b_maq" property="intEstadoAveria" value="2">
        		<c:set var="cuentaMaquiRevisadas" value="${cuentaMaquiRevisadas+1}"  />
        	</logic:equal>
        </logic:iterate>
        
        <logic:greaterThan name="cuentaMaquiRevisadas" value="0">
		    <div class="separadovertical">
		      <span class="titulotabla"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.titulo"/></span>
		      <table width="100%" border="0" cellpadding="5" cellspacing="0" class="gridview">
		        <tr>
		          <th width="7%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna1"/></th>
		          <th width="13%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna2"/></th>
		          <th width="19%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna3"/></th>
		          <th width="12%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna4"/></th>
		          <th width="13%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna5"/></th>
		          <th width="26%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna6"/></th>
		          <th width="10%" scope="col"><s:text name="pages.programartrabajo.generarot_p4.tablaequiposfaltantes.columna7"/></th>
		        </tr>
		        <tr>
				<c:set var="itm" value="1" />
				<logic:iterate id="b_maq" name="b_incidente" property="arrMaquinariasXIncidente">
		       	  <logic:equal name="b_maq" property="intEstadoAveria" value="2">
		       		<tr>
						<td align="center">${itm}</td>
						<td><bean:write name="b_maq" property="strNumeroTarjetaEquipo" /></td>
						<td><bean:write name="b_maq" property="strDescripcionMaquinaria" /></td>
						<td><bean:write name="b_maq" property="strMarcaMaquinaria" /></td>
						<td><bean:write name="b_maq" property="strModeloMaquinaria" /></td>
						<td><bean:write name="b_maq" property="strDescripcionAveria"/></td>
		        		<td align="center">
			 			    <html:link action="a_cargarGenerarOT_paso2?numtarj=${b_maq.strNumeroTarjetaEquipo}">
					    		<html:img src="images/generar.png"/>
					    	</html:link>
		        		</td>
					</tr>
					<c:set var="itm" value="${itm+1}"  />
				  </logic:equal>
				</logic:iterate>
			  </table>
			</div>        
        </logic:greaterThan>
      
      </logic:notEmpty>
    <div class="separadovertical" align="right">
   	    <html:link action="a_homepage">
    		<html:img src="images/salir.png"/>
    	</html:link>
    </div>
  </form>
</body>
</html>