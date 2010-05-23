package com.maskiner.smc.gestionarexpertise.service;

public class PaqueteBusinessDelegate {
	
	public static PaquetesServiceI getPaqueteService(){
		return new PaquetesServiceImpl();
	}

}
