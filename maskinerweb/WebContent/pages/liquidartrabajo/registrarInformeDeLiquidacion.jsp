<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean"%>
<%
	ArrayList<MaterialesXLiquidacionBean> MaterialesIni = new ArrayList<MaterialesXLiquidacionBean>();
	session.setAttribute("materialesIni",MaterialesIni);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	function buscarMaterialInterno(){
		document.forms["frmRegistrarLiquidacion"].action="<%=request.getContextPath()%>/a_cargarBuscarMateriales.do";
		document.forms["frmRegistrarLiquidacion"].submit();
	}
	function agregarMaterial(){
		document.forms["frmRegistrarLiquidacion"].action="<%=request.getContextPath()%>/a_agregarMaterialAlista.do";
		document.forms["frmRegistrarLiquidacion"].submit();
	}
	
	function quitarMaterial(posMaterial){
		document.forms["frmRegistrarLiquidacion"].action="<%=request.getContextPath()%>/a_quitarMaterialDeLista.do?posMaterial="+posMaterial;
		document.forms["frmRegistrarLiquidacion"].submit();
	}
</script>

</head>
<body>
<h2 class="titulo"><s:text name="pages.liquidartrabajo.registrarILPaso2.titulo" /></h2>
<s:form  id="frmRegistrarLiquidacion" action="a_registrarInformeLiquidacion" method="post">
	<div class="separadovertical">
		<s:text name="pages.liquidartrabajo.registrarILPaso2.lblNumOrdenTrabajo" />
		<span class="negrita margenderecho">${strNumeroOT}</span>
	</div>
	<fieldset><legend><s:text name="pages.liquidartrabajo.registrarIL.fieldsetDatosMaquinaria" /></legend>
	<table class="separadovertical">
		<tbody>
			<tr>
				<td style="padding: 5px 5px 5pt 5px;"><s:text name="pages.liquidartrabajo.registrarILPaso2.lblNumTarjeta" />
					<span class="negrita margenderecho">${b_maquinaria.strNumTarjeta}</span>
				</td>
				<td style="padding: 5pt 5px 5pt 5px;"><s:text name="pages.liquidartrabajo.registrarILPaso2.lblModelo" />
					<span class="negrita margenderecho">${b_maquinaria.strModMaquinaria}</span>
				</td>
			</tr>
			<tr>
				<td style="padding: 5px 5px 5pt 5px;">
					<s:text name="pages.liquidartrabajo.registrarILPaso2.lblMarca" />
					<span class="negrita margenderecho">${b_maquinaria.strDescMarMaq}</span>
				</td>
				<td style="padding: 5px 5px 5pt 5px;">
					<s:text name="pages.liquidartrabajo.registrarILPaso2.lblNumSerie" />
					<span class="negrita margenderecho">${b_maquinaria.strNumSerieMaquinaria}</span>
				</td>
			</tr>
		</tbody>
	</table>
	<table>
		<tbody>
			<tr>
				<td style="height: 25px"><s:text name="pages.liquidartrabajo.registrarILPaso2.lblUbicacion" /></td>
				<td style="padding: 0pt 0pt 0pt 5px;">
					<span class="negrita margenderecho">${b_maquinaria.strDirSucursal}</span>
				</td>
			</tr>
			<tr>
				<td><s:text name="pages.liquidartrabajo.registrarILPaso2.lblValorHorometro" /></td>
				<td style="padding: 0pt 0pt 0pt 5px;">
				<s:textfield name="valorHorometro" readonly="false" value="%{#session.b_maquinaria.strMedHorometro}">
				</s:textfield>
				</td>
			</tr>
		</tbody>
	</table>
	</fieldset>
	<br />
	<fieldset style=""><legend><s:text name="pages.liquidartrabajo.registrarIL.fieldsetDatosAtencion" /></legend>
	<table>
		<tbody>
			<tr>
				<td style="padding: 8px; background-color: rgb(238, 238, 238);">
				<table>
					<tbody>
						<tr>
							<td colspan="2"><s:text name="pages.liquidartrabajo.registrarILPaso2.lblMaterialesAdicionales" />
								<input type="radio" checked="checked" name="Material"/> </td>
							<td></td>
						</tr>
						<tr>
							<td><s:text name="pages.liquidartrabajo.registrarILPaso2.lblMaterial" /></td>
							<td><span class="negrita margenderecho">${b_material.strDescTipoMaterial}</span></td>
							<td>
							<s:url var="buscarMaterialUrl" value="javascript:buscarMaterialInterno()"/>
							<s:url var="imgBuscar" value="/images/buscar_azul.gif"/>
						    <s:a href="%{buscarMaterialUrl}">
						    	<img src="${imgBuscar}" style="magin-left:6px"/>
						    </s:a>	
		
							</td>
						</tr>
						<tr>
							<td><s:text name="pages.liquidartrabajo.registrarILPaso2.lblDescripcion" /></td>
							<td><span class="negrita margenderecho">${b_material.strDescripMaterial}</span>
							</td>		
						</tr>
					</tbody>
				</table>
				</td>
				<td></td>
				<td></td>
				<td style="padding: 8px; background-color: rgb(238, 238, 238);">
				<table>
					<tbody>
						<tr>
							<td><s:text name="pages.liquidartrabajo.registrarILPaso2.lblMaterialExterno" /></td>
							<td> <input type="radio" name="Material"/></td>
						</tr>
						<tr>
							<td><s:text name="pages.liquidartrabajo.registrarILPaso2.lblDescripcion" /></td>
							<td><s:textfield name="descripcionMaterialExterno"></s:textfield>
							</td>
						</tr>
						<tr>
							<td><s:text name="pages.liquidartrabajo.registrarILPaso2.lblMontoUnitario" /></td>
							<td><s:textfield name="montoUnitarioMaterialExterno"></s:textfield>
							</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<br />
	<table>
		<tbody>
			<tr>
				<td width="59"><s:text name="pages.liquidartrabajo.registrarILPaso2.lblCantidad" /></td>
				<td width="111">
					<s:textfield name="cantidadMaterial"></s:textfield>
				</td>
				<td width="124">
					<s:url var="agregarMaterialUrl" value="javascript:agregarMaterial()"/>
					<s:url var="imgAgregar" value="/images/agregar.png"/>
		
				    <s:a href="%{agregarMaterialUrl}">
				    	<img src="${imgAgregar}" style="magin-left:6px"/>
				    </s:a>
				</td>
			</tr>
		</tbody>
	</table>
	<s:if test="#request.mensajeerror!=null">
	  	<div class="mensajeerror separadoverticalsuperior"><s:property value="#request.mensajeerror"/></div>
    </s:if>
	<br/>
	<table cellpadding="5" cellspacing="0" class="gridview" width="100%">
		<tbody>
			<tr align="center">
				<th><s:text name="pages.liquidartrabajo.registrarILPaso2.listaMateriales.cabecera.Item" /></th>
				<th><s:text name="pages.liquidartrabajo.registrarILPaso2.listaMateriales.cabecera.Tipo" /></th>
				<th><s:text name="pages.liquidartrabajo.registrarILPaso2.listaMateriales.cabecera.Descripcion" /></th>
				<th><s:text name="pages.liquidartrabajo.registrarILPaso2.listaMateriales.cabecera.Cantidad" /></th>
				<th><s:text name="pages.liquidartrabajo.registrarILPaso2.listaMateriales.cabecera.PrecioUni" /></th>
				<th><s:text name="pages.liquidartrabajo.registrarILPaso2.listaMateriales.cabecera.Total" /></th>
				<th></th>
			</tr>
			
     		<s:iterator var="material" value="#session.Materiales" >
				<tr>
					<td><s:property value="#material.intItem"/></td>					
					<td><s:property value="#material.strDescripTipoMaterial"/></td>
					<td><s:property value="#material.strDescripMaterial"/></td>
					<td><s:property value="#material.intCantidad"/></td>
					<td><s:property value="#material.decPrecioUnitario"/></td>
					<td><s:property value="#material.decMontoTotal"/></td>
					<td>
					<a href="javascript:quitarMaterial('${material.intItem}')">
            			<img src="<s:url value="/images/quitar.gif"/>" />
            		</a>
					</td>     			
     			</tr> 
    		</s:iterator>
		</tbody>
	</table>
	<br />
	<span class="titulotabla"><s:text name="pages.liquidartrabajo.registrarILPaso2.lblIngreseHoras" /></span>
	<table cellpadding="5" cellspacing="0" class="gridview">
		<tr>
			<th align="center"><s:text name="pages.liquidartrabajo.registrarILPaso2.listaTecnicos.cabecera.Nombre" /></th>
			<th align="center"><s:text name="pages.liquidartrabajo.registrarILPaso2.listaTecnicos.cabecera.HoraInicio" /></th>
			<th align="center"><s:text name="pages.liquidartrabajo.registrarILPaso2.listaTecnicos.cabecera.HoraFin" /></th>
		</tr>
		<tr>
			<s:iterator var="tecnico" value="#session.tecnicos" >
   				<tr>
	   				<td><s:property value="#tecnico.strNombreCompleto"/></td>
					<td><s:textfield name="horaInicio"></s:textfield> </td>
					<td><s:textfield name="horaFin"></s:textfield></td>
   				</tr>
			</s:iterator>
     	</tr>
	</table>
	<br />
	<s:text name="pages.liquidartrabajo.registrarILPaso2.lblDescripcionAtencion" />
	<br />
	<s:textarea name="descripcionAtencionRealizada" cssStyle="width: 97%; height: 50px;"></s:textarea> 
	<br />
	<br />
	<s:text name="pages.liquidartrabajo.registrarILPaso2.lblAporteConocimiento" />
	<br />
	<s:textarea name="aporteConocimiento" cssStyle="width: 97%; height: 50px;"></s:textarea>
	</fieldset>
    <s:if test="#request.mensajeerror1!=null">
	  	<div class="mensajeerror separadoverticalsuperior"><s:property value="#request.mensajeerror1"/></div>
    </s:if>
	<div class="separadoverticalsuperior" align="right">
		<s:url var="imgRegistrarUrl" value="/images/registrar.png"/>
				<s:submit type="image" src="%{imgRegistrarUrl}" />
	
		<s:a action="a_homepage">
	    		<img src="images/salir.png" />
	    </s:a>
	</div>
</s:form>

</body>
</html>