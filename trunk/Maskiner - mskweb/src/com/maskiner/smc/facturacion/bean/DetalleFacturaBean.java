package com.maskiner.smc.facturacion.bean;

public class DetalleFacturaBean {
	private String strNumSerie;
	private String strNumFactura;
	private String strDescripcion;
	private int    intCodServicio;
	private double dblMonto;
	
	
	
	public String getStrDescripcion() {
		return strDescripcion;
	}
	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}
	
	
	
	
	public String getStrNumSerie() {
		return strNumSerie;
	}
	public void setStrNumSerie(String strNumSerie) {
		this.strNumSerie = strNumSerie;
	}
	public String getStrNumFactura() {
		return strNumFactura;
	}
	public void setStrNumFactura(String strNumFactura) {
		this.strNumFactura = strNumFactura;
	}
	public int getIntCodServicio() {
		return intCodServicio;
	}
	public void setIntCodServicio(int intCodServicio) {
		this.intCodServicio = intCodServicio;
	}
	public double getDblMonto() {
		return dblMonto;
	}
	public void setDblMonto(double dblMonto) {
		this.dblMonto = dblMonto;
	}
	
	
	

}
