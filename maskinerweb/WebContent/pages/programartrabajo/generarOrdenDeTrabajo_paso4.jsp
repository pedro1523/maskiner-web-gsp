<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="csscontenido" value="/styles/contentStyles/generarOrdenTrabajo_Paso4.css" />
<link href="${csscontenido}" rel="stylesheet" type="text/css" />

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
	        				<s:if test="%{#b_paqot.arrTecnicosAsignados.size()>0}">
	        					<ul class="listaTecnicos">
									<s:iterator var="b_tcopaqot" value="#b_paqot.arrTecnicosAsignados">
		         						<li>
		         							<s:property value="#b_tcopaqot.strApellidoPaterno"/>&nbsp;
		         							<s:property value="#b_tcopaqot.strApellidoMaterno"/>,&nbsp;
		         							<s:property value="#b_tcopaqot.strNombre"/>
		         						</li>
									</s:iterator>
	        					</ul>
	        				</s:if>
	        				
	        			</td>
	        			<td align="center">
	        				<s:if test="%{#b_paqot.dtFechEjecOrdenTrabajo!=null}">
	        					<s:date name="#b_paqot.dtFechEjecOrdenTrabajo" format="dd/MM/yyyy"/><br/>
	        					<s:date name="#b_paqot.tmHoraInicio" format="hh:mm"/> - 
	        					<s:date name="#b_paqot.tmHoraFin" format="hh:mm"/>
	        				</s:if>
	        			</td>
	        		</tr>
	        	</s:iterator>
	        </s:if>
	      </table>    
      	</td>
      </tr>
    </table>
    
    <s:if test="%{#session.b_incidente!=null}">
        <s:set var="cuentaMaquiRevisadas" value="0"/>
		<s:iterator var="b_maq" value="#session.b_incidente.arrMaquinariasXIncidente">
			<s:if test="%{#b_maq.intEstadoAveria==2}">
				<s:set var="cuentaMaquiRevisadas" value="%{cuentaMaquiRevisadas+1}"/>
			</s:if>
		</s:iterator> 
		<s:if test="%{cuentaMaquiRevisadas>0}">
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
		        <s:set var="itm" value="1" />
		        <s:iterator var="b_maq" value="#session.b_incidente.arrMaquinariasXIncidente">
		        	<s:if test="%{b_maq.intEstadoAveria==2}">
			       		<tr>
							<td align="center"><s:property value="itm"/> </td>
							<td><s:property value="b_maq.strNumeroTarjetaEquipo"/></td>
							<td><s:property value="b_maq.strDescripcionMaquinaria"/></td>
							<td><s:property value="b_maq.strMarcaMaquinaria"/></td>
							<td><s:property value="b_maq.strModeloMaquinaria"/></td>
							<td><s:property value="b_maq.strDescripcionAveria"/></td>
			        		<td align="center">
			        			<s:url var="cargarGenerarOTPaso2Url" action="a_cargarGenerarOT_paso2">
			        				<s:param name="numtarj">
			        					${b_maq.strNumeroTarjetaEquipo}
			        				</s:param>
			        			</s:url>
			        			<a href="${cargarGenerarOTPaso2Url}">
			        				<img alt="Generar" src="<s:url value="/images/generar.png" />" />
			        			</a>
			        		</td>
						</tr>
						<s:set var="itm" value="%{itm+1}" />
		        	</s:if>
		        </s:iterator>
			  </table>
			</div>		
		</s:if>
    </s:if>
    <div class="separadovertical" align="right">
	  	<s:a action="a_homepage">
			<img src="<s:url value="/images/salir.png"/>" />
		</s:a>
    </div>
  </form>
</body>
</html>