package com.maskiner.smc.liquidartrabajo.bean;

import java.sql.Date;

public class LiquidacionBean {
	private String strNumInfLiquidacion;
	private String strNumOrdTrabajo;
	private String strNumPrefactura;
	private Date   datFecInfLiquidacion;
	private String strCodRegistrador;
	private String strDesAtenRealizada;
	private String strAporConocimiento;
	private int    intEstLiquidacion;
	private String strFecIncidente;
	
	private String strNumIncidente;
	private int    intValHorometro;
	
		
	public int getIntValHorometro() {
		return intValHorometro;
	}
	public void setIntValHorometro(int intValHorometro) {
		this.intValHorometro = intValHorometro;
	}
	public String getStrNumIncidente() {
		return strNumIncidente;
	}
	public void setStrNumIncidente(String strNumIncidente) {
		this.strNumIncidente = strNumIncidente;
	}
	public String getStrFecIncidente() {
		return strFecIncidente;
	}
	public void setStrFecIncidente(String strFecIncidente) {
		this.strFecIncidente = strFecIncidente;
	}
	public String getStrNumInfLiquidacion() {
		return strNumInfLiquidacion;
	}
	public void setStrNumInfLiquidacion(String strNumInfLiquidacion) {
		this.strNumInfLiquidacion = strNumInfLiquidacion;
	}
	public String getStrNumOrdTrabajo() {
		return strNumOrdTrabajo;
	}
	public void setStrNumOrdTrabajo(String strNumOrdTrabajo) {
		this.strNumOrdTrabajo = strNumOrdTrabajo;
	}
	public String getStrNumPrefactura() {
		return strNumPrefactura;
	}
	public void setStrNumPrefactura(String strNumPrefactura) {
		this.strNumPrefactura = strNumPrefactura;
	}
	public Date getDatFecInfLiquidacion() {
		return datFecInfLiquidacion;
	}
	public void setDatFecInfLiquidacion(Date datFecInfLiquidacion) {
		this.datFecInfLiquidacion = datFecInfLiquidacion;
	}
	public String getStrCodRegistrador() {
		return strCodRegistrador;
	}
	public void setStrCodRegistrador(String strCodRegistrador) {
		this.strCodRegistrador = strCodRegistrador;
	}
	public String getStrDesAtenRealizada() {
		return strDesAtenRealizada;
	}
	public void setStrDesAtenRealizada(String strDesAtenRealizada) {
		this.strDesAtenRealizada = strDesAtenRealizada;
	}
	public String getStrAporConocimiento() {
		return strAporConocimiento;
	}
	public void setStrAporConocimiento(String strAporConocimiento) {
		this.strAporConocimiento = strAporConocimiento;
	}
	public int getIntEstLiquidacion() {
		return intEstLiquidacion;
	}
	public void setIntEstLiquidacion(int intEstLiquidacion) {
		this.intEstLiquidacion = intEstLiquidacion;
	}
}
