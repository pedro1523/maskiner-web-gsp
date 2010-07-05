package com.maskiner.smc.reportes.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.maskiner.smc.factory.GenericDAOJpa;
import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;

public class JPAReportesDAO extends GenericDAOJpa implements ReportesDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<ReporteFrecuenciaIncidentesBean> obtenerDatosReporteFrecuenciaIncidentes(
			String codCliente, String annio) throws Exception {
		//recuperamos los datos necesarios provenientes de la base de datos
		
		EntityManager manager = getEntityManager();
		
		Query q = manager.createNamedQuery("pr_reporteFrecuenciaIncidentes");
		q.setParameter("cod_cli", codCliente);
		q.setParameter("annio", annio);
		
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


}
