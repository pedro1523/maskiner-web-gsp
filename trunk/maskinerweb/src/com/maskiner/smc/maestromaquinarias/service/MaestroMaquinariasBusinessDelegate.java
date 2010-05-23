package com.maskiner.smc.maestromaquinarias.service;



public class MaestroMaquinariasBusinessDelegate {
	
	public static MaestroMaquinariasI getMaestroMaquinariasService(){
		return new MaestroMaquinariasServiceImpl();
	}
}
