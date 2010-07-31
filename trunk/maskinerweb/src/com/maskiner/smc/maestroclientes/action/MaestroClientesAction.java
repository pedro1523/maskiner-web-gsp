package com.maskiner.smc.maestroclientes.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.gestionarincidentes.service.IncidenteBusinessDelegate;
import com.maskiner.smc.gestionarincidentes.service.IncidenteServiceI;
import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestroclientes.bean.SucursalBean;
import com.maskiner.smc.maestroclientes.service.MaestroClientesBusinessDelegate;
import com.maskiner.smc.maestroclientes.service.MaestroClientesI;

public class MaestroClientesAction implements RequestAware, SessionAware {
	
	// variables privadas
	private String formOrigen;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private String codCliente;
	private String anio;
	private String razSocCliente;
	
	public String getRazSocCliente() {
		return razSocCliente;
	}

	public void setRazSocCliente(String razSocCliente) {
		this.razSocCliente = razSocCliente;
	}

	public String getAnio() {
		return anio;
	}

	public void setAnio(String annio) {
		this.anio = annio;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}

	public String cargar()throws Exception {
		MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();
		
		ArrayList<ClienteBean> arrClientes =  servicio.buscarPorCliente("");
		request.put("arr_clientes", arrClientes);
			
		return "exito";
	}
	
	public String buscar()throws Exception {

		MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();
		
		ArrayList<ClienteBean> arrClientes =  servicio.buscarPorCliente(razSocCliente);
		request.put("arr_clientes", arrClientes);
			
		return "exito";
	}
	
	
	
	public String devolver()throws Exception {

		MaestroClientesI servicio = MaestroClientesBusinessDelegate.getMaestroClientesService();
		
		ClienteBean cliente = servicio.obtenerClientePK(codCliente);
		
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
	
	public String buscarClienteIrPaginaOrigen() throws Exception{
		if(formOrigen.equals("repFrecInc")){
			return "exito1";
		}else{
			//******formOrigen=="registroIncidentesNuevo"*********//
			session.put("Detalle", null);
			IncidenteServiceI servicio2 = IncidenteBusinessDelegate.getIncidenteService();
			
			ClienteBean cliente = new ClienteBean();
			ArrayList<SucursalBean> arrSucursalBean = new ArrayList<SucursalBean>();
			cliente.setArrSucursalBean(arrSucursalBean);
			
			session.put("cliente", cliente);
			session.put("arrSucursalBean", arrSucursalBean);
			//ultima prueba del día
			ArrayList<TablaDeTablasBean> arr2;
			arr2 = servicio2.listarTipoDeAverias();
			session.put("averia", arr2);
				
			//limpia las variables
			/*session.remove("CodigoCliente");
			session.remove("codSucursal");
			session.remove("Detalle");
			session.remove("id");
			session.remove("maquinarias");
			session.remove("id");
			session.remove("cliente");*/
			
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

}
