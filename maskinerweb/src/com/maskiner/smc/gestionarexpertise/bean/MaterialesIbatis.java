package com.maskiner.smc.gestionarexpertise.bean;

import java.io.Serializable;


public class MaterialesIbatis implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//Variables de Materiales
	private String 	strCodMaterial;
	private String 	strCodPaquetexMat;
	private int 	intCantidadMat;
	private int 	intTipoMat;
	private String 	strDescrMat;
	private String 	strUnidMedidaMat;
	private double	decPrecioUnitMat; 
	private int intItemMaterial;
	
	//Metodos para obtener valores
	public int getIntItemMaterial() {
		return intItemMaterial;
	}
	public void setIntItemMaterial(int intItemMaterial) {
		this.intItemMaterial = intItemMaterial;
	}
	public void setDecPrecioUnitMat(double decPrecioUnitMat) {
		this.decPrecioUnitMat = decPrecioUnitMat;
	}
	public String getStrCodMaterial() {
		return strCodMaterial;
	}
	public void setStrCodMaterial(String strCodMaterial) {
		this.strCodMaterial = strCodMaterial;
	}
	public String getStrCodPaquetexMat() {
		return strCodPaquetexMat;
	}
	public void setStrCodPaquetexMat(String strCodPaquetexMat) {
		this.strCodPaquetexMat = strCodPaquetexMat;
	}
	public int getIntCantidadMat() {
		return intCantidadMat;
	}
	public void setIntCantidadMat(int intCantidadMat) {
		this.intCantidadMat = intCantidadMat;
	}
	public int getIntTipoMat() {
		return intTipoMat;
	}
	public void setIntTipoMat(int intTipoMat) {
		this.intTipoMat = intTipoMat;
	}
	public String getStrDescrMat() {
		return strDescrMat;
	}
	public void setStrDescrMat(String strDescrMat) {
		this.strDescrMat = strDescrMat;
	}
	public String getStrUnidMedidaMat() {
		return strUnidMedidaMat;
	}
	public void setStrUnidMedidaMat(String strUnidMedidaMat) {
		this.strUnidMedidaMat = strUnidMedidaMat;
	}
	public Double getDecPrecioUnitMat() {
		return decPrecioUnitMat;
	}
	public void setDecPrecioUnitMat(Double decPrecioUnitMat) {
		this.decPrecioUnitMat = decPrecioUnitMat;
	}
}




	
	