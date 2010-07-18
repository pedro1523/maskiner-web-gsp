package com.maskiner.smc.reportes.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.bean.ReporteGastosXMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteHistorialMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteTecnicosOTBean;
import com.maskiner.smc.reportes.bean.ReporteUtilizacionMaquinariaBean;
import com.maskiner.smc.reportes.service.ReportesBusinessDelegate;
import com.maskiner.smc.reportes.service.ReportesServiceI;
import com.opensymphony.xwork2.ActionSupport;

public class ReportesAction extends ActionSupport {

	private String codCliente;
	private String numOrdenTrabajo;
	private String numTarjeta;
	private Date fechaInicio;
	private Date fechaFin;
	private Integer anio;
	private List<ReporteFrecuenciaIncidentesBean> arrRepFrecIncBean;
	private List<ReporteTecnicosOTBean> arrRepTecOTBean;
	private List<ReporteGastosXMaquinariaBean> arrRepGastosMaquinaria;
	private List<ReporteUtilizacionMaquinariaBean> arrUtilizacionMaquinaria;
	private List<ReporteHistorialMaquinariaBean> arrHistorialMaquinaria;
	
	public String getNumTarjeta() {
		return numTarjeta;
	}

	public void setNumTarjeta(String numTarjeta) {
		this.numTarjeta = numTarjeta;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getNumOrdenTrabajo() {
		return numOrdenTrabajo;
	}

	public void setNumOrdenTrabajo(String numOrdenTrabajo) {
		this.numOrdenTrabajo = numOrdenTrabajo;
	}

	public List<ReporteTecnicosOTBean> getArrRepTecOTBean() {
		return arrRepTecOTBean;
	}

	public void setArrRepTecOTBean(List<ReporteTecnicosOTBean> arrRepTecOTBean) {
		this.arrRepTecOTBean = arrRepTecOTBean;
	}

	public Integer getAnio() {
		return anio;
	}

	public void setAnio(Integer anio) {
		this.anio = anio;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public List<ReporteFrecuenciaIncidentesBean> getArrRepFrecIncBean() {
		return arrRepFrecIncBean;
	}

	public void setArrRepFrecIncBean(
			List<ReporteFrecuenciaIncidentesBean> arrRepFrecIncBean) {
		this.arrRepFrecIncBean = arrRepFrecIncBean;
	}

	public List<ReporteGastosXMaquinariaBean> getArrRepGastosMaquinaria() {
		return arrRepGastosMaquinaria;
	}

	public void setArrRepGastosMaquinaria(
			List<ReporteGastosXMaquinariaBean> arrRepGastosMaquinaria) {
		this.arrRepGastosMaquinaria = arrRepGastosMaquinaria;
	}
	
	public List<ReporteUtilizacionMaquinariaBean> getArrUtilizacionMaquinaria() {
		return arrUtilizacionMaquinaria;
	}

	public void setArrUtilizacionMaquinaria(
			List<ReporteUtilizacionMaquinariaBean> arrUtilizacionMaquinaria) {
		this.arrUtilizacionMaquinaria = arrUtilizacionMaquinaria;
	}

	public List<ReporteHistorialMaquinariaBean> getArrHistorialMaquinaria() {
		return arrHistorialMaquinaria;
	}

	public void setArrHistorialMaquinaria(
			List<ReporteHistorialMaquinariaBean> arrHistorialMaquinaria) {
		this.arrHistorialMaquinaria = arrHistorialMaquinaria;
	}

	public String listarGastosXMaquinaria() throws Exception {
 
		String vista = "exito";
 
		ReportesServiceI servicio = ReportesBusinessDelegate.getReporteService();
		
		arrRepGastosMaquinaria = servicio.obtenerDatosReporteGastosXMaquinaria(numTarjeta, fechaInicio, fechaFin);
		
		return vista;	
	}

	public String listarUtilizacionMaquinaria() throws Exception {

		String vista = "exito";

		ReportesServiceI servicio = ReportesBusinessDelegate.getReporteService();
		
		arrUtilizacionMaquinaria = servicio.obtenerDatosReporteUtilizacionMaquinaria(numTarjeta);

		return vista;

	}

	public String listarFrecuenciaIncidentes() throws Exception {

		String vista = "exito";

		ReportesServiceI servicio = ReportesBusinessDelegate.getReporteService();
		arrRepFrecIncBean = 
			servicio.obtenerDatosReporteFrecuenciaIncidentes(codCliente, anio.toString());
		
		return vista;

	}

	public String listarHistorialMaquinaria() throws Exception {

		String vista = "exito";

		ReportesServiceI servicio = ReportesBusinessDelegate.getReporteService();
		
		arrHistorialMaquinaria = servicio.obtenerDatosReporteHistorialMaquinaria(numTarjeta);

		return vista;

	}
	
	public String listarTecnicosOT() throws Exception {
 
		String vista = "exito";
		
		ReportesServiceI servicio = ReportesBusinessDelegate.getReporteService();
		arrRepTecOTBean = servicio.obtenerDatosReporteTecnicosOT(numOrdenTrabajo);
 		
		return vista;	
	}


}
