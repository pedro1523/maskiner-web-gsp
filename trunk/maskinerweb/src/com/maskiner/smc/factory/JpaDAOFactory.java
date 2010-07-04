package com.maskiner.smc.factory;

import com.maskiner.smc.facturacion.dao.FacturacionDAO;
import com.maskiner.smc.gestionarexpertise.dao.PaqueteDAO;
import com.maskiner.smc.gestionarincidentes.dao.IncidenteDAO;
import com.maskiner.smc.liquidartrabajo.dao.LiquidacionDAO;
import com.maskiner.smc.liquidartrabajo.dao.MaterialesDAO;
import com.maskiner.smc.logistica.dao.TablaDeTablasDAO;
import com.maskiner.smc.maestroclientes.dao.MaestroClientesDAO;
import com.maskiner.smc.maestromaquinarias.dao.MaestroMaquinariasDAO;
import com.maskiner.smc.programartrabajo.dao.OrdenTrabajoDAO;
import com.maskiner.smc.programartrabajo.dao.TecnicoDAO;
import com.maskiner.smc.reportes.dao.JPAReportesDAO;
import com.maskiner.smc.reportes.dao.ReportesDAO;
import com.maskiner.smc.seguridad.dao.SeguridadDAO;

public class JpaDAOFactory extends DAOFactory {

	@Override
	public FacturacionDAO getFacturaDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IncidenteDAO getIncidenteDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LiquidacionDAO getLiquidacionDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MaestroClientesDAO getMaestroClientesDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MaestroMaquinariasDAO getMaestroMaquinariasDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MaterialesDAO getMaterialesDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrdenTrabajoDAO getOrdenTrabajoDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaqueteDAO getPaqueteDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SeguridadDAO getSeguridadDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TablaDeTablasDAO getTablaDeTablasDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TecnicoDAO getTecnicoDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportesDAO getReportesDAO() {
		// TODO Auto-generated method stub
		return new JPAReportesDAO();
	}


}
