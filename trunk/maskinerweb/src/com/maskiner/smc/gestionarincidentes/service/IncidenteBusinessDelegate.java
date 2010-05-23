package com.maskiner.smc.gestionarincidentes.service;

public class IncidenteBusinessDelegate {
	
	public static IncidenteServiceI getIncidenteService(){
		return new IncidenteServiceImpl();
	}

}
