package com.maskiner.smc.facturacion.bean;

import java.math.BigDecimal;
import java.util.ArrayList;

public class PrefacturaBean {
	
	private String strNumPrefactura;
	private String strFecPrefactura;
	private String strCodRegistrador;
	private String strObsPrefactura;
	private int    intEstPrefactura;
	private BigDecimal decMonPrefactura;
	private BigDecimal decMonDescuento;
	
	
	public BigDecimal getDecMonDescuento() {
		return decMonDescuento;
	}

	public void setDecMonDescuento(BigDecimal decMonDescuento) {
		this.decMonDescuento = decMonDescuento;
	}
	private String strCodCliente;
	private String strRazonSocial;
	private String strRuc;
	private String strDireccion;
	
	public String getStrDireccion() {
		return strDireccion;
	}

	public void setStrDireccion(String strDireccion) {
		this.strDireccion = strDireccion;
	}
	private ArrayList<DetallePrefacturaBean>listDetallePrefactura;
	
	
	public String getStrCodCliente() {
		return strCodCliente;
	}

	public void setStrCodCliente(String strCodCliente) {
		this.strCodCliente = strCodCliente;
	}

	public String getStrRazonSocial() {
		return strRazonSocial;
	}

	public void setStrRazonSocial(String strRazonSocial) {
		this.strRazonSocial = strRazonSocial;
	}

	public String getStrRuc() {
		return strRuc;
	}

	public void setStrRuc(String strRuc) {
		this.strRuc = strRuc;
	}

	public PrefacturaBean(){
		listDetallePrefactura=new ArrayList<DetallePrefacturaBean>();
	}
	
	public String getStrNumPrefactura() {
		return strNumPrefactura;
	}
	public void setStrNumPrefactura(String strNumPrefactura) {
		this.strNumPrefactura = strNumPrefactura;
	}
	public String getStrFecPrefactura() {
		return strFecPrefactura;
	}
	public void setStrFecPrefactura(String strFecPrefactura) {
		this.strFecPrefactura = strFecPrefactura;
	}
	public String getStrCodRegistrador() {
		return strCodRegistrador;
	}
	public void setStrCodRegistrador(String strCodRegistrador) {
		this.strCodRegistrador = strCodRegistrador;
	}
	public String getStrObsPrefactura() {
		return strObsPrefactura;
	}
	public void setStrObsPrefactura(String strObsPrefactura) {
		this.strObsPrefactura = strObsPrefactura;
	}
	public int getIntEstPrefactura() {
		return intEstPrefactura;
	}
	public void setIntEstPrefactura(int intEstPrefactura) {
		this.intEstPrefactura = intEstPrefactura;
	}
	public BigDecimal getDecMonPrefactura() {
		return decMonPrefactura;
	}
	public void setDecMonPrefactura(BigDecimal decMonPrefactura) {
		this.decMonPrefactura = decMonPrefactura;
	}
	
	

}
