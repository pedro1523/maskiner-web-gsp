package com.maskiner.smc.reportes.service;

import java.util.List;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.dao.ReportesDAO;

public class ReportesServiceImpl implements ReportesServiceI {
	
	ReportesDAO reportesDAO;
	
	public ReportesServiceImpl() {
		DAOFactory factoria = DAOFactory.getDAOFactory(6);
		reportesDAO = factoria.getReportesDAO();
	}

	@Override
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(
			String codCliente, String annio) throws Exception {
		return reportesDAO.obtenerDatosReporteFrecuenciaIncidentes(codCliente, annio);
	}

}
