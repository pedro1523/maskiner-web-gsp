package com.maskiner.smc.maestromaquinarias.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;

import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasI;
import com.opensymphony.xwork2.ActionSupport;

public class MaestroMaquinariasAction extends ActionSupport implements RequestAware, ParameterAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 430803354962918354L;
	
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

	public String cargarBuscarMaquinaria() throws Exception {
		
		//cargar todos los datos al iniciar el caso de uso
		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		List<MaquinariaSucursalBean> maquinarias = servicio.buscarMaquinarias("", "", "");
		
		request.put("arrMaquinarias", maquinarias);

		formOrigen = parameters.get("formOrigen")[0];
		
		if(formOrigen.equals("d_repGastMaq")){
			numTarjeta = parameters.get("numTarjeta")[0];
			fechaInicio= parameters.get("fechaInicio")[0];
			fechaFin   = parameters.get("fechaFin")[0];
			
		}else{
			//otras acciones para otros formularios de origen
		}
		return SUCCESS;
		
	}
	
	public String irPaginaOrigen() throws Exception {
		formOrigen = parameters.get("formOrigen")[0];
		
		if(formOrigen.equals("d_repGastMaq")){
			numTarjeta = parameters.get("numTarjeta")[0];
			fechaInicio= parameters.get("fechaInicio")[0];
			fechaFin   = parameters.get("fechaFin")[0];
			
		}else{
			//otras acciones para otros formularios de origen
		}
		return SUCCESS;
	}
	
	
	public String devolverMaquinaria() throws Exception {
		formOrigen = parameters.get("formOrigen")[0];
		
		if(formOrigen.equals("d_repGastMaq")){
			numTarjeta = parameters.get("numTarjeta")[0];
			fechaInicio= parameters.get("fechaInicio")[0];
			fechaFin   = parameters.get("fechaFin")[0];
			
		}else{
			//otras acciones para otros formularios de origen
		}
		return SUCCESS;
	}
	
	
	
	public String buscarMaquinarias() throws Exception{
		
		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate.getMaestroMaquinariasService();
		
		List<MaquinariaSucursalBean> maquinarias = servicio.buscarMaquinarias(razSocCliente, marca, modelo);
		
		request.put("arrMaquinarias", maquinarias);
		
		return "exito";
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
