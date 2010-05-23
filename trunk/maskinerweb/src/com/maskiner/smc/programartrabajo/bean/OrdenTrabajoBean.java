package com.maskiner.smc.programartrabajo.bean;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class OrdenTrabajoBean {
	private String strNumOrdenTrabajo;
	private Date   dtFechaOrdenTrabajo;
	private String strCodRegistrador;
	private String strNumIncidente;
	private String strNumTarjeta;
	private String strCodMaquinaria;
	private String strDescripcionMaquinaria;
	private String strMarcaMaquinaria;
	private String strModeloMaquinaria;
	private String strDescripcionAveria;
	private int    intItmAveria;
	private int    intEstadoOrdenTrabajo;
	
	private ArrayList<PaqueteXOTBean> arrPaquetesXOT;
	
	public OrdenTrabajoBean() {
		arrPaquetesXOT = new ArrayList<PaqueteXOTBean>();
	}

	public String getStrNumOrdenTrabajo() {
		return strNumOrdenTrabajo;
	}

	public void setStrNumOrdenTrabajo(String strNumOrdenTrabajo) {
		this.strNumOrdenTrabajo = strNumOrdenTrabajo;
	}

	public Date getDtFechaOrdenTrabajo() {
		return dtFechaOrdenTrabajo;
	}

	public void setDtFechaOrdenTrabajo(Date dtFechaOrdenTrabajo) {
		this.dtFechaOrdenTrabajo = dtFechaOrdenTrabajo;
	}

	public String getStrCodRegistrador() {
		return strCodRegistrador;
	}

	public void setStrCodRegistrador(String strCodRegistrador) {
		this.strCodRegistrador = strCodRegistrador;
	}

	public String getStrNumIncidente() {
		return strNumIncidente;
	}

	public void setStrNumIncidente(String strNumIncidente) {
		this.strNumIncidente = strNumIncidente;
	}

	public String getStrNumTarjeta() {
		return strNumTarjeta;
	}

	public void setStrNumTarjeta(String strNumTarjeta) {
		this.strNumTarjeta = strNumTarjeta;
	}

	public String getStrCodMaquinaria() {
		return strCodMaquinaria;
	}

	public void setStrCodMaquinaria(String strCodMaquinaria) {
		this.strCodMaquinaria = strCodMaquinaria;
	}

	public String getStrDescripcionMaquinaria() {
		return strDescripcionMaquinaria;
	}

	public void setStrDescripcionMaquinaria(String strDescripcionMaquinaria) {
		this.strDescripcionMaquinaria = strDescripcionMaquinaria;
	}

	public String getStrMarcaMaquinaria() {
		return strMarcaMaquinaria;
	}

	public void setStrMarcaMaquinaria(String strMarcaMaquinaria) {
		this.strMarcaMaquinaria = strMarcaMaquinaria;
	}

	public String getStrModeloMaquinaria() {
		return strModeloMaquinaria;
	}

	public void setStrModeloMaquinaria(String strModeloMaquinaria) {
		this.strModeloMaquinaria = strModeloMaquinaria;
	}

	public String getStrDescripcionAveria() {
		return strDescripcionAveria;
	}

	public void setStrDescripcionAveria(String strDescripcionAveria) {
		this.strDescripcionAveria = strDescripcionAveria;
	}

	public int getIntItmAveria() {
		return intItmAveria;
	}

	public void setIntItmAveria(int intItmAveria) {
		this.intItmAveria = intItmAveria;
	}

	public int getIntEstadoOrdenTrabajo() {
		return intEstadoOrdenTrabajo;
	}

	public void setIntEstadoOrdenTrabajo(int intEstadoOrdenTrabajo) {
		this.intEstadoOrdenTrabajo = intEstadoOrdenTrabajo;
	}

	public ArrayList<PaqueteXOTBean> getArrPaquetesXOT() {
		return arrPaquetesXOT;
	}
	
}
