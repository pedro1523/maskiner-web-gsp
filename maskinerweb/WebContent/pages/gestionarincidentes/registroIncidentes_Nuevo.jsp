<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>

<%@ page import="com.maskiner.smc.mylib.FormatoFecha" %>
<%@ page import="com.maskiner.smc.seguridad.bean.UsuarioBean"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	ArrayList<DetalleRegistroIncidenteBean> DetalleIni = new ArrayList<DetalleRegistroIncidenteBean>();
	session.setAttribute("DetalleIni",DetalleIni);
	
	String fecha = FormatoFecha.getFechaActual();
	UsuarioBean usr = (UsuarioBean)session.getAttribute("usuariologueado");
	String registrador = usr.getCodigoUsuario() + " - " + usr.getApellidoPaterno()
				 + " " + usr.getApellidoMaterno();
	request.setAttribute("fechaactual",fecha);
	request.setAttribute("registrador",registrador);
 %>


<script type="text/javascript">
	function enviarSubmitAgregarALista(){
		document.forms["frmNuevoIncidente"].action="<%= request.getContextPath() %>/a_AgregarIncidenteALista";
		document.forms["frmNuevoIncidente"].submit();
	}
	function enviarSubmitBuscarMaquinarias(){
		document.forms["frmNuevoIncidente"].action="<%= request.getContextPath() %>/a_buscarMaquinaria";
		document.forms["frmNuevoIncidente"].submit();
	}
	function enviarSubmitQuitarIndidenteDeLista(intNumeroItem){
		document.forms["frmNuevoIncidente"].action="<%= request.getContextPath() %>/a_QuitarIncidenteDeLista?numFila=" + intNumeroItem;
		document.forms["frmNuevoIncidente"].submit();
	}
</script>

<script type="text/javascript">

