package com.maskiner.smc.liquidartrabajo.bean;

import java.math.BigDecimal;
import java.sql.Time;

public class TecnicosXLiquidacionBean {
	private String strNumInformeLiquidacion;
	private String strCodTecnico;
	private String strApellidoPaterno;
	private String strApellidoMaterno;
	private String strNombres;
	private String strNombreCompleto;
	private Time tmHoraInicio;
	private Time tmHoraFin;
	private double dblNumeroHorasTrabajadas;
	private BigDecimal decTarifaHoraCobrada;
	private String strCodPaquete;
	private String strCodOrdenTrabajo;
	
	
	public String getStrCodOrdenTrabajo() {
		return strCodOrdenTrabajo;
	}
	public void setStrCodOrdenTrabajo(String strCodOrdenTrabajo) {
		this.strCodOrdenTrabajo = strCodOrdenTrabajo;
	}
	public String getStrCodPaquete() {
		return strCodPaquete;
	}
	public void setStrCodPaquete(String strCodPaquete) {
		this.strCodPaquete = strCodPaquete;
	}
	public String getStrNumInformeLiquidacion() {
		return strNumInformeLiquidacion;
	}
	public void setStrNumInformeLiquidacion(String strNumInformeLiquidacion) {
		this.strNumInformeLiquidacion = strNumInformeLiquidacion;
	}
	public String getStrCodTecnico() {
		return strCodTecnico;
	}
	
	public String getStrApellidoPaterno() {
		return strApellidoPaterno;
	}
	public void setStrApellidoPaterno(String strApellidoPaterno) {
		this.strApellidoPaterno = strApellidoPaterno;
	}
	public String getStrApellidoMaterno() {
		return strApellidoMaterno;
	}
	public void setStrApellidoMaterno(String strApellidoMaterno) {
		this.strApellidoMaterno = strApellidoMaterno;
	}
	public String getStrNombres() {
		return strNombres;
	}
	public void setStrNombres(String strNombres) {
		this.strNombres = strNombres;
	}
	public void setStrCodTecnico(String strCodTecnico) {
		this.strCodTecnico = strCodTecnico;
	}
	public Time getTmHoraInicio() {
		return tmHoraInicio;
	}
	
	public void setTmHoraInicio(Time tmHoraInicio) {
		this.tmHoraInicio = tmHoraInicio;
	}
	public Time getTmHoraFin() {
		return tmHoraFin;
	}
	public void setTmHoraFin(Time tmHoraFin) {
		this.tmHoraFin = tmHoraFin;
	}
	public double getDblNumeroHorasTrabajadas() {
		return dblNumeroHorasTrabajadas;
	}
	public void setDblNumeroHorasTrabajadas(double dblNumeroHorasTrabajadas) {
		this.dblNumeroHorasTrabajadas = dblNumeroHorasTrabajadas;
	}
	public BigDecimal getDecTarifaHoraCobrada() {
		return decTarifaHoraCobrada;
	}
	public void setDecTarifaHoraCobrada(BigDecimal decTarifaHoraCobrada) {
		this.decTarifaHoraCobrada = decTarifaHoraCobrada;
	}
	public String getStrNombreCompleto() {
		return strNombreCompleto;
	}
	public void setStrNombreCompleto(String strNombreCompleto) {
		this.strNombreCompleto = strNombreCompleto;
	}
}
