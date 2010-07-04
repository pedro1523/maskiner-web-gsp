package com.maskiner.smc.reportes.dao;

import java.util.List;

import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;

public interface ReportesDAO {
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(String codCliente, String annio) throws Exception;
}
