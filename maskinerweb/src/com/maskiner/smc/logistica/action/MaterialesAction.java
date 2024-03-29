package com.maskiner.smc.logistica.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.TecnicosXLiquidacionBean;
import com.maskiner.smc.logistica.bean.MaterialBean;
import com.maskiner.smc.logistica.bean.TipoMaterialBean;
import com.maskiner.smc.logistica.service.LogisticaBusinessDelegate;
import com.maskiner.smc.logistica.service.MaterialServiceI;
import com.opensymphony.xwork2.ActionSupport;

public class MaterialesAction extends ActionSupport implements RequestAware, SessionAware, ParameterAware {
	
	private String formOrigen;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
		
	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}
	
	public String cargarBuscarMateriales()throws Exception {
		request.remove("b_tiposMateriales");
		request.remove("b_materiales");
		
		MaterialServiceI servicio = LogisticaBusinessDelegate.getMaterialService();
		
		List<TipoMaterialBean> tiposMateriales = servicio.obtenerTiposMateriales();
		List<MaterialBean> materiales = servicio.buscarMateriales(0, "");
		
		session.put("b_tiposMateriales", tiposMateriales);
		request.put("b_materiales", materiales);

		return "exito";
	}
	

	public String buscarMateriales()throws Exception {
		
		int intCodTipMaterial = Integer.parseInt(parameters.get("tipoMaterial")[0].trim());
		String strDescripcion = parameters.get("descripMaterial")[0].trim();
		
		MaterialServiceI servicio = LogisticaBusinessDelegate.getMaterialService();
		List<MaterialBean> materiales = servicio.buscarMateriales(intCodTipMaterial, strDescripcion);
		
		request.put("b_materiales", materiales);

		return "exito";
	}
	

	public String buscarMaterialesDevolverMaterial()throws Exception {
		String strCodMaterial = parameters.get("CodMaterial")[0].trim();
		
		MaterialServiceI servicio = LogisticaBusinessDelegate.getMaterialService();
		MaterialBean material = servicio.obtenerMaterial(strCodMaterial);
		
		session.put("b_material", material);

		return "exito";
	}
	
	
	public String buscarMaterialesSalir() throws Exception {
		
		/*
		request.getSession().setAttribute("b_tiposMateriales", null);
		request.getSession().setAttribute("b_materiales", null);
		
		return mapping.findForward("exito");*/
		return "exito";
	}
	public String QuitarDeLista()throws Exception {
		int intPosMaterial = Integer.parseInt(parameters.get("posMaterial")[0].trim());
		ArrayList<MaterialesXLiquidacionBean> Materiales = new ArrayList<MaterialesXLiquidacionBean>();
		Materiales = (ArrayList<MaterialesXLiquidacionBean>)session.get("Materiales");
		Materiales.remove(intPosMaterial-1);
		
		session.put("Materiales", Materiales);
		return "exito";
	}
	
	public String AgregarALista() throws Exception {
		
		String[] arrStrHorasIni = parameters.get("horaInicio");
		String[] arrStrHorasFin = parameters.get("horaFin");
		
		ArrayList<TecnicosXLiquidacionBean> tecnicos = (ArrayList<TecnicosXLiquidacionBean>)session.get("tecnicos");		
		for(int i=0;i<arrStrHorasIni.length ;i++){
			 TecnicosXLiquidacionBean tec = tecnicos.get(i);
			 tec.setStrHoraInicio(arrStrHorasIni[i]);
			 tec.setStrHoraFin(arrStrHorasFin[i]);
		}
		session.put("strDesAtencion", parameters.get("descripcionAtencionRealizada")[0].toString());
		session.put("strAporteConocimiento", parameters.get("aporteConocimiento")[0].toString());
		
		ArrayList<MaterialesXLiquidacionBean> Materiales = new ArrayList<MaterialesXLiquidacionBean>();
		
		if (session.get("Materiales")==null){
			Materiales = (ArrayList<MaterialesXLiquidacionBean>)session.get("materialesIni");
		}else {
			Materiales = (ArrayList<MaterialesXLiquidacionBean>)session.get("Materiales");
		}
		
		if(session.get("b_material")==null){
			request.put("mensajeerror", getText("pages.liquidartrabajo.registrarILPaso2.mensajeError1"));
			return "exito";
		}else{
			try{
				Integer.parseInt(parameters.get("cantidadMaterial")[0].trim());
			}
			
			catch (Exception e) {
				request.put("mensajeerror",getText("pages.liquidartrabajo.registrarILPaso2.mensajeError2"));
				return "exito";
			}
			
			Integer i = Integer.parseInt(String.valueOf(parameters.get("cantidadMaterial")[0].trim()));
			
			MaterialesXLiquidacionBean material = new MaterialesXLiquidacionBean();
			MaterialBean bean = (MaterialBean)session.get("b_material");
			material.setStrCodMaterial(bean.getStrCodMaterial());
			material.setStrDescripTipoMaterial(bean.getStrDescTipoMaterial());
			material.setStrDescripMaterial(bean.getStrDescripMaterial());
			material.setIntCantidad(Integer.parseInt(parameters.get("cantidadMaterial")[0].trim()));
			material.setDecPrecioUnitario(bean.getBdPrecioUnitario());
			material.setDecMontoTotal(bean.getBdPrecioUnitario().multiply(new BigDecimal(i)));
			material.setIntItem(Materiales.size()+1);
			
			
			Materiales.add(material);
	
			session.put("Materiales", Materiales);
			return "exito";
		}
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}
	
}
