package com.maskiner.smc.logistica.bean;

import java.math.BigDecimal;

public class MaterialBean {
	private String strCodMaterial;
	private int intCodTipoMaterial;
	private String strTipoMaterial;
	private String strDescTipoMaterial;
	private String strDescripMaterial;
	private String strUnidadMedida;
	private BigDecimal bdPrecioUnitario;
	public String getStrCodMaterial() {
		return strCodMaterial;
	}
	public void setStrCodMaterial(String strCodMaterial) {
		this.strCodMaterial = strCodMaterial;
	}
	public int getIntCodTipoMaterial() {
		return intCodTipoMaterial;
	}
	public void setIntCodTipoMaterial(int intCodTipoMaterial) {
		this.intCodTipoMaterial = intCodTipoMaterial;
	}
	public String getStrTipoMaterial() {
		return strTipoMaterial;
	}
	public void setStrTipoMaterial(String strTipoMaterial) {
		this.strTipoMaterial = strTipoMaterial;
	}
	public String getStrDescripMaterial() {
		return strDescripMaterial;
	}
	public void setStrDescripMaterial(String strDescripMaterial) {
		this.strDescripMaterial = strDescripMaterial;
	}
	public String getStrUnidadMedida() {
		return strUnidadMedida;
	}
	public void setStrUnidadMedida(String strUnidadMedida) {
		this.strUnidadMedida = strUnidadMedida;
	}
	public BigDecimal getBdPrecioUnitario() {
		return bdPrecioUnitario;
	}
	public void setBdPrecioUnitario(BigDecimal bdPrecioUnitario) {
		this.bdPrecioUnitario = bdPrecioUnitario;
	}
	public String getStrDescTipoMaterial() {
		return strDescTipoMaterial;
	}
	public void setStrDescTipoMaterial(String strDescTipoMaterial) {
		this.strDescTipoMaterial = strDescTipoMaterial;
	}

}
