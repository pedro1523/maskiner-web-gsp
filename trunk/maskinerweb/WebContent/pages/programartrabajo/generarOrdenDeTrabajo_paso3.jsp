<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ taglib uri="/struts-jquery-grid-tags" prefix="sjg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sj:head jqueryui="true"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:url var="csscontenido" value="/styles/contentStyles/generarOrdenTrabajo_Paso3.css" />
<link href="${csscontenido}" rel="stylesheet" type="text/css" />

<title>Insert title here</title>

<script type="text/javascript">
	function enviarSubmitCargarDatosHorasNecesarias(){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_obtenerDatosHorasNecesarias.do";
		document.forms["frmGenerarOT"].submit();
	}
	function enviarSubmitBuscarDisponibilidadTecnicos(){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_buscarDisponibilidadTecnicos.do";
		document.forms["frmGenerarOT"].submit();
	}
	function enviarSubmitAsignarTecnicosAPaquete(){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_asignarTecnicosAPaquete.do";
		document.forms["frmGenerarOT"].submit();
	}
	function enviarSubmitQuitarAsignacionDeTecnicosDePaqueteXOT(codPaquete){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_quitarAsignacionDeTecnicosDePaqueteXOT.do?codPaq=" + codPaquete;
		document.forms["frmGenerarOT"].submit();
	}
	
</script>


<%
	String fecha = FormatoFecha.getFechaActual();
	UsuarioBean usr = (UsuarioBean)session.getAttribute("usuariologueado");
	String registrador = usr.getCodigoUsuario() + " - " + usr.getApellidoPaterno()
				 + " " + usr.getApellidoMaterno();
	request.setAttribute("fechaactual",fecha);
	request.setAttribute("registrador",registrador);
%>

