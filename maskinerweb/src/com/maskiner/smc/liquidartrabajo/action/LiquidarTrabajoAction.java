package com.maskiner.smc.liquidartrabajo.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.liquidartrabajo.bean.LiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.TecnicosXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.service.LiquidacionServiceI;
import com.maskiner.smc.liquidartrabajo.service.LiquidarTrabajoBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.seguridad.bean.UsuarioBean;

public class LiquidarTrabajoAction extends MappingDispatchAction {
	
	public ActionForward registrarInformeLiquidacion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession sesion = request.getSession();
		
		LiquidacionServiceI servicio = LiquidarTrabajoBusinessDelegate.getLiquidacionService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute("usuariologueado");
		RegistroIncidentesBean inc = (RegistroIncidentesBean) request.getSession().getAttribute("incidente");
		
		
		LiquidacionBean liq = new LiquidacionBean();
		liq.setStrNumOrdTrabajo((String)sesion.getAttribute("strNumeroOT"));
		liq.setStrCodRegistrador(usuario.getCodigoUsuario());
		liq.setStrDesAtenRealizada(request.getParameter("descripcionAtencionRealizada"));
		liq.setStrAporConocimiento(request.getParameter("aporteConocimiento"));
		liq.setStrNumIncidente(inc.getStrNumeroIncidente().toString());
		liq.setIntEstLiquidacion(1);
		try{
		liq.setIntValHorometro(Integer.parseInt(request.getParameter("valorHorometro")));
		}catch (Exception e) {
			request.setAttribute("mensajeerror1", "Debe ingresar un valor en Horómetro Válido");
			return mapping.findForward("fracaso");
		}
		
		ArrayList<MaterialesXLiquidacionBean> mat = (ArrayList<MaterialesXLiquidacionBean>)sesion.getAttribute("Materiales");
		if(mat==null){
			request.setAttribute("mensajeerror1", "Debe ingresar al menos un material para registrar el Informe");
			return mapping.findForward("fracaso");
		}else{
		
		
			String[] HorasIni = request.getParameterValues("horaInicio");
			String[] HorasFin = request.getParameterValues("horaFin");
			
			ArrayList<TecnicosXLiquidacionBean> tecnicos = (ArrayList<TecnicosXLiquidacionBean>)sesion.getAttribute("tecnicos");
			
			for(int i=0;i<HorasIni.length ;i++){
				 TecnicosXLiquidacionBean tec = tecnicos.get(i);
				 tec.setTmHoraInicio(FormatoFecha.getHoraDe(HorasIni[i]));
				 tec.setTmHoraFin(FormatoFecha.getHoraDe(HorasFin[i]));
				 if(FormatoFecha.getHoraDe(HorasFin[i])==null || FormatoFecha.getHoraDe(HorasIni[i])==null){
						request.setAttribute("mensajeerror1", "Debe agregar las horas de todos los técnicos");
						return mapping.findForward("fracaso");
				 }
				 tec.setStrCodOrdenTrabajo((String)sesion.getAttribute("strNumeroOT"));
				 tecnicos.set(i, tec);
			}
			
			sesion.setAttribute("idLiq", servicio.RegistrarLiquidacionYDetalle(liq, mat,tecnicos));
			
			return mapping.findForward("exito");
		}
	}
	
	
	public ActionForward cargarRegistrarInformeLiquidacionPaso2(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession sesion = request.getSession();
		String strCodOrdenTrabajo =request.getParameter("numOT");
				
		//obtenemos el bean MaquinariaXSucursal
		LiquidacionServiceI servicio = LiquidarTrabajoBusinessDelegate.getLiquidacionService();
		
		MaquinariaSucursalBean maq = servicio.obtenerMaquinariaXOT(strCodOrdenTrabajo);
		ArrayList<TecnicosXLiquidacionBean> tecnicos = servicio.obtenerTecnicosXOT(strCodOrdenTrabajo);
		
		
		sesion.setAttribute("tecnicos", tecnicos);
		sesion.setAttribute("b_maquinaria", maq);
		sesion.setAttribute("strNumeroOT", strCodOrdenTrabajo);
		
		return mapping.findForward("exito");
	}

}
