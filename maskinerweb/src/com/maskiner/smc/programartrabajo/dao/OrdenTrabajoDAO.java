package com.maskiner.smc.programartrabajo.dao;

import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;

public interface OrdenTrabajoDAO {
	
	public abstract void generarOrdenTrabajo(OrdenTrabajoBean ordenTrabajo) throws Exception;

	/*===============CHRISTIAN================*/
	public boolean registrarOrdenTrabajoInspeccion( OrdenTrabajoInspeccionBean OTIbean) throws Exception;
	/*)==========FIN=====================*/
}
