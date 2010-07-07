package com.maskiner.smc.reportes.bean;


public class ReporteFrecuenciaIncidentesBean {
	
	private static final long serialVersionUID = -2967003664281209474L;
	private String codCliente;
	private String razonSocialCliente;
	private String annio;
	private String numeroTarjeta;
	private String descripMaquinaria;
	private Long cantidadHidraulicos;
	private Long cantidadMecanicos;
	private Long cantidadElectricos;
	private Long cantidadNeumaticos;
	private Long cantidadOtros;
	private Long cantidadTotal;

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getRazonSocialCliente() {
		return razonSocialCliente;
	}

	public void setRazonSocialCliente(String razonSocialCliente) {
		this.razonSocialCliente = razonSocialCliente;
	}

	public String getAnnio() {
		return annio;
	}

	public void setAnnio(String annio) {
		this.annio = annio;
	}

	public String getNumeroTarjeta() {
		return numeroTarjeta;
	}

	public void setNumeroTarjeta(String numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}

	public String getDescripMaquinaria() {
		return descripMaquinaria;
	}

	public void setDescripMaquinaria(String descripMaquinaria) {
		this.descripMaquinaria = descripMaquinaria;
	}

	public Long getCantidadHidraulicos() {
		return cantidadHidraulicos;
	}

	public void setCantidadHidraulicos(Long cantidadHidraulicos) {
		this.cantidadHidraulicos = cantidadHidraulicos;
	}

	public Long getCantidadMecanicos() {
		return cantidadMecanicos;
	}

	public void setCantidadMecanicos(Long cantidadMecanicos) {
		this.cantidadMecanicos = cantidadMecanicos;
	}

	public Long getCantidadElectricos() {
		return cantidadElectricos;
	}

	public void setCantidadElectricos(Long cantidadElectricos) {
		this.cantidadElectricos = cantidadElectricos;
	}

	public Long getCantidadNeumaticos() {
		return cantidadNeumaticos;
	}

	public void setCantidadNeumaticos(Long cantidadNeumaticos) {
		this.cantidadNeumaticos = cantidadNeumaticos;
	}

	public Long getCantidadOtros() {
		return cantidadOtros;
	}

	public void setCantidadOtros(Long cantidadOtros) {
		this.cantidadOtros = cantidadOtros;
	}

	public Long getCantidadTotal() {
		return cantidadTotal;
	}

	public void setCantidadTotal(Long cantidadTotal) {
		this.cantidadTotal = cantidadTotal;
	}

	
}
