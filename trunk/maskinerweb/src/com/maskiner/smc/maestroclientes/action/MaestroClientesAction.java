package com.maskiner.smc.maestroclientes.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestroclientes.service.MaestroClientesBusinessDelegate;
import com.maskiner.smc.maestroclientes.service.MaestroClientesI;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasI;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;


public class MaestroClientesAction extends MappingDispatchAction {

	
	public ActionForward cargar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		
		String RazSocCliente = request.getParameter("RazSocCliente");
		if (RazSocCliente==null){
			RazSocCliente="";
		}
		HttpSession sesion = request.getSession();

		MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();
		
		ArrayList<ClienteBean> arr =  servicio.buscarPorCliente(RazSocCliente);

			request.setAttribute("clientes", arr);
			return mapping.findForward("exito");

		
	}
	
	public ActionForward devolver(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

			HttpSession sesion = request.getSession();
		
			String CodCliente = request.getParameter("CodCliente");
	
			MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();

				ClienteBean cliente = servicio.obtenerClientePK(CodCliente);
	
				sesion.setAttribute("cliente", cliente);
		
				return mapping.findForward("exito");
	}
	
	public ActionForward cargar2(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession sesion = request.getSession();
		
		String codSucursal =  "001";//request.getParameter("Sucursal");;
		String codCliente = request.getParameter("codCliente");		

		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		ArrayList<MaquinariaSucursalBean> arr =  servicio.buscarMaquinariaXSucursal(codCliente, codSucursal);
		
		
			sesion.setAttribute("maquinarias", arr);
			return mapping.findForward("exito");
		
	}
}
