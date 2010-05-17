package com.maskiner.smc.programartrabajo.service;

import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;

public interface OrdenTrabajoServiceI {

	public abstract void generarOrdenTrabajo(OrdenTrabajoBean ordenTrabajo) throws Exception;
	
	public abstract OrdenTrabajoBean obtenerOrdenTrabajo(String codOrdenTrabajo) throws Exception;
	

	/*===============CHRISTIAN======================*/
	public boolean registrarOrdenTrabajoInspeccion( OrdenTrabajoInspeccionBean OTIbean) throws Exception;
	/*=================FIN=====================*/
	
}
