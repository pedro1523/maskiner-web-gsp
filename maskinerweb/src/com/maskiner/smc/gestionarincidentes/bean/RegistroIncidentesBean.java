package com.maskiner.smc.gestionarincidentes.bean;

import java.sql.Date;
import java.util.ArrayList;

public class RegistroIncidentesBean {
	
	private String strNumeroIncidente;
	private Date dtFechaIncidente;
	private String strCodigoRegistrador;
	private String strCodigoCliente;
	private String strRazonSocialCliente;
	private String strLugarAtencionCliente;
	private String strDistritoAtencion;
	private String strSucursal;
	private int intEstadoIncidente;
	private String strDescripcionIncidente;
	private ArrayList<OrdenDeTrabajoXIncidenteBean> arrOrdenDeTrabajoXIncidente;
	private ArrayList<DetalleRegistroIncidenteBean> arrMaquinariasXIncidente;
	
	public RegistroIncidentesBean() {
		arrOrdenDeTrabajoXIncidente = new ArrayList<OrdenDeTrabajoXIncidenteBean>();
		arrMaquinariasXIncidente = new ArrayList<DetalleRegistroIncidenteBean>();
	}

	public String getStrLugarAtencionCliente() {
		return strLugarAtencionCliente;
	}

	public void setStrLugarAtencionCliente(String strLugarAtencionCliente) {
		this.strLugarAtencionCliente = strLugarAtencionCliente;
	}

	public String getStrDistritoAtencion() {
		return strDistritoAtencion;
	}

	public void setStrDistritoAtencion(String strDistritoAtencion) {
		this.strDistritoAtencion = strDistritoAtencion;
	}

	public ArrayList<DetalleRegistroIncidenteBean> getArrMaquinariasXIncidente() {
		return arrMaquinariasXIncidente;
	}

	public String getStrNumeroIncidente() {
		return strNumeroIncidente;
	}

	public void setStrNumeroIncidente(String strNumeroIncidente) {
		this.strNumeroIncidente = strNumeroIncidente;
	}

	public Date getDtFechaIncidente() {
		return dtFechaIncidente;
	}

	public void setDtFechaIncidente(Date dtFechaIncidente) {
		this.dtFechaIncidente = dtFechaIncidente;
	}

	public String getStrCodigoRegistrador() {
		return strCodigoRegistrador;
	}

	public void setStrCodigoRegistrador(String strCodigoRegistrador) {
		this.strCodigoRegistrador = strCodigoRegistrador;
	}

	public String getStrCodigoCliente() {
		return strCodigoCliente;
	}

	public void setStrCodigoCliente(String strCodigoCliente) {
		this.strCodigoCliente = strCodigoCliente;
	}

	public String getStrRazonSocialCliente() {
		return strRazonSocialCliente;
	}

	public void setStrRazonSocialCliente(String strRazonSocialCliente) {
		this.strRazonSocialCliente = strRazonSocialCliente;
	}

	public String getStrSucursal() {
		return strSucursal;
	}

	public void setStrSucursal(String strLugarAtencionCliente) {
		this.strSucursal = strLugarAtencionCliente;
	}

	public int getIntEstadoIncidente() {
		return intEstadoIncidente;
	}

	public void setIntEstadoIncidente(int intEstadoIncidente) {
		this.intEstadoIncidente = intEstadoIncidente;
	}

	public String getStrDescripcionIncidente() {
		return strDescripcionIncidente;
	}

	public void setStrDescripcionIncidente(String strDescripcionIncidente) {
		this.strDescripcionIncidente = strDescripcionIncidente;
	}

	public ArrayList<OrdenDeTrabajoXIncidenteBean> getArrOrdenDeTrabajoXIncidente() {
		return arrOrdenDeTrabajoXIncidente;
	}

	public void setArrOrdenDeTrabajoXIncidente(
			ArrayList<OrdenDeTrabajoXIncidenteBean> arrOrdenDeTrabajoXIncidente) {
		this.arrOrdenDeTrabajoXIncidente = arrOrdenDeTrabajoXIncidente;
	}

}
