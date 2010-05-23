package com.maskiner.smc.seguridad.service;

public class SeguridadBusinessDelegate {

	public static SeguridadServiceI getSeguridadService(){
		return new SeguridaServiceImpl();
	}
	
}
