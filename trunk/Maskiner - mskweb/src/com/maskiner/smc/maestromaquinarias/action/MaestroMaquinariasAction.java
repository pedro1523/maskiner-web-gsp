package com.maskiner.smc.maestromaquinarias.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasI;

public class MaestroMaquinariasAction {

	public ActionForward cargar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		
		String codSucursal = request.getParameter("cboSucursal");
		String codCliente = request.getParameter("codCliente");
		

		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		ArrayList<MaquinariaSucursalBean> arr =  servicio.buscarMaquinariaXSucursal(codCliente, codSucursal);
		
		
			request.setAttribute("maquinarias", arr);
			return mapping.findForward("exito");
		
	}
}
