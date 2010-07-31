/*package com.maskiner.smc.logistica.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.logistica.service.LogisticaBusinessDelegate;
import com.maskiner.smc.logistica.service.TablaDeTablasServiceI;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestroclientes.service.MaestroClientesBusinessDelegate;
import com.maskiner.smc.maestroclientes.service.MaestroClientesI;

public class TablaDeTablasAction {

	public ActionForward cargar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession sesion = request.getSession();

		TablaDeTablasServiceI servicio = LogisticaBusinessDelegate.getTablaDeTablasService();
		
		ArrayList<TablaDeTablasBean> arr =  servicio.listarNaturalezaAverias();	
		
	//	if (arr!=null){
			request.setAttribute("averias", arr);
			return mapping.findForward("exito");
		//}else{
		//	return mapping.findForward("fracaso");
	//	}
		
	}
	
}
*/