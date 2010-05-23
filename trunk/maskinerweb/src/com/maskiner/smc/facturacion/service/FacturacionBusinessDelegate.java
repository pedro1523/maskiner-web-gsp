package com.maskiner.smc.facturacion.service;

public class FacturacionBusinessDelegate {
	
	public static FacturacionServiceI getFacturacionService(){
		return new FacturacionServiceImpl();
	}

}
