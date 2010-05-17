package com.maskiner.smc.facturacion.bean;

import java.math.BigDecimal;

public class DetallePrefacturaBean {
	
	private String 	   strCodigo;
	private String 	   strDescripcion;
	private int        intCantidad;
	private BigDecimal decPrecio;
	private BigDecimal decImporte;
	private String 	   strNumLiquidacion;
	private String 	   strDesMatExterno;
	private String 		strFlag;
	
	
	public String getStrFlag() {
		return strFlag;
	}
	public void setStrFlag(String strFlag) {
		this.strFlag = strFlag;
	}
	public String getStrDesMatExterno() {
		return strDesMatExterno;
	}
	public void setStrDesMatExterno(String strDesMatExterno) {
		this.strDesMatExterno = strDesMatExterno;
	}
	public String getStrNumLiquidacion() {
		return strNumLiquidacion;
	}
	public void setStrNumLiquidacion(String strNumLiquidacion) {
		this.strNumLiquidacion = strNumLiquidacion;
	}
	public String getStrCodigo() {
		return strCodigo;
	}
	public void setStrCodigo(String strCodigo) {
		this.strCodigo = strCodigo;
	}
	public String getStrDescripcion() {
		return strDescripcion;
	}
	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}
	public int getIntCantidad() {
		return intCantidad;
	}
	public void setIntCantidad(int intCantidad) {
		this.intCantidad = intCantidad;
	}
	public BigDecimal getDecPrecio() {
		return decPrecio;
	}
	public void setDecPrecio(BigDecimal decPrecio) {
		this.decPrecio = decPrecio;
	}
	public BigDecimal getDecImporte() {
		return decPrecio.multiply(new BigDecimal(intCantidad));		
	}
	public void setDecImporte(BigDecimal decImporte) {
		this.decImporte = decImporte;
	}
	
	
	

}