</head>
<body>

  <h2 class="titulo"><s:text name="pages.programartrabajo.generarot_p3.titulo"/></h2>
  <h3 class="subrayado"><s:text name="pages.programartrabajo.generarot_p3.subtitulo"/></h3>
    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p3.lblRegistrador"/>
	  <span class="negrita margenderecho">${registrador}</span>
      <s:text name="pages.programartrabajo.generarot_p3.lblFecha"/>
	  <span class="negrita">${fechaactual}</span>
    </div>
    <div class="separadovertical">
      <s:text name="pages.programartrabajo.generarot_p3.lblCodIncidente"/>
	  <span class="negrita margenderecho"><s:property value="#session.b_ordentrabajo.strNumIncidente"/></span>
      <s:text name="pages.programartrabajo.generarot_p3.lblCliente"/>
      <span class="negrita"><s:property value="#session.b_incidente.strRazonSocialCliente"/></span>
    </div>
    <fieldset>
      <legend><s:text name="pages.programartrabajo.generarot_p3.fieldsetEquipo"/></legend>
      <div>
        <s:text name="pages.programartrabajo.generarot_p3.lblNumTarjeta"/>
        <span class="negrita margenderecho"><s:property value="#session.b_ordentrabajo.strNumTarjeta"/></span>
        <s:text name="pages.programartrabajo.generarot_p3.lblDescripcion"/>
        <span class="negrita margenderecho"><s:property value="session.b_ordentrabajo.strDescripcionMaquinaria"/></span>
        <s:text name="pages.programartrabajo.generarot_p3.lblMarca"/>
        <span class="negrita"><s:property value="#session.b_ordentrabajo.strMarcaMaquinaria"/></span>
      </div>
      <div class="separadoverticalsuperior">
        <s:text name="pages.programartrabajo.generarot_p3.lblModelo"/>
        <span class="negrita margenderecho"><s:property value="#session.b_ordentrabajo.strModeloMaquinaria"/></span>
        <s:text name="pages.programartrabajo.generarot_p3.lblAveria"/>
        <span class="negrita"><s:property value="#session.b_ordentrabajo.strDescripcionAveria"/></span>
      </div>
    </fieldset>
    

    <s:form id="frmGenerarOT" action="a_cnm_generarOT" method="post">
	    <div class="separadovertical">
	      <s:select list="#session.b_ordentrabajo.arrPaquetesXOT"
	      			listKey="strCodPaquete"
	      			listValue="strNombrePaquete"
	      			headerKey="-1"
	      			headerValue="<s:text name="pages.programartrabajo.generarot_p3.lblPaquetes.primeraopcion"/>"
	      			emptyOption="true"
	      			name="paqueteSeleccionado"
	      			label="<s:text name="pages.programartrabajo.generarot_p3.lblPaquetes"/>"
	      			onchange="enviarSubmitCargarDatosHorasNecesarias();" />

	      <div class="separadovertical">
	        <label><s:text name="pages.programartrabajo.generarot_p3.lblNumTecnicosNecesarios"/></label>
	        <span><bean:write name="generarOTPaso3Form" property="numtecnicosnecesarios"/></span>
	        <html:hidden property="numtecnicosnecesarios"/>
	        <label class="margenizquierdo"><s:text name="pages.programartrabajo.generarot_p3.lblNumHorasNecesarias"/></label>
	        <span><bean:write name="generarOTPaso3Form" property="numhorasnecesarias"/></span>
	        <html:hidden property="numhorasnecesarias"/>
	      </div>
	    </div>
	    <div class="separadovertical">
	      <label for="txtFechaAtencion"><s:text name="pages.programartrabajo.generarot_p3.lblFechaAtencion"/></label>
	      <html:text property="fechaAtencion" styleId="txtFechaAtencion" size="10"/>
		  <script language="JavaScript">
				// whole calendar template can be redefined per individual calendar
				var A_CALTPL = {
					'months' : ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
					'weekdays' : ['do', 'lu', 'ma', 'mi', 'ju', 'vi', 'sa'],
					'yearscroll': true,
					'weekstart': 0,
					'centyear' : 70,
					'imgpath' : '${jsCalendarImagePath}'
				};
				
				new tcal ({
					// if referenced by ID then form name is not required
					'controlname': 'txtFechaAtencion'
				}, A_CALTPL);
		  </script>        
	      <label class="margenizquierdo" for="cboHoraInicio"><s:text name="pages.programartrabajo.generarot_p3.lblHoraInicio"/></label>
	      <html:select property="horaInicio" styleId="cboHoraInicio">
	      	<html:option value="07:30">07:30</html:option>
	        <html:option value="08:00">08:00</html:option>
	        <html:option value="08:30">08:30</html:option>
	        <html:option value="09:00">09:00</html:option>
	        <html:option value="09:30">09:30</html:option>
	        <html:option value="10:00">10:00</html:option>
	        <html:option value="10:30">10:30</html:option>
	        <html:option value="11:00">11:00</html:option>
	        <html:option value="11:30">11:30</html:option>
	        <html:option value="12:00">12:00</html:option>
	        <html:option value="12:30">12:30</html:option>
	        <html:option value="13:00">13:00</html:option>
	        <html:option value="13:30">13:30</html:option>
	        <html:option value="14:00">14:00</html:option>
	        <html:option value="14:30">14:30</html:option>
	        <html:option value="15:00">15:00</html:option>
	        <html:option value="15:30">15:30</html:option>
	        <html:option value="16:00">16:00</html:option>
	        <html:option value="16:30">16:30</html:option>
	        <html:option value="17:00">17:00</html:option>
	        <html:option value="17:30">17:30</html:option>
	      </html:select>
	      <label class="margenizquierdo" for="cboHoraFin"><s:text name="pages.programartrabajo.generarot_p3.lblHoraFin"/></label>
	      <html:select property="horaFin" styleId="cboHoraFin">
	      	<html:option value="07:30">07:30</html:option>
	        <html:option value="08:00">08:00</html:option>
	        <html:option value="08:30">08:30</html:option>
	        <html:option value="09:00">09:00</html:option>
	        <html:option value="09:30">09:30</html:option>
	        <html:option value="10:00">10:00</html:option>
	        <html:option value="10:30">10:30</html:option>
	        <html:option value="11:00">11:00</html:option>
	        <html:option value="11:30">11:30</html:option>
	        <html:option value="12:00">12:00</html:option>
	        <html:option value="12:30">12:30</html:option>
	        <html:option value="13:00">13:00</html:option>
	        <html:option value="13:30">13:30</html:option>
	        <html:option value="14:00">14:00</html:option>
	        <html:option value="14:30">14:30</html:option>
	        <html:option value="15:00">15:00</html:option>
	        <html:option value="15:30">15:30</html:option>
	        <html:option value="16:00">16:00</html:option>
	        <html:option value="16:30">16:30</html:option>
	        <html:option value="17:00">17:00</html:option>
	        <html:option value="17:30">17:30</html:option>
	      </html:select>
	      <html:link href="javascript:enviarSubmitBuscarDisponibilidadTecnicos()">
	      	<html:img src="images/buscar_azul.gif" style="magin-left:6px"/>
	      </html:link>
	      <logic:messagesPresent>
	      	<div class="mensajeerror separadovertical">
	      		<html:errors/>
	      	</div>
	      </logic:messagesPresent>
	     <logic:present name="mensajeErrorBuscarDisponibilidadTecnicos">
	      	<div class="mensajeerror separadovertical">
	      		${requestScope.mensajeErrorBuscarDisponibilidadTecnicos}
	      	</div>
	     </logic:present>
	    </div>

	    <div class="separadovertical">
		  <div id="div_tecnicos">
	        <span class="titulotabla"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.titulo"/></span>
	        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="gridview letrapequena">
	           <tr>
	            <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.cabecera.columna1"/></th>
	            <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.cabecera.columna2"/></th>
	            <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.cabecera.columna3"/></th>
	            <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.cabecera.columna4"/></th>
	            <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.cabecera.columna5"/></th>
	            <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.cabecera.columna6"/></th>
	          </tr>
	          
	          <logic:notEmpty name="b_disponibilidadtecnicos">
				  <logic:iterate id="b_tec" name="b_disponibilidadtecnicos" >
					<tr>
						<td><bean:write name="b_tec" property="strCodTecnico" /></td>
						<td>
							<bean:write name="b_tec" property="strApellidoPaterno" />&nbsp;
							<bean:write name="b_tec" property="strApellidoMaterno" />,&nbsp;
							<bean:write name="b_tec" property="strNombre" />
						</td>
						<td><bean:write name="b_tec" property="strDescripcionNivelTecnico" /></td>
						<td><bean:write name="b_tec" property="strDescripcionEspecialidad" /></td>
						<td align="center"><bean:write name="b_tec" property="intNumeroHorasTrabajadasSemana" /></td>
		        		<td align="center">
		        			<html:multibox property="seleccionTecnicos" value="${b_tec.strCodTecnico}"/>
		        		</td>
					</tr>
				  </logic:iterate>
	          </logic:notEmpty>
	          <logic:empty name="b_disponibilidadtecnicos">
	          	<tr>
	          		<td colspan="6"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.pie.sinregistros"/></td>
	          	</tr>
	          </logic:empty>
	        </table>
	      </div>    	
	      <div id="div_asignacion">
	        <div class="separadovertical">
	        	<html:link href="javascript:enviarSubmitAsignarTecnicosAPaquete()">
	        		<html:img src="images/asignar.png" />
	        	</html:link>
	        	<logic:present scope="request" name="mensajeErrorAsignarTecnicos">
	      			<div class="mensajeerror separadovertical">
	      				${requestScope.mensajeErrorAsignarTecnicos}
	      			</div>	        	
	        	</logic:present>
	        </div>
	        <div class="separadovertical">
	          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="gridview letrapequena">
	            <tr>
	              <th width="17%" scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna1"/></th>
	              <th width="32%" scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna2"/></th>
	              <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna3"/></th>
	              <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna4"/></th>
	              <th scope="col"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna5"/></th>
	            </tr>
	            <logic:notEmpty name="b_ordentrabajo" property="arrPaquetesXOT">
	            	<logic:iterate id="b_paqot" name="b_ordentrabajo" property="arrPaquetesXOT" >
	            		<tr>
	            			<td><bean:write name="b_paqot" property="strCodPaquete" /></td>
	            			<td><bean:write name="b_paqot" property="strNombrePaquete" /></td>
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
	            				<logic:empty name="b_paqot" property="arrTecnicosAsignados">
	            					<span style="color: red"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna3.datos"/></span>
	            				</logic:empty>
	            			</td>
	            			<td align="center">
	            				<logic:notEmpty name="b_paqot" property="dtFechEjecOrdenTrabajo" >
	            					<bean:write name="b_paqot" property="dtFechEjecOrdenTrabajo" format="dd/MM/yyyy"/><br/>
	            					<bean:write name="b_paqot" property="tmHoraInicio" format="hh:mm"/> - 
	            				    <bean:write name="b_paqot" property="tmHoraFin" format="hh:mm"/>
	            				</logic:notEmpty>
	            				<logic:empty name="b_paqot" property="dtFechEjecOrdenTrabajo">
	            					<span style="color: red"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna4.datos"/></span>
	            				</logic:empty>
	            			</td>
	            			<td align="center">
	            				<html:link href="javascript:enviarSubmitQuitarAsignacionDeTecnicosDePaqueteXOT('${b_paqot.strCodPaquete}')">
	            					<html:img src="images/quitar.gif"/>
	            				</html:link>
	            			</td>
	            		</tr>
	            	
	            	</logic:iterate>
	            </logic:notEmpty>
	          </table>
	        </div>
	      </div>
	    </div>
	    <div class="margenderecho ds" style="padding-top:10px"> </div>
		<div class="separadovertical" align="right">
	    	<html:link action="a_irAGenerarOT_paso2">
	    		<html:img src="images/atras.png"/>
	    	</html:link>
	    	<html:image src="images/generar.png" />
	    	<html:link action="a_homepage">
	    		<html:img src="images/salir.png"/>
	    	</html:link>
		</div>
	    <logic:present name="mensajeErrorGenerarOrdenTrabajo" scope="request">
		 	<div class="mensajeerror separadovertical">
		 		${requestScope.mensajeErrorGenerarOrdenTrabajo}
		 	</div>
	    </logic:present>
    </s:form>




    
</body>
</html>