package com.maskiner.smc.reportes.bean;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="vw_rptgastosxmaquinaria")
public class ReporteGastosXMaquinariaBean {
	@Column(name="raz_soc_cli")
	private String razonSocialCliente;
	
	@Column(name="num_inc")
	private String numIncidente;
	
	@Column(name="fec_inc")
	@Temporal(TemporalType.DATE)
	private Date   fechaIncidente;
	
	@Id
	@Column(name="num_tar")
	private String numTarjeta;
	
	@Column(name="desc_maq")
	private String descripcionMaquinaria;
	
	@Column(name="tipo_prod")
	private String tipoProducto;
	
	@Column(name="fec_inf_liq")
	@Temporal(TemporalType.DATE)
	private Date fechaInformeLiquidacion;
	
	@Column(name="cod_mat")
	private String codigoMaterial;
	
	@Column(name="desc_mat")
	private String descripcionMaterial;
	
	private String cantidad;
	
	@Column(name="pre_uni")
	private BigDecimal precioUnitario;
	
	@Column(name="mon_tot")
	private BigDecimal montoTotal;
	
	@Transient
	private Date fechaInicio;
	
	@Transient
	private Date fechaFin;
	
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	public String getRazonSocialCliente() {
		return razonSocialCliente;
	}
	public void setRazonSocialCliente(String razonSocialCliente) {
		this.razonSocialCliente = razonSocialCliente;
	}
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
	public String getTipoProducto() {
		return tipoProducto;
	}
	public void setTipoProducto(String tipoProducto) {
		this.tipoProducto = tipoProducto;
	}
	public Date getFechaInformeLiquidacion() {
		return fechaInformeLiquidacion;
	}
	public void setFechaInformeLiquidacion(Date fechaInformeLiquidacion) {
		this.fechaInformeLiquidacion = fechaInformeLiquidacion;
	}
	public String getCodigoMaterial() {
		return codigoMaterial;
	}
	public void setCodigoMaterial(String codigoMaterial) {
		this.codigoMaterial = codigoMaterial;
	}
	public String getDescripcionMaterial() {
		return descripcionMaterial;
	}
	public void setDescripcionMaterial(String descripcionMaterial) {
		this.descripcionMaterial = descripcionMaterial;
	}
	public String getCantidad() {
		return cantidad;
	}
	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	public BigDecimal getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(BigDecimal precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public BigDecimal getMontoTotal() {
		return montoTotal;
	}
	public void setMontoTotal(BigDecimal montoTotal) {
		this.montoTotal = montoTotal;
	}
	

	
	
}
