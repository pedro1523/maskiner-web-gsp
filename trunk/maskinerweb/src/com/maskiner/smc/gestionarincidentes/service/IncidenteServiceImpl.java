package com.maskiner.smc.gestionarincidentes.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.gestionarincidentes.dao.IncidenteDAO;
import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;

public class IncidenteServiceImpl implements IncidenteServiceI {

	@Override
	public List<RegistroIncidentesBean> buscarIncidentes(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		List<RegistroIncidentesBean> arr = incidenteDAO.buscarIncidentes(nombreEmpresa, fechaIncidente, descripcionIncidente);
		
		return arr;
	}
	@Override
	public List<RegistroIncidentesBean> buscarIncidentesOTI(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		List<RegistroIncidentesBean> arr = incidenteDAO.buscarIncidentesOTI(nombreEmpresa, fechaIncidente, descripcionIncidente);
		
		return arr;
	}

	@Override
	public RegistroIncidentesBean obtenerIncidente(String numIncidente)
			throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		RegistroIncidentesBean regIncid = incidenteDAO.obtenerIncidente(numIncidente);
		
		return regIncid;
	}

	@Override
	public String RegistrarIncidenteYDetalle(RegistroIncidentesBean bean,
			ArrayList<DetalleRegistroIncidenteBean> det) throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		return incidenteDAO.RegistrarIncidenteYDetalle(bean, det);
	}

	@Override
	public List<RegistroIncidentesBean> buscarIncidentesParaLiquidacion(
			String nombreEmpresa, Date fechaIncidente,
			String descripcionIncidente) throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		List<RegistroIncidentesBean> arr = incidenteDAO.buscarIncidentesParaLiquidacion(nombreEmpresa, fechaIncidente, descripcionIncidente);
		
		return arr;
	}
	
	@Override
	public RegistroIncidentesBean obtenerIncidenteParaLiquidacion(
			String numIncidente) throws Exception {
		
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		RegistroIncidentesBean regIncid = incidenteDAO.obtenerIncidenteParaLiquidacion(numIncidente);
		
		return regIncid;
	}

	@Override
	public ArrayList<TablaDeTablasBean> listarTipoDeAverias() throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		ArrayList<TablaDeTablasBean> arr = incidenteDAO.listarTipoDeAverias();
		
		return arr;
	}
	
	/*=======================CHRISTIAN/=======================*/
	public ClienteBean obtenerClientePorIncidente(String numIncidente)	throws Exception{
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		ClienteBean cliente = incidenteDAO.obtenerClientePorIncidente(numIncidente);
		return cliente;
	}
	
	public RegistroIncidentesBean obtenerIncidenteInspeccion(String numIncidente)
	throws Exception{
		
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		RegistroIncidentesBean regIncid = incidenteDAO.obtenerIncidenteInspeccion(numIncidente);
		
		return regIncid;
		
	}
	
	public RegistroIncidentesBean obtenerIncidenteInspeccionOTI(String numIncidente)
	throws Exception{
		
		DAOFactory factoria = DAOFactory.getDAOFactory();
		IncidenteDAO incidenteDAO = factoria.getIncidenteDAO();
		
		RegistroIncidentesBean regIncid = incidenteDAO.obtenerIncidenteInspeccionOTI(numIncidente);
		
		return regIncid;
		
	}
	/*==========================FIN=====================*/

}
