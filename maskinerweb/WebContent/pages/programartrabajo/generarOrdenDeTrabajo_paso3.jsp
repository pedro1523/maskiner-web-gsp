<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
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
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_cnm_obtenerDatosHorasNecesarias.do";
		document.forms["frmGenerarOT"].submit();
	}
	function enviarSubmitBuscarDisponibilidadTecnicos(){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_cnm_buscarDisponibilidadTecnicos.do";
		document.forms["frmGenerarOT"].submit();
	}
	function enviarSubmitAsignarTecnicosAPaquete(){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_cnm_asignarTecnicosAPaquete.do";
		document.forms["frmGenerarOT"].submit();
	}
	function enviarSubmitQuitarAsignacionDeTecnicosDePaqueteXOT(codPaquete){
		document.forms["frmGenerarOT"].action="<%= request.getContextPath() %>/a_cnm_quitarAsignacionDeTecnicosDePaqueteXOT.do?codPaq=" + codPaquete;
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
        <span class="negrita margenderecho"><s:property value="#session.b_ordentrabajo.strDescripcionMaquinaria"/></span>
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
	      <s:text name="pages.programartrabajo.generarot_p3.lblPaquetes"/>
	      <s:text var="primeraOpcionValue" name="pages.programartrabajo.generarot_p3.lblPaquetes.primeraopcion"/>
	      <s:select list="#session.b_ordentrabajo.arrPaquetesXOT"
	      			listKey="strCodPaquete"
	      			listValue="strNombrePaquete"
	      			headerKey=""
	      			headerValue="%{primeraOpcionValue}"
	      			name="paqueteSeleccionado"
	      			onchange="enviarSubmitCargarDatosHorasNecesarias();" />

	      <div class="separadovertical">
	        <s:text name="pages.programartrabajo.generarot_p3.lblNumTecnicosNecesarios"/>
	        <s:label name="numTecnicosNecesarios" cssClass="negrita margenderecho" />
	        <s:text name="pages.programartrabajo.generarot_p3.lblNumHorasNecesarias"/>
	        <s:label name="numHorasNecesarias" cssClass="negrita" />
	        <s:hidden name="numTecnicosNecesarios"/>
	        <s:hidden name="numHorasNecesarias"/>
	      </div>
	    </div>
	    <div class="separadovertical">
	    	<s:text name="pages.programartrabajo.generarot_p3.lblFechaAtencion"/>
			<sj:datepicker name="tmp_FechaAtencion"
						   buttonImageOnly="true"
						   id="txtFechaAtencion"
						   size="10" 
						   readonly="true"
						   displayFormat="dd/mm/yy"
						   changeYear="true"
						   changeMonth="true"
						   cssStyle="margin-right:5px" />
			<s:hidden name="fechaAtencion"/>
			<s:label key="pages.programartrabajo.generarot_p3.lblHoraInicio" cssClass="margenizquierdo"/>
			<s:select list="#application.l_hora"
					  listKey="codigo"
					  listValue="descripcion"
			      	  name="tmp_HoraInicio" />
			<s:hidden name="horaInicio"/>      	
			<s:label key="pages.programartrabajo.generarot_p3.lblHoraFin" cssClass="margenizquierdo"/>
			<s:select list="#application.l_hora"
					  listKey="codigo"
					  listValue="descripcion"
			      	  name="tmp_HoraFin" />
			<s:hidden name="horaFin"/> 
			<s:url var="enviarBuscDispTecUrl" value="javascript:enviarSubmitBuscarDisponibilidadTecnicos()"/>
			<s:url var="imgBuscDispTecUrl" value="/images/buscar_azul.gif"/>

		    <s:a href="%{enviarBuscDispTecUrl}">
		    	<img src="${imgBuscDispTecUrl}" style="magin-left:6px"/>
		    </s:a>
		    
	      	<div class="mensajeerror separadovertical">
	      		<s:actionerror/>
	      	</div>
	      
	     	<s:if test="%{#request.mensajeErrorBuscarDisponibilidadTecnicos!=null}">
		      	<div class="mensajeerror separadovertical">
		      		<s:property value="#request.mensajeErrorBuscarDisponibilidadTecnicos" />
		      	</div>
	     	</s:if> 
	      
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
	          <s:if test="%{#session.b_disponibilidadtecnicos!=null}">
	          	<s:iterator var="b_tec" value="#session.b_disponibilidadtecnicos">
					<tr>
						<td><s:property value="#b_tec.strCodTecnico"/></td>
						<td>
							<s:property value="#b_tec.strApellidoPaterno"/> &nbsp;
							<s:property value="#b_tec.strApellidoMaterno"/>,&nbsp;
							<s:property value="#b_tec.strNombre"/>
						</td>
						<td><s:property value="#b_tec.strDescripcionNivelTecnico"/></td>
						<td><s:property value="#b_tec.strDescripcionEspecialidad"/></td>
						<td align="center"><s:property value="#b_tec.intNumeroHorasTrabajadasSemana"/></td>
		        		<td align="center">
		        			<s:checkbox name="seleccionTecnicos"  fieldValue="%{#b_tec.strCodTecnico}"/>
		        		</td>
					</tr>
	          	</s:iterator>
	          </s:if>
	          <s:else>
	          	<tr>
	          		<td colspan="6"><s:text name="pages.programartrabajo.generarot_p3.tablatecnicosdisponibles.pie.sinregistros"/></td>
	          	</tr>
	          </s:else>
	          
	        </table>
	      </div>    	
	      <div id="div_asignacion">
	        <div class="separadovertical">
	        	<s:url var="imgAsignarUrl" value="/images/asignar.png" />
	        	<s:a href="javascript:enviarSubmitAsignarTecnicosAPaquete()">
	        		<img src="${imgAsignarUrl}" />
	        	</s:a>
	        	<s:if test="%{#request.mensajeErrorAsignarTecnicos!=null}">
	      			<div class="mensajeerror separadovertical">
	      				<s:property value="#request.mensajeErrorAsignarTecnicos"/>
	      			</div>	        	
	        	</s:if>
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
	            <s:iterator var="b_paqot" value="#session.b_ordentrabajo.arrPaquetesXOT">
            		<tr>
            			<td><s:property value="#b_paqot.strCodPaquete"/></td>
            			<td><s:property value="#b_paqot.strNombrePaquete"/></td>
            			<td>
            				<s:if test="%{#b_paqot.arrTecnicosAsignados.size()>0}">
            					<ul class="listaTecnicos">
            						<s:iterator var="b_tcopaqot" value="#b_paqot.arrTecnicosAsignados">
	            						<li>
	            							<s:property value="#b_tcopaqot.strApellidoPaterno"/> &nbsp;
											<s:property value="#b_tcopaqot.strApellidoMaterno"/>,&nbsp;
											<s:property value="#b_tcopaqot.strNombre"/>
	            						</li>
            						</s:iterator>
            					</ul>
            				</s:if>
            				<s:else>
            					<span style="color: red"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna3.datos"/></span>
            				</s:else>
            			</td>
            			<td align="center">
            				<s:if test="#b_paqot.dtFechEjecOrdenTrabajo!=null">
            					<s:date name="#b_paqot.dtFechEjecOrdenTrabajo" format="dd/MM/yyyy"/><br/>
            					<s:date name="#b_paqot.tmHoraInicio" format="hh:mm"/> - 
            					<s:date name="#b_paqot.tmHoraFin" format="hh:mm"/>
            				</s:if>
            				<s:else>
            					<span style="color: red"><s:text name="pages.programartrabajo.generarot_p3.tablaasignaciones.cabecera.columna4.datos"/></span>
            				</s:else>
            			</td>
            			<td align="center">
            			
            				<a href="javascript:enviarSubmitQuitarAsignacionDeTecnicosDePaqueteXOT('${b_paqot.strCodPaquete}')">
            					<img src="<s:url value="/images/quitar.gif"/>" />
            				</a>
            			</td>
            		</tr>
	            </s:iterator>
	          </table>
	        </div>
	      </div>
	    </div>
	    <div class="margenderecho ds" style="padding-top:10px"> </div>
		<div class="separadovertical" align="right">
			<s:a action="a_cnm_irAGenerarOT_paso2">
				<img src="<s:url value="/images/atras.png"/>" />
			</s:a>
			<s:submit type="image" src="images/generar.png" />
			<s:a action="a_homepage">
				<img src="<s:url value="/images/salir.png"/>" />
			</s:a>
		</div>
		<s:if test="%{#request.mensajeErrorGenerarOrdenTrabajo!=null}">
		 	<div class="mensajeerror separadovertical">
		 		<s:property value="#request.mensajeErrorGenerarOrdenTrabajo"/>
		 	</div>
		</s:if>
    </s:form>


</body>
</html>