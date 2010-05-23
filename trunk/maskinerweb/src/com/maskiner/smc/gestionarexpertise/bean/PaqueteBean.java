package com.maskiner.smc.gestionarexpertise.bean;

import java.sql.Date;
import java.util.ArrayList;

public class PaqueteBean {
	private String 	strCodPaquete;
	private Date 	datFechaRegistroPaquete;
	private String 	strCodRegistro;
	private String 	strNombre;
	private String 	strMarcaMaqApliPaquete;
	private String 	strModeloMaqApliPaquete;
	private int 	intCantidadTecPaquete;
	private int		intCantidadHoraPaquete;
	private int		intIntervaloHorometro;
	
	//Arreglos para obtener valores de los detalles de los sgtes bean
	private ArrayList<ActividadesBean > arrPaqueteDetActivBean;
	private ArrayList<HerramientaBean > arrPaqueteDetHerrBean;
	private ArrayList<MaterialesBean > arrPaqueteDetMatBean;
	
	//metodos para obtener valores asignados
	public ArrayList<ActividadesBean> getArrPaqueteDetActivBean() {
		return arrPaqueteDetActivBean;
	}
	public void setArrPaqueteDetActivBean(
			ArrayList<ActividadesBean> arrPaqueteDetActivBean) {
		this.arrPaqueteDetActivBean = arrPaqueteDetActivBean;
	}
	public ArrayList<HerramientaBean> getArrPaqueteDetHerrBean() {
		return arrPaqueteDetHerrBean;
	}
	public void setArrPaqueteDetHerrBean(
			ArrayList<HerramientaBean> arrPaqueteDetHerrBean) {
		this.arrPaqueteDetHerrBean = arrPaqueteDetHerrBean;
	}
	public ArrayList<MaterialesBean> getArrPaqueteDetMatBean() {
		return arrPaqueteDetMatBean;
	}
	public void setArrPaqueteDetMatBean(
			ArrayList<MaterialesBean> arrPaqueteDetMatBean) {
		this.arrPaqueteDetMatBean = arrPaqueteDetMatBean;
	}
	
	
	public String getStrCodPaquete() {
		return strCodPaquete;
	}
	public void setStrCodPaquete(String strCodPaquete) {
		this.strCodPaquete = strCodPaquete;
	}
	public Date getDatFechaRegistroPaquete() {
		return datFechaRegistroPaquete;
	}
	public void setDatFechaRegistroPaquete(Date datFechaRegistroPaquete) {
		this.datFechaRegistroPaquete = datFechaRegistroPaquete;
	}
	public String getStrCodRegistro() {
		return strCodRegistro;
	}
	public void setStrCodRegistro(String strCodRegistro) {
		this.strCodRegistro = strCodRegistro;
	}
	public String getStrNombre() {
		return strNombre;
	}
	public void setStrNombre(String strNombre) {
		this.strNombre = strNombre;
	}
	public String getStrMarcaMaqApliPaquete() {
		return strMarcaMaqApliPaquete;
	}
	public void setStrMarcaMaqApliPaquete(String strMarcaMaqApliPaquete) {
		this.strMarcaMaqApliPaquete = strMarcaMaqApliPaquete;
	}
	public String getStrModeloMaqApliPaquete() {
		return strModeloMaqApliPaquete;
	}
	public void setStrModeloMaqApliPaquete(String strModeloMaqApliPaquete) {
		this.strModeloMaqApliPaquete = strModeloMaqApliPaquete;
	}
	public int getIntCantidadTecPaquete() {
		return intCantidadTecPaquete;
	}
	public void setIntCantidadTecPaquete(int intCantidadTecPaquete) {
		this.intCantidadTecPaquete = intCantidadTecPaquete;
	}
	public int getIntCantidadHoraPaquete() {
		return intCantidadHoraPaquete;
	}
	public void setIntCantidadHoraPaquete(int intCantidadHoraPaquete) {
		this.intCantidadHoraPaquete = intCantidadHoraPaquete;
	}
	public int getIntIntervaloHorometro() {
		return intIntervaloHorometro;
	}
	public void setIntIntervaloHorometro(int intIntervaloHorometro) {
		this.intIntervaloHorometro = intIntervaloHorometro;
	}

}
