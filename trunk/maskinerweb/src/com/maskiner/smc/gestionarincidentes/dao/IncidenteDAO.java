package com.maskiner.smc.gestionarincidentes.dao;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;

public interface IncidenteDAO {
	
	public List<RegistroIncidentesBean> buscarIncidentes(String nombreEmpresa, Date fechaIncidente, String descripcionIncidente) throws Exception; 
	public List<RegistroIncidentesBean> buscarIncidentesOTI(String nombreEmpresa, Date fechaIncidente, String descripcionIncidente) throws Exception; 

	public RegistroIncidentesBean obtenerIncidente(String numIncidente) throws Exception;

	public ArrayList<TablaDeTablasBean> listarTipoDeAverias() throws Exception;
	
	public String RegistrarIncidenteYDetalle(RegistroIncidentesBean bean,ArrayList<DetalleRegistroIncidenteBean> det) throws Exception;
	
	public List<RegistroIncidentesBean> buscarIncidentesParaLiquidacion(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception;
	
	public RegistroIncidentesBean obtenerIncidenteParaLiquidacion(String numIncidente) throws Exception;
	
	public ClienteBean obtenerClientePorIncidente(String numIncidente)	throws Exception;
	
	public RegistroIncidentesBean obtenerIncidenteInspeccion(String numIncidente)throws Exception;
	public RegistroIncidentesBean obtenerIncidenteInspeccionOTI(String numIncidente)throws Exception;
	
}
