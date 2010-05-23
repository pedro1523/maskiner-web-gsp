package com.maskiner.smc.liquidartrabajo.bean;

import java.math.BigDecimal;

public class MaterialesXLiquidacionBean {
	private String strNumInformeLiquidacion;
	private String strCodMaterial;
	private int intItem;
	private String strCodTipoMaterial;
	private String strDescripTipoMaterial;
	private String strDescripMaterial;
	private String strDescripMaterialExterno;
	private int intCantidad;
	private BigDecimal decPrecioUnitario;
	private BigDecimal decMontoTotal;

	public String getStrNumInformeLiquidacion() {
		return strNumInformeLiquidacion;
	}

	public void setStrNumInformeLiquidacion(String strNumInformeLiquidacion) {
		this.strNumInformeLiquidacion = strNumInformeLiquidacion;
	}

	public String getStrCodMaterial() {
		return strCodMaterial;
	}

	public void setStrCodMaterial(String strCodMaterial) {
		this.strCodMaterial = strCodMaterial;
	}

	public int getIntItem() {
		return intItem;
	}

	public String getStrDescripMaterial() {
		return strDescripMaterial;
	}

	public void setStrDescripMaterial(String strDescripMaterial) {
		this.strDescripMaterial = strDescripMaterial;
	}

	public String getStrCodTipoMaterial() {
		return strCodTipoMaterial;
	}

	public void setStrCodTipoMaterial(String strCodTipoMaterial) {
		this.strCodTipoMaterial = strCodTipoMaterial;
	}

	public String getStrDescripTipoMaterial() {
		return strDescripTipoMaterial;
	}

	public void setStrDescripTipoMaterial(String strDescripTipoMaterial) {
		this.strDescripTipoMaterial = strDescripTipoMaterial;
	}

	public void setIntItem(int intItem) {
		this.intItem = intItem;
	}

	public String getStrDescripMaterialExterno() {
		return strDescripMaterialExterno;
	}

	public void setStrDescripMaterialExterno(String strDescripMaterialExterno) {
		this.strDescripMaterialExterno = strDescripMaterialExterno;
	}

	public int getIntCantidad() {
		return intCantidad;
	}

	public void setIntCantidad(int intCantidad) {
		this.intCantidad = intCantidad;
	}

	public BigDecimal getDecPrecioUnitario() {
		return decPrecioUnitario;
	}

	public void setDecPrecioUnitario(BigDecimal decPrecioUnitario) {
		this.decPrecioUnitario = decPrecioUnitario;
	}

	public BigDecimal getDecMontoTotal() {
		return decMontoTotal;
	}

	public void setDecMontoTotal(BigDecimal decMontoTotal) {
		this.decMontoTotal = decMontoTotal;
	}

}
