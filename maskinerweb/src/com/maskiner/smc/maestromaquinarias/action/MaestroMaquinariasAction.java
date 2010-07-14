package com.maskiner.smc.maestromaquinarias.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasI;
import com.opensymphony.xwork2.ActionSupport;

public class MaestroMaquinariasAction extends ActionSupport implements SessionAware, RequestAware, ParameterAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 430803354962918354L;
	
	private Map<String, Object> session;
	private Map<String, Object> request;
	private Map<String, String[]> parameters;
	
	private String razSocCliente;
	private String marca;
	private String modelo;
	private String formOrigen;
	private String numTarjeta;
	private String fechaInicio;
	private String fechaFin;
	
	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}

	public String getNumTarjeta() {
		return numTarjeta;
	}

	public void setNumTarjeta(String numTarjeta) {
		this.numTarjeta = numTarjeta;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public String getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getRazSocCliente() {
		return razSocCliente;
	}

	public void setRazSocCliente(String razSocCliente) {
		this.razSocCliente = razSocCliente;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String cargar() throws Exception {

/*		
		String codSucursal = request.getParameter("cboSucursal");
		String codCliente = request.getParameter("codCliente");
		

		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		ArrayList<MaquinariaSucursalBean> arr =  servicio.buscarMaquinariaXSucursal(codCliente, codSucursal);
		
		
			request.setAttribute("maquinarias", arr);
			return mapping.findForward("exito");*/
		return null;
		
	}
	
	public String buscarMaquinarias() throws Exception{
		
		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		List<MaquinariaSucursalBean> maquinarias = servicio.buscarMaquinarias(razSocCliente, marca, modelo);
		
		request.put("arrMaquinarias", maquinarias);
		
		return "exito";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters=parameters;
	}
}
