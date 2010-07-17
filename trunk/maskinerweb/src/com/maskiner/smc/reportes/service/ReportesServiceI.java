package com.maskiner.smc.reportes.service;

import java.util.Date;
import java.util.List;

import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.bean.ReporteGastosXMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteTecnicosOTBean;
import com.maskiner.smc.reportes.bean.ReporteUtilizacionMaquinaria;

public interface ReportesServiceI {
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(String codCliente, String annio) throws Exception;

	public List<ReporteTecnicosOTBean> obtenerDatosReporteTecnicosOT(String codOrdenTrabajo) throws Exception;

	public List<ReporteGastosXMaquinariaBean> obtenerDatosReporteGastosXMaquinaria(
			String numTarjeta, Date fechaInicio, Date fechaFin) throws Exception;

	public List<ReporteUtilizacionMaquinaria> obtenerDatosReporteUtilizacionMaquinaria(
			String numTarjeta) throws Exception;
}