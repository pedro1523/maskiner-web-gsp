package com.maskiner.smc.reportes.service;

import java.util.Date;
import java.util.List;

import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.bean.ReporteTecnicosOTBean;

public interface ReportesServiceI {
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(String codCliente, String annio) throws Exception;

	public List<ReporteTecnicosOTBean> obtenerDatosReporteTecnicosOT(String codOrdenTrabajo, Date fechaInicio, Date fechaFin) throws Exception;
}
