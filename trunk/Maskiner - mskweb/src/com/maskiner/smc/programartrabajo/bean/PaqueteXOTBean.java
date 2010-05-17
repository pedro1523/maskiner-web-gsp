package com.maskiner.smc.programartrabajo.bean;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

public class PaqueteXOTBean {
	private String strCodPaquete;
	private String strNombrePaquete;
	private String strNumOrdenTrabajo;
	private Date   dtFechEjecOrdenTrabajo;
	private int    intNumeroTecnicosNecesarios;
	private int    intNumeroHorasNecesarias;
	private Time   tmHoraInicio;
	private Time   tmHoraFin;
	private ArrayList<TecnicoBean> arrTecnicosAsignados;
	
	public PaqueteXOTBean() {
		arrTecnicosAsignados = new ArrayList<TecnicoBean>();
	}

	public String getStrCodPaquete() {
		return strCodPaquete;
	}

	public void setStrCodPaquete(String strCodPaquete) {
		this.strCodPaquete = strCodPaquete;
	}

	public String getStrNombrePaquete() {
		return strNombrePaquete;
	}

	public void setStrNombrePaquete(String strNombrePaquete) {
		this.strNombrePaquete = strNombrePaquete;
	}

	public String getStrNumOrdenTrabajo() {
		return strNumOrdenTrabajo;
	}

	public void setStrNumOrdenTrabajo(String strNumOrdenTrabajo) {
		this.strNumOrdenTrabajo = strNumOrdenTrabajo;
	}

	public Date getDtFechEjecOrdenTrabajo() {
		return dtFechEjecOrdenTrabajo;
	}

	public void setDtFechEjecOrdenTrabajo(Date dtFechEjecOrdenTrabajo) {
		this.dtFechEjecOrdenTrabajo = dtFechEjecOrdenTrabajo;
	}

	public int getIntNumeroTecnicosNecesarios() {
		return intNumeroTecnicosNecesarios;
	}

	public void setIntNumeroTecnicosNecesarios(int intNumeroTecnicosNecesarios) {
		this.intNumeroTecnicosNecesarios = intNumeroTecnicosNecesarios;
	}

	public int getIntNumeroHorasNecesarias() {
		return intNumeroHorasNecesarias;
	}

	public void setIntNumeroHorasNecesarias(int intNumeroHorasNecesarias) {
		this.intNumeroHorasNecesarias = intNumeroHorasNecesarias;
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

	public ArrayList<TecnicoBean> getArrTecnicosAsignados() {
		return arrTecnicosAsignados;
	}
	
}
