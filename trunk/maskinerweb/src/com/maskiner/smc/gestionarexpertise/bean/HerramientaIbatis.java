package com.maskiner.smc.gestionarexpertise.bean;

import java.io.Serializable;

public class HerramientaIbatis implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	//Variables del Bean Herramientas
	private int 	intCantidadHerramientaxPqte;
	private String 	strCodHerramienta;
	private String  strCodPaquetexHerram;
	private String 	strDescripcionHerram;
	private int intItemHerramienta;
	
	
	//Metodos para obtener valores del Bean Herramientas
	public int getIntItemHerramienta() {
		return intItemHerramienta;
	}
	public void setIntItemHerramienta(int intItemHerramienta) {
		this.intItemHerramienta = intItemHerramienta;
	}
	public String getStrDescripcionHerram() {
		return strDescripcionHerram;
	}
	public void setStrDescripcionHerram(String strDescripcionHerram) {
		this.strDescripcionHerram = strDescripcionHerram;
	}
	public int getIntCantidadHerramientaxPqte() {
		return intCantidadHerramientaxPqte;
	}
	public void setIntCantidadHerramientaxPqte(int intCantidadHerramientaxPqte) {
		this.intCantidadHerramientaxPqte = intCantidadHerramientaxPqte;
	}
	public String getStrCodHerramienta() {
		return strCodHerramienta;
	}
	public void setStrCodHerramienta(String strCodHerramienta) {
		this.strCodHerramienta = strCodHerramienta;
	}
	
	public String getStrCodPaquetexHerram() {
		return strCodPaquetexHerram;
	}
	public void setStrCodPaquetexHerram(String strCodPaquetexHerram) {
		this.strCodPaquetexHerram = strCodPaquetexHerram;
	}
	
}
