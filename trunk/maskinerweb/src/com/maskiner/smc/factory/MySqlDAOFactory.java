package com.maskiner.smc.factory;

import com.maskiner.smc.facturacion.dao.FacturacionDAO;
import com.maskiner.smc.facturacion.dao.MySqlFacturacionDAO;
import com.maskiner.smc.gestionarexpertise.dao.MySqlPaqueteDAO;
import com.maskiner.smc.gestionarexpertise.dao.PaqueteDAO;
import com.maskiner.smc.gestionarincidentes.dao.IncidenteDAO;
import com.maskiner.smc.gestionarincidentes.dao.MySqlIncidenteDAO;
import com.maskiner.smc.liquidartrabajo.dao.LiquidacionDAO;
import com.maskiner.smc.liquidartrabajo.dao.MaterialesDAO;
import com.maskiner.smc.liquidartrabajo.dao.MySqlLiquidacionDAO;
import com.maskiner.smc.liquidartrabajo.dao.MySqlMaterialesDAO;
import com.maskiner.smc.logistica.dao.MySqlTablaDeTablasDAO;
import com.maskiner.smc.logistica.dao.TablaDeTablasDAO;
import com.maskiner.smc.maestroclientes.dao.MaestroClientesDAO;
import com.maskiner.smc.maestroclientes.dao.MySqlMaestroClientesDAO;
import com.maskiner.smc.maestromaquinarias.dao.MaestroMaquinariasDAO;
import com.maskiner.smc.maestromaquinarias.dao.MySqlMaestroMaquinariasDAO;
import com.maskiner.smc.programartrabajo.dao.MySqlOrdenTrabajoDAO;
import com.maskiner.smc.programartrabajo.dao.MySqlTecnicoDAO;
import com.maskiner.smc.programartrabajo.dao.OrdenTrabajoDAO;
import com.maskiner.smc.programartrabajo.dao.TecnicoDAO;
import com.maskiner.smc.seguridad.dao.MySqlSeguridadDAO;
import com.maskiner.smc.seguridad.dao.SeguridadDAO;


public class MySqlDAOFactory extends DAOFactory {

	public MySqlDAOFactory() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public OrdenTrabajoDAO getOrdenTrabajoDAO() {
		return new MySqlOrdenTrabajoDAO();
	}

	@Override
	public TecnicoDAO getTecnicoDAO() {
		return new MySqlTecnicoDAO();
	}

	@Override
	public SeguridadDAO getSeguridadDAO() {
		// TODO Auto-generated method stub
		return new MySqlSeguridadDAO();
	}

	@Override
	public IncidenteDAO getIncidenteDAO() {
		// TODO Auto-generated method stub
		return new MySqlIncidenteDAO();
	}
	
	public PaqueteDAO getPaqueteDAO() {
		return new MySqlPaqueteDAO();
	}

	@Override
	public MaestroClientesDAO getMaestroClientesDAO() {
		// TODO Auto-generated method stub
		return new MySqlMaestroClientesDAO();
	}

	@Override
	public MaestroMaquinariasDAO getMaestroMaquinariasDAO() {
		// TODO Auto-generated method stub
		return new MySqlMaestroMaquinariasDAO();
	}

	@Override
	public TablaDeTablasDAO getTablaDeTablasDAO() {
		// TODO Auto-generated method stub
		return new MySqlTablaDeTablasDAO();
	}

	@Override
	public MaterialesDAO getMaterialesDAO() {
		// TODO Auto-generated method stub
		return new MySqlMaterialesDAO();
	}
	
	@Override
	public LiquidacionDAO getLiquidacionDAO() {
		// TODO Auto-generated method stub
		return new MySqlLiquidacionDAO();
	}
	
	public FacturacionDAO getFacturaDAO() {
		// TODO Auto-generated method stub
		return new MySqlFacturacionDAO();
	}
	

}
