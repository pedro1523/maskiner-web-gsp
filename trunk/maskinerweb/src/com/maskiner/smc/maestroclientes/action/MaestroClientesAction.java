package com.maskiner.smc.maestroclientes.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestroclientes.bean.SucursalBean;
import com.maskiner.smc.maestroclientes.service.MaestroClientesBusinessDelegate;
import com.maskiner.smc.maestroclientes.service.MaestroClientesI;

public class MaestroClientesAction implements RequestAware, SessionAware, ParameterAware {
	
	// variables privadas
	private String formOrigen;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
	
	private ClienteBean cliente;
	
	public ClienteBean getCliente() {
		return cliente;
	}

	public void setCliente(ClienteBean cliente) {
		this.cliente = cliente;
	}

	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}

	public String cargar()throws Exception {
		/*
		String RazSocCliente = request.getParameter("RazSocCliente");
		if (RazSocCliente==null){
			RazSocCliente="";
		}*/

		MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();
		
		ArrayList<ClienteBean> arrClientes =  servicio.buscarPorCliente("");
		request.put("arr_clientes", arrClientes);
			

		return "exito";
	}
	
	public String devolver()throws Exception {

		String CodCliente = parameters.get("CodCliente")[0].trim();
		
		MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();
		
		cliente = servicio.obtenerClientePK(CodCliente);
		
		if (formOrigen.equals("repFrecInc")){
			return "exito1";
		}else{
			//devuelve el control al jsp: registroIncidentes_Nuevo.jsp (definition: d_registrarIncidente_Nuevo)
			ArrayList<SucursalBean> arrSucursalBean = cliente.getArrSucursalBean();
			
			session.put("cliente", cliente);
			session.put("arrSucursalBean", arrSucursalBean);
			
			return "exito";
		}
			
	}
	
	public String cargar2()throws Exception {
/*
		HttpSession sesion = request.getSession();
		
		String codSucursal =  "001";//request.getParameter("Sucursal");;
		String codCliente = request.getParameter("codCliente");		

		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		ArrayList<MaquinariaSucursalBean> arr =  servicio.buscarMaquinariaXSucursal(codCliente, codSucursal);
		
		
			sesion.setAttribute("maquinarias", arr);
			return mapping.findForward("exito");*/
		
		return null;
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
