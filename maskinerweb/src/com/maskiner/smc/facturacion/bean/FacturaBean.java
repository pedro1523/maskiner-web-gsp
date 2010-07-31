package com.maskiner.smc.facturacion.bean;

import java.math.BigDecimal;

public class FacturaBean {
	
	private String strNumSerie;
	private String strNumFactura;
	private String strNumPrefactura;
	private String strCodRegistrador;
	private BigDecimal bdecSubTotal;
	private BigDecimal bdecMontoDescuento;
	private BigDecimal bdesTotal;
	private String  strIgv;
	
	public String getStrIgv() {
		return strIgv;
	}
	public void setStrIgv(String strIgv) {
		this.strIgv = strIgv;
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
	public String getStrNumPrefactura() {
		return strNumPrefactura;
	}
	public void setStrNumPrefactura(String strNumPrefactura) {
		this.strNumPrefactura = strNumPrefactura;
	}
	public String getStrCodRegistrador() {
		return strCodRegistrador;
	}
	public void setStrCodRegistrador(String strCodRegistrador) {
		this.strCodRegistrador = strCodRegistrador;
	}
	public BigDecimal getBdecSubTotal() {
		return bdecSubTotal;
	}
	public void setBdecSubTotal(BigDecimal bdecSubTotal) {
		this.bdecSubTotal = bdecSubTotal;
	}
	public BigDecimal getBdecIGV() {
		return bdecSubTotal.multiply(new BigDecimal(0.19)) ;
	}
	public void setBdecIGV(BigDecimal bdecIGV) {
	}
	public BigDecimal getBdecMontoDescuento() {
		return bdecMontoDescuento;
	}
	public void setBdecMontoDescuento(BigDecimal bdecMontoDescuento) {
		this.bdecMontoDescuento = bdecMontoDescuento;
	}
	public BigDecimal getBdesTotal() {
		return bdesTotal;
	}
	public void setBdesTotal(BigDecimal bdesTotal) {
		this.bdesTotal = bdesTotal;
	}
	
	
	
	
	

}
