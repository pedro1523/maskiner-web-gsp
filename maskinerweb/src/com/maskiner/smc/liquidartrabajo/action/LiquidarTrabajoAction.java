package com.maskiner.smc.liquidartrabajo.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.liquidartrabajo.bean.LiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.TecnicosXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.service.LiquidacionServiceI;
import com.maskiner.smc.liquidartrabajo.service.LiquidarTrabajoBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.opensymphony.xwork2.ActionSupport;


public class LiquidarTrabajoAction extends ActionSupport implements RequestAware, SessionAware, ParameterAware{
	
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

	public String registrarInformeLiquidacion()throws Exception {
		
		String[] arrStrHorasIni = parameters.get("horaInicio");
		String[] arrStrHorasFin = parameters.get("horaFin");
		
		ArrayList<TecnicosXLiquidacionBean> tecnicos = (ArrayList<TecnicosXLiquidacionBean>)session.get("tecnicos");		
		for(int i=0;i<arrStrHorasIni.length ;i++){
			 TecnicosXLiquidacionBean tec = tecnicos.get(i);
			 tec.setStrHoraInicio(arrStrHorasIni[i]);
			 tec.setStrHoraFin(arrStrHorasFin[i]);
		}

		LiquidacionServiceI servicio = LiquidarTrabajoBusinessDelegate.getLiquidacionService();
		UsuarioBean usuario = (UsuarioBean) session.get("usuariologueado");
		RegistroIncidentesBean inc = (RegistroIncidentesBean) session.get("incidente");
			
		LiquidacionBean liq = new LiquidacionBean();
		liq.setStrNumOrdTrabajo((String)session.get("strNumeroOT"));
		liq.setStrCodRegistrador(usuario.getCodigoUsuario());
		liq.setStrDesAtenRealizada(parameters.get("descripcionAtencionRealizada")[0].toString());
		liq.setStrAporConocimiento(parameters.get("aporteConocimiento")[0].toString());
		
		session.put("strDesAtencion", parameters.get("descripcionAtencionRealizada")[0].toString());
		session.put("strAporteConocimiento", parameters.get("aporteConocimiento")[0].toString());
		
		liq.setStrNumIncidente(inc.getStrNumeroIncidente().toString());
		liq.setIntEstLiquidacion(1);
		
		try{
			liq.setIntValHorometro(Integer.parseInt(parameters.get("valorHorometro")[0]));
			MaquinariaSucursalBean maq = (MaquinariaSucursalBean)session.get("b_maquinaria");
			maq.setStrMedHorometro(String.valueOf(liq.getIntValHorometro()));
			session.put("b_maquinaria", maq);				
		}catch (Exception e) {
			request.put("mensajeerror1",getText("pages.liquidartrabajo.registrarILPaso2.mensajeError3") );
			return "fracaso";
		}
	
		ArrayList<MaterialesXLiquidacionBean> mat = (ArrayList<MaterialesXLiquidacionBean>)session.get("Materiales");

			for(int i=0;i<arrStrHorasIni.length ;i++){
				 TecnicosXLiquidacionBean tec = tecnicos.get(i);

				  tec.setTmHoraInicio(FormatoFecha.getHoraDe(arrStrHorasIni[i]));
				  tec.setTmHoraFin(FormatoFecha.getHoraDe(arrStrHorasFin[i]));
					
				 if(FormatoFecha.getHoraDe(arrStrHorasFin[i])==null || FormatoFecha.getHoraDe(arrStrHorasIni[i])==null){
					request.put("mensajeerror1",getText("pages.liquidartrabajo.registrarILPaso2.mensajeError5"));
					return "fracaso";
				 }

				 long mlls1 = FormatoFecha.getHoraDe(arrStrHorasIni[i]).getTime();
				 long mlls2 = FormatoFecha.getHoraDe(arrStrHorasFin[i]).getTime();
				  
				 if(mlls2<=mlls1){
					request.put("mensajeerror1",getText("pages.liquidartrabajo.registrarILPaso2.mensajeError7"));
					return "fracaso";
				 }
				 
				 tec.setStrCodOrdenTrabajo((String)session.get("strNumeroOT"));
				 tecnicos.set(i, tec);
			}
			
			if(parameters.get("descripcionAtencionRealizada")[0].toString().equals("")){
				request.put("mensajeerror1",getText("pages.liquidartrabajo.registrarILPaso2.mensajeError6") );
				return "fracaso";
			}
			session.put("idLiq", servicio.RegistrarLiquidacionYDetalle(liq, mat,tecnicos));
			
			return "exito";

	}
	
	public String cargarRegistrarInformeLiquidacionPaso1()throws Exception {
		session.remove("incidente");
		
		return "exito";
	}
	public String cargarRegistrarInformeLiquidacionPaso2()throws Exception {
		String strCodOrdenTrabajo = parameters.get("numOT")[0].toString();
		
		LiquidacionServiceI servicio = LiquidarTrabajoBusinessDelegate.getLiquidacionService();
		
		MaquinariaSucursalBean maq = servicio.obtenerMaquinariaXOT(strCodOrdenTrabajo);
		ArrayList<TecnicosXLiquidacionBean> tecnicos = servicio.obtenerTecnicosXOT(strCodOrdenTrabajo);
		
		session.put("tecnicos", tecnicos);
		session.put("b_maquinaria", maq);
		session.put("strNumeroOT", strCodOrdenTrabajo);
		
		session.remove("strDesAtencion");
		session.remove("strAporteConocimiento");
		session.remove("b_material");
		session.remove("Materiales");
		return "exito";
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
