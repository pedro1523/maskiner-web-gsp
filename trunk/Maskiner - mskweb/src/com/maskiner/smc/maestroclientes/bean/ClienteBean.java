package com.maskiner.smc.maestroclientes.bean;

import java.sql.Date;
import java.util.ArrayList;

public class ClienteBean {
	
	private String 	strCodCliente;
	private Date 	dtFecRegCliente;
	private String 	strCodRegistrador;
	private String 	strRucCliente;
	private String 	strRazSocCliente;
	private String 	strEmailCliente;
	private String 	strDesCliente;
	private ArrayList<SucursalBean> arrSucursalBean;
	

	public ArrayList<SucursalBean> getArrSucursalBean() {
		return arrSucursalBean;
	}
	public void setArrSucursalBean(ArrayList<SucursalBean> arrSucursalBean) {
		this.arrSucursalBean = arrSucursalBean;
	}
	
	public String getStrCodCliente() {
		return strCodCliente;
	}
	public void setStrCodCliente(String strCodCliente) {
		this.strCodCliente = strCodCliente;
	}
	public Date getDtFecRegCliente() {
		return dtFecRegCliente;
	}
	public void setDtFecRegCliente(Date dtFecRegCliente) {
		this.dtFecRegCliente = dtFecRegCliente;
	}
	public String getStrCodRegistrador() {
		return strCodRegistrador;
	}
	public void setStrCodRegistrador(String strCodRegistrador) {
		this.strCodRegistrador = strCodRegistrador;
	}
	public String getStrRucCliente() {
		return strRucCliente;
	}
	public void setStrRucCliente(String strRucCliente) {
		this.strRucCliente = strRucCliente;
	}
	public String getStrRazSocCliente() {
		return strRazSocCliente;
	}
	public void setStrRazSocCliente(String strRazSocCliente) {
		this.strRazSocCliente = strRazSocCliente;
	}
	public String getStrEmailCliente() {
		return strEmailCliente;
	}
	public void setStrEmailCliente(String strEmailCliente) {
		this.strEmailCliente = strEmailCliente;
	}
	public String getStrDesCliente() {
		return strDesCliente;
	}
	public void setStrDesCliente(String strDesCliente) {
		this.strDesCliente = strDesCliente;
	}


	

}
