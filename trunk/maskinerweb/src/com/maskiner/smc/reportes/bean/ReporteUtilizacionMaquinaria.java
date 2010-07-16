package com.maskiner.smc.reportes.bean;

import java.math.BigDecimal;
import java.util.Date;

public class ReporteUtilizacionMaquinaria {
	private String codCliente;
	private String razonSocialCliente;
	private String numTarjeta;
	private String descripcionMaquinaria;
	private Integer medicionHorometro;
	private Date fechaUltimaMedicionHorometro;
	private BigDecimal porcentaje;
	
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
	public String getNumTarjeta() {
		return numTarjeta;
	}
	public void setNumTarjeta(String numTarjeta) {
		this.numTarjeta = numTarjeta;
	}
	public String getDescripcionMaquinaria() {
		return descripcionMaquinaria;
	}
	public void setDescripcionMaquinaria(String descripcionMaquinaria) {
		this.descripcionMaquinaria = descripcionMaquinaria;
	}
	public Integer getMedicionHorometro() {
		return medicionHorometro;
	}
	public void setMedicionHorometro(Integer medicionHorometro) {
		this.medicionHorometro = medicionHorometro;
	}
	public Date getFechaUltimaMedicionHorometro() {
		return fechaUltimaMedicionHorometro;
	}
	public void setFechaUltimaMedicionHorometro(Date fechaUltimaMedicionHorometro) {
		this.fechaUltimaMedicionHorometro = fechaUltimaMedicionHorometro;
	}
	public BigDecimal getPorcentaje() {
		return porcentaje;
	}
	public void setPorcentaje(BigDecimal porcentaje) {
		this.porcentaje = porcentaje;
	}

}
