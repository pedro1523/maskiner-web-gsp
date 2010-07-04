package com.maskiner.smc.reportes.dao;

import java.util.List;

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
		
		List<ReporteFrecuenciaIncidentesBean> resultado = q.getResultList();
		
		return resultado;
	}


}