/***********************************************
* Textarea Maxlength script- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

function ismaxlengthTxtDescripcion(){
	var mlength=300;
	var obj = document.getElementById("txtDescripcion");
	if (obj.value.length>mlength)
		obj.value=obj.value.substring(0,mlength);
}

</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Incidentes</title>

</head>
<body>
	<s:form name="frmNuevoIncidente" method="post" action="a_cargarRegistroIncidente">	
	
	<h2 class="titulo"><s:text name="pages.gestionarincidentes.registrarIncidente_Nuevo.titulo" /></h2>
          <div>
            <table border="0" style="width: 617px">
              <tr>
                <td align="left" style="width: 335px">
                <s:text name="pages.gestionarincidentes.regincidentes.lblRegistrador" />
      				<span class="negrita margenderecho">${registrador}</span>
                </td>
                <td align="right" style="width: 250px">
                <s:text name="pages.gestionarincidentes.regincidentes.lblFechaRegistro" />
      				<span class="negrita">${fechaactual}</span>
                </td>
              </tr>
            </table>
            <br>
          </div>
          
          <div>
            <table  class="separadovertical" style="border-style: hidden; border-width: thin">
              <tr>
                <td colspan="2">
					<s:text name="pages.gestionarincidentes.regincidentes.lblCliente" />
				</td>
              	<td>
              		<span class="negrita margenderecho"><s:property value="#session.cliente.strRazSocCliente"/></span>
              		<input type="hidden" name="CodCliente" value="${cliente.strCodCliente}">
              		<s:hidden name="CodCliente" value="#session.cliente.strCodCliente"></s:hidden>
              	</td>
              	<td>
              	<s:a action="a_cargarBuscarCliente">
		    		<img src="images/buscar_azul.gif" />
		    	</s:a>
              	</td>
              </tr>
            </table>
            <br>
          </div>

          

          <div>
            <fieldset style="width: 617px" >
              <legend><s:text name="pages.gestionarincidentes.regincidentes.fieldsetDetalleXIncidente" /></legend>
              <table>
                <tr>
	                <td ><s:text name="pages.gestionarincidentes.regincidentes.lblSucursal" /></td>
	              	<td>
	              
	              	<s:select name="Sucursal" 
		               	list="#session.arrSucursalBean" 
		                listKey="strNumSucursal" 
		                listValue="strDescDistrito"/> 
			                
			             	<s:submit onclick="enviarSubmitBuscarMaquinarias()" value="Buscar"></s:submit>
	         				
					</td>
              	</tr>
                <tr>
	                <td style="width: 165px"><s:text name="pages.gestionarincidentes.regincidentes.lblNroTarjeta" /></td>
	                <td>
	                	<table style="width: 100%;" class="gridview">
	                		<tr>
	                			<th style="width: 19px" align="center" style="width: 18px">#</th>
	                			<th style="width: 74px" align="center"><s:text name="pages.gestionarincidentes.regincidentes.listaMaquinarias.columna1.cabecera" /></th>
	                			<th style="width: 103px" align="center"><s:text name="pages.gestionarincidentes.regincidentes.listaMaquinarias.columna2.cabecera" /></th>
	                			<th style="width: 101px" align="center"><s:text name="pages.gestionarincidentes.regincidentes.listaMaquinarias.columna3.cabecera" /></th>
	                		</tr>
	                		<tr>
	                			<s:iterator var="maquinaria" value="#session.arr_maquinarias">
							<tr>
	                		<td><input name="chk" type="radio" value="${maquinaria.strNumTarjeta}"></td>
             				  		<s:if test="%#request.mensajeerror2!=null">
									  	<div class="mensajeerror separadoverticalsuperior">
									  	<s:property value="#request.mensajeerror1"/></div>
								    </s:if>
	                				<td><s:property value="#maquinaria.strNumTarjeta"/></td>
									<td><s:property value="#maquinaria.strDescMaq" /></td>
									<td><s:property value="#maquinaria.strDesEstMaquinaria" /></td>
	                			</tr>
	                			</s:iterator>
	                			 <s:if test="%#request.mensajeerror1!=null">
								  	<div class="mensajeerror separadoverticalsuperior">
								  	<s:property value="#request.mensajeerror1"/></div>
							    </s:if>
     
	                		</tr>
	                	</table>
					<br>
                  	</td>
                </tr>
                <tr>
	                <td><s:text name="pages.gestionarincidentes.regincidentes.lblNaturalezaAveria" /></td>
	                <td colspan="3" style="width:433px">
	                <s:select name="cboNatAveria" 
			               	 list="#session.averia"
			                listKey="intCodItemTabla"
			                listValue="strDescTabla" />
					</td>
	            </tr>
                <tr >
                  <td><s:text name="pages.gestionarincidentes.regincidentes.lblDescripcion" /></td>
                  <td style="width: 439px">
                  <s:textarea name="Descripcion" id="txtDescripcion" onkeyup="return ismaxlengthTxtDescripcion()"></s:textarea>
                </tr>
              </table>
            </fieldset>
          </div>
          <div align="right">
          	
          		<s:url var="imgAgregarUrl" value="images/bot_mas.gif"/>
          		<s:a href="javascript:enviarSubmitAgregarALista()">
          		<img src="${imgAgregarUrl}" />
          		</s:a>
          	
           </div>
          <table cellspacing="0" cellpadding="5" class="gridview" width="100%">
            <tr>
			  <!-- <th width="10%" align="center"><s:text name="pages.gestionarincidentes.regincidentes.columna1.cabecera" /></th> -->
			  <th width="10%" align="center"><s:text name="pages.gestionarincidentes.regincidentes.columna1.cabecera" /></th>	
              <th width="11%" align="center"><s:text name="pages.gestionarincidentes.regincidentes.columna2.cabecera" />  </th>
              <th width="30%" align="center"><s:text name="pages.gestionarincidentes.regincidentes.columna3.cabecera" /></th>
              <th width="30%" align="center"><s:text name="pages.gestionarincidentes.regincidentes.columna4.cabecera" /></th>
            </tr>
			
			<s:iterator var="detalle" value="#session.Detalle">
				<tr>
					<td>
	          		<a href="javascript:enviarSubmitQuitarIndidenteDeLista('${detalle.intNumeroItem}')">
            			<img src="<s:url value="/images/quitar.gif"/>" />
            		</a>
					</td>
       				<td><s:property value="#detalle.strNumeroTarjetaEquipo"/></td>
					<td><s:property value="#detalle.intNaturalezaAveria" /></td>
					<td><s:property value="#detalle.strDescripcionNaturalezaAveria" /></td>
	            </tr>    			
	        </s:iterator>
 
          </table>
          <br>
          <div align="right">
				<s:url action="a_homepage" var="homepageUrl"/>
				<s:url value="images/salir.png" var="ImagenSalirUrl"/>
				<s:url action="a_registrarIncidente" var="registrarUrl"/>
				<s:url value="images/guardar.png" var="ImagenRegistrarUrl"/>

				   	<a href="${registrarUrl}">
			    		<img alt="Registrar" src="${ImagenRegistrarUrl}">
			    	</a>
			    	<a href="${homepageUrl}">
			    		<img alt="Salir" src="${ImagenSalirUrl}">
			    	</a>
          </div>
       
			<s:if test="%{#request.mensajeerror1!=null}">
		  		<div class="mensajeerror separadoverticalsuperior"><s:property value="#request.mensajeerror1"/></div>
       		</s:if>

    
	</s:form>

</body>
</html>