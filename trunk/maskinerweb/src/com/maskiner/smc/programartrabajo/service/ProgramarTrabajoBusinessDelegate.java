package com.maskiner.smc.programartrabajo.service;

public class ProgramarTrabajoBusinessDelegate {
	
	public static TecnicoServiceI getTecnicoService(){
		return new TecnicoServiceImpl();
	}
	
	public static OrdenTrabajoServiceI getOrdenTrabajoService(){
		return new OrdenTrabajoServiceImpl();
	}
	

}
