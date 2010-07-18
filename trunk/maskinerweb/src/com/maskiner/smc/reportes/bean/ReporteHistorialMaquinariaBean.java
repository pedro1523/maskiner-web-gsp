package com.maskiner.smc.reportes.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="vw_rpthistorialmaquinaria")
public class ReporteHistorialMaquinariaBean {

	@Column(name="num_inc")
	private String numIncidente;
	
	@Column(name="fec_inc")
	@Temporal(TemporalType.DATE)
	private Date   fechaIncidente;
	
	@Column(name="cod_cli")
	private String codCliente;
	
	@Column(name="raz_soc_cli")
	private String razonSocialCliente;
	
	@Id
	@Column(name="num_tar")
	private String numTarjeta;
	
	@Column(name="desc_maq")
	private String descripMaquinaria;
	
	@Column(name="fec_ord_trab")
	@Temporal(TemporalType.DATE)
	private Date   fechaOrdenTrabajo;
	
	@Column(name="desc_natur_aver")
	private String descripNaturalezaAveria;
	
	@Column(name="desc_aver")
	private String descripAveria;
	
	public String getNumIncidente() {
		return numIncidente;
	}
	public void setNumIncidente(String numIncidente) {
		this.numIncidente = numIncidente;
	}
	public Date getFechaIncidente() {
		return fechaIncidente;
	}
	public void setFechaIncidente(Date fechaIncidente) {
		this.fechaIncidente = fechaIncidente;
	}
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
	public String getDescripMaquinaria() {
		return descripMaquinaria;
	}
	public void setDescripMaquinaria(String descripMaquinaria) {
		this.descripMaquinaria = descripMaquinaria;
	}
	public Date getFechaOrdenTrabajo() {
		return fechaOrdenTrabajo;
	}
	public void setFechaOrdenTrabajo(Date fechaOrdenTrabajo) {
		this.fechaOrdenTrabajo = fechaOrdenTrabajo;
	}
	public String getDescripNaturalezaAveria() {
		return descripNaturalezaAveria;
	}
	public void setDescripNaturalezaAveria(String descripNaturalezaAveria) {
		this.descripNaturalezaAveria = descripNaturalezaAveria;
	}
	public String getDescripAveria() {
		return descripAveria;
	}
	public void setDescripAveria(String descripAveria) {
		this.descripAveria = descripAveria;
	}
	
	
	
	
}
