package com.maskiner.smc.programartrabajo.service;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;
import com.maskiner.smc.programartrabajo.dao.OrdenTrabajoDAO;

public class OrdenTrabajoServiceImpl implements OrdenTrabajoServiceI {

	@Override
	public void generarOrdenTrabajo(OrdenTrabajoBean ordenTrabajo)
			throws Exception {
		
		DAOFactory factory = DAOFactory.getDAOFactory();
		OrdenTrabajoDAO ordenTrabajoDAO = factory.getOrdenTrabajoDAO();
		
		ordenTrabajoDAO.generarOrdenTrabajo(ordenTrabajo);
	}

	@Override
	public OrdenTrabajoBean obtenerOrdenTrabajo(String codOrdenTrabajo)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*=================CHRISTIAN===================*/
	public boolean registrarOrdenTrabajoInspeccion( OrdenTrabajoInspeccionBean OTIbean) throws Exception{
	
	DAOFactory factoria=DAOFactory.getDAOFactory();
	OrdenTrabajoDAO ordenTrabajoDAO=factoria.getOrdenTrabajoDAO();
	
	return ordenTrabajoDAO.registrarOrdenTrabajoInspeccion(OTIbean);
}

/*===================FIN=================*/

}
