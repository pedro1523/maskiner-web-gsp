package com.maskiner.smc.reportes.dao;

import java.math.BigDecimal;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import com.maskiner.smc.factory.GenericDAOJpa;
import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.bean.ReporteGastosXMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteHistorialMaquinariaBean;
import com.maskiner.smc.reportes.bean.ReporteTecnicosOTBean;
import com.maskiner.smc.reportes.bean.ReporteUtilizacionMaquinariaBean;

public class JPAReportesDAO extends GenericDAOJpa implements ReportesDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(
			String codCliente, String annio) throws Exception {
		//recuperamos los datos necesarios provenientes de la base de datos
		
		EntityManager manager = getEntityManager();
		
		Query q = manager.createNamedQuery("pr_reporteFrecuenciaIncidentes");
		q.setParameter(1, codCliente);
		q.setParameter(2, annio);
		Vector<Object[]> datos = (Vector<Object[]>) q.getResultList();
		
		ArrayList<ReporteFrecuenciaIncidentesBean> resultado = new ArrayList<ReporteFrecuenciaIncidentesBean>();
		
		for(Object[] d: datos){
			
			ReporteFrecuenciaIncidentesBean r = new ReporteFrecuenciaIncidentesBean();
			r.setCodCliente((String) d[0]);
			r.setRazonSocialCliente((String) d[1]);
			r.setAnnio((String) d[2]);
			r.setNumeroTarjeta((String) d[3]);
			r.setDescripMaquinaria((String) d[4]);
			r.setCantidadHidraulicos((Long) d[5]);
			r.setCantidadMecanicos((Long) d[6]);
			r.setCantidadElectricos((Long) d[7]);
			r.setCantidadNeumaticos((Long) d[8]);
			r.setCantidadOtros((Long) d[9]);
			r.setCantidadTotal((Long) d[10]);
			
			resultado.add(r);
		}
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReporteTecnicosOTBean> obtenerDatosReporteTecnicosOT(String codOrdenTrabajo)
			throws Exception {
		
		EntityManager manager = getEntityManager();
		
		Query q = manager.createNamedQuery("pr_reporteTecnicosOT");
		q.setParameter(1, codOrdenTrabajo);
		Vector<Object[]> datos = (Vector<Object[]>) q.getResultList();
		
		ArrayList<ReporteTecnicosOTBean> resultado = new ArrayList<ReporteTecnicosOTBean>();
		
		for(Object[] d: datos){
			
			ReporteTecnicosOTBean r = new ReporteTecnicosOTBean();
			r.setNumOrdenTrabajo((String) d[0]);
			r.setDireccionCliente((String) d[1]);
			r.setRazonSocialCliente((String) d[2]);
			Date fecha = new Date(((java.sql.Date)d[3]).getTime());
			r.setFechaOrdenTrabajo(fecha);
			r.setCodTecnico((String) d[4]);
			r.setNombreTecnico((String) d[5]);
			r.setHoraInicio((Time) d[6]);
			r.setHoraFin((Time) d[7]);
			
			resultado.add(r);
		}
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReporteGastosXMaquinariaBean> obtenerDatosReporteGastosXMaquinaria(
			String numTarjeta, Date fechaInicio, Date fechaFin)
			throws Exception {
		
		EntityManager manager = getEntityManager();

		Query q = manager.createQuery("SELECT r FROM ReporteGastosXMaquinariaBean r WHERE " + 
				"r.numTarjeta = ?1 AND (r.fechaInformeLiquidacion " + 
				"BETWEEN ?2 AND ?3)");
		q.setParameter(1, numTarjeta);
		q.setParameter(2, fechaInicio, TemporalType.DATE);
		q.setParameter(3, fechaFin, TemporalType.DATE);
		
		List<ReporteGastosXMaquinariaBean> datos = q.getResultList();
		
		for(ReporteGastosXMaquinariaBean b: datos){
			b.setFechaInicio(fechaInicio);
			b.setFechaFin(fechaFin);
		}
		
		return datos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReporteUtilizacionMaquinariaBean> obtenerDatosReporteUtilizacionMaquinaria(
			String numTarjeta) throws Exception {
		EntityManager manager = getEntityManager();
		
		Query q = manager.createNamedQuery("pr_reporteUtilizacionMaquinarias");
		q.setParameter(1, numTarjeta);
		Vector<Object[]> datos = (Vector<Object[]>) q.getResultList();
		
		ArrayList<ReporteUtilizacionMaquinariaBean> resultado = new ArrayList<ReporteUtilizacionMaquinariaBean>();
		
		for(Object[] d: datos){
			
			ReporteUtilizacionMaquinariaBean r = new ReporteUtilizacionMaquinariaBean();
			r.setCodCliente((String) d[0]);
			r.setRazonSocialCliente((String) d[1]);
			r.setNumTarjeta((String) d[2]);
			r.setDescripcionMaquinaria((String) d[3]);
			r.setMedicionHorometro((Integer) d[4]);
			Date fecha = new Date(((java.sql.Date)d[5]).getTime());
			r.setFechaUltimaMedicionHorometro(fecha);
			r.setPorcentaje((BigDecimal) d[6]);
			
			resultado.add(r);
		}
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReporteHistorialMaquinariaBean> obtenerDatosReporteHistorialMaquinaria(
			String numTarjeta) throws Exception {

		EntityManager manager = getEntityManager();
		Query q = manager.createQuery("SELECT r FROM ReporteHistorialMaquinariaBean r " +
				"WHERE r.numTarjeta = ?1");
		q.setParameter(1, numTarjeta);
		List<ReporteHistorialMaquinariaBean> resultado =  q.getResultList();
		
		return resultado;
	}



}
