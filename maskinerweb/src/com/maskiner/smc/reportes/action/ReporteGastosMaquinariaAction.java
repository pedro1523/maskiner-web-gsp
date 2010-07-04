package com.maskiner.smc.reportes.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.reportes.bean.ReporteFrecuenciaIncidentesBean;
import com.maskiner.smc.reportes.service.ReportesBusinessDelegate;
import com.maskiner.smc.reportes.service.ReportesServiceI;
import com.opensymphony.xwork2.ActionSupport;

public class ReporteGastosMaquinariaAction extends ActionSupport implements ParameterAware, RequestAware, SessionAware {

	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
	
	private ClienteBean cliente;
	private String      anio;
	
	public String getAnio() {
		return anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public ClienteBean getCliente() {
		return cliente;
	}

	public void setCliente(ClienteBean cliente) {
		this.cliente = cliente;
	}


	public String ListarGastosMaquinarias() throws Exception {
 
		String vista = "exito";
 
		String strmaquinaria = parameters.get("maquinaria")[0];
		String strfec_ini = parameters.get("fechainicio")[0];
		String strfec_fin = parameters.get("fechafin")[0];
		
		String fi=""; 
		String ff=""; 
		
		fi+= strfec_ini.substring(6,10)+"/"+strfec_ini.substring(3,5)+"/"+strfec_ini.substring(0,2);
		ff+=strfec_fin.substring(6,10)+"/"+strfec_fin.substring(3,5)+"/"+strfec_fin.substring(0,2);
		
		

//		InputStream entrada = getServlet()
//				.getServletContext()
//				.getResourceAsStream("/pages/reportes/RGastosMaquinaria.jasper");
//
//		HashMap<String, Object> parametros = new HashMap<String, Object>();
//		parametros.put("num_tar", strmaquinaria);
//		parametros.put("fec_ini", fi);  
//		parametros.put("fec_fin", ff);
//		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
//		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
//		
//
//		ServletOutputStream salida = response.getOutputStream();
//
//		response.setContentType("application/pdf");
//		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
//				MySqlDbConn.obtenerConexion());
 
		
		
		return vista;	
	}

	public String ListarUtilizacionMaquinarias() throws Exception {

		String vista = "exito";

//		String strmaquinaria = request.getParameter("maquinaria");
//
//		InputStream entrada = getServlet().getServletContext()
//				.getResourceAsStream(
//						"/pages/reportes/RUtilizacionMaquinaria.jasper");
//
//		HashMap<String, Object> parametros = new HashMap<String, Object>();
//		parametros.put("num_tar", strmaquinaria);
//		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
//		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
//		
//
//		ServletOutputStream salida = response.getOutputStream();
//
//		response.setContentType("application/pdf");
//		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
//				MySqlDbConn.obtenerConexion());

		return vista;

	}

	public String ListarFrecuenciaIncidentes() throws Exception {

		String vista = "exito";

//		String strcliente = cliente.getStrCodCliente();
//		String stranio = request.getParameter("anio");
//
//		InputStream entrada = getServlet().getServletContext()
//				.getResourceAsStream(
//						"/pages/reportes/RFrecuenciaIncidentes.jasper");
//
//		HashMap<String, Object> parametros = new HashMap<String, Object>();
//		parametros.put("cod_cli", strcliente);
//		parametros.put("anio", stranio);
//		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
//		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
//		
//
//		ServletOutputStream salida = response.getOutputStream();
//
//		response.setContentType("application/pdf");
//		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
//				MySqlDbConn.obtenerConexion());
		
		ReportesServiceI servicio = ReportesBusinessDelegate.getReporteService();
		List<ReporteFrecuenciaIncidentesBean> datos = 
			servicio.obtenerDatosReporteFrecuenciaIncidentes(cliente.getStrCodCliente(), anio);

		//System.out.println(datos.size());
		return vista;

	}

	public String ListarHistorialMaquinaria() throws Exception {

		String vista = "exito";

//		String strmaquinaria = request.getParameter("maquinaria");
//
//		InputStream entrada = getServlet().getServletContext()
//				.getResourceAsStream(
//						"/pages/reportes/RHistorialAtencion.jasper");
//
//		HashMap<String, Object> parametros = new HashMap<String, Object>();
//		parametros.put("num_tar", strmaquinaria);
//		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
//		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
//		
//
//		ServletOutputStream salida = response.getOutputStream();
//
//		response.setContentType("application/pdf");
//		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
//				MySqlDbConn.obtenerConexion());

		return vista;

	}
	
	public String ListarTecnicosOT() throws Exception {
 
		String vista = "exito";
 		
//		String strOt=request.getParameter("ot");
//		String strfec_ini = request.getParameter("fechainicio");
//		String strfec_fin = request.getParameter("fechafin");
//		
//		String fi=""; 
//		String ff=""; 
//		
//		fi+= strfec_ini.substring(6,10)+"/"+strfec_ini.substring(3,5)+"/"+strfec_ini.substring(0,2);
//		ff+=strfec_fin.substring(6,10)+"/"+strfec_fin.substring(3,5)+"/"+strfec_fin.substring(0,2);
//		
//		
//
//		InputStream entrada = getServlet()
//				.getServletContext()
//				.getResourceAsStream("/pages/reportes/RTecnicosOT.jasper");
//
//		HashMap<String, Object> parametros = new HashMap<String, Object>();
//		parametros.put("ot", strOt);
//		parametros.put("fec_ini", fi);  
//		parametros.put("fec_fin", ff);
//		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
//		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
//		
//
//		ServletOutputStream salida = response.getOutputStream();
//
//		response.setContentType("application/pdf");
//		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
//				MySqlDbConn.obtenerConexion());
 		
		return vista;	
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	

}
