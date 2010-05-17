package com.maskiner.smc.maestroclientes.service;


public class MaestroClientesBusinessDelegate {
	public static MaestroClientesI getMaestroClientesService(){
		return new MaestroClientesServiceImpl();
	}
}
