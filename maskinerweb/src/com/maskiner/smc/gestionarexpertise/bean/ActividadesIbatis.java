package com.maskiner.smc.gestionarexpertise.bean;

import java.io.Serializable;

public class ActividadesIbatis implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//Variables de Actividades
	private String 	strCodPaquetexAct;
	private String 	strDescripcionAct;
	private int 	intNumItemActxPaquete;
	
	//Metodos para obtener valores 
	public String getStrCodPaquetexAct() {
		return strCodPaquetexAct;
	}
	public void setStrCodPaquetexAct(String strCodPaquetexAct) {
		this.strCodPaquetexAct = strCodPaquetexAct;
	}
	public String getStrDescripcionAct() {
		return strDescripcionAct;
	}
	public void setStrDescripcionAct(String strDescripcionAct) {
		this.strDescripcionAct = strDescripcionAct;
	}
	public int getIntnumItemActxPaquete() {
		return intNumItemActxPaquete;
	}
	public void setIntnumItemActxPaquete(int intnumItemActxPaquete) {
		this.intNumItemActxPaquete = intnumItemActxPaquete;
	}
	
	
}
