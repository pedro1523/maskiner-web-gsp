package com.maskiner.smc.reportes.dao;

import java.util.Date;
import java.util.List;

import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.bean.ReporteGastosXMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteHistorialMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteTecnicosOTBean;
import com.maskiner.smc.reportes.bean.ReporteUtilizacionMaquinariaBean;

public interface ReportesDAO {
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(String codCliente, String annio) throws Exception;

	public List<ReporteTecnicosOTBean> obtenerDatosReporteTecnicosOT(String codOrdenTrabajo) throws Exception;

	public List<ReporteGastosXMaquinariaBean> obtenerDatosReporteGastosXMaquinaria(
			String numTarjeta, Date fechaInicio, Date fechaFin) throws Exception;

	public List<ReporteUtilizacionMaquinariaBean> obtenerDatosReporteUtilizacionMaquinaria(
			String numTarjeta) throws Exception;

	public List<ReporteHistorialMaquinariaBean> obtenerDatosReporteHistorialMaquinaria(
			String numTarjeta) throws Exception;
}
