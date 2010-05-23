package com.maskiner.smc.reportes.action;

import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperRunManager;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import com.maskiner.smc.mylib.MySqlDbConn;

public class ReporteGastosMaquinariaAction extends MappingDispatchAction {

	public ActionForward ListarGastosMaquinarias(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
 
		String vista = "exito";
 
		String strmaquinaria = request.getParameter("maquinaria");
		String strfec_ini = request.getParameter("fechainicio");
		String strfec_fin = request.getParameter("fechafin");
		
		String fi=""; 
		String ff=""; 
		
		fi+= strfec_ini.substring(6,10)+"/"+strfec_ini.substring(3,5)+"/"+strfec_ini.substring(0,2);
		ff+=strfec_fin.substring(6,10)+"/"+strfec_fin.substring(3,5)+"/"+strfec_fin.substring(0,2);
		
		

		InputStream entrada = getServlet()
				.getServletContext()
				.getResourceAsStream("/pages/reportes/RGastosMaquinaria.jasper");

		HashMap<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("num_tar", strmaquinaria);
		parametros.put("fec_ini", fi);  
		parametros.put("fec_fin", ff);
		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
		

		ServletOutputStream salida = response.getOutputStream();

		response.setContentType("application/pdf");
		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
				MySqlDbConn.obtenerConexion());
 
		
		
		return mapping.findForward(vista);	
	}

	public ActionForward ListarUtilizacionMaquinarias(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String vista = "exito";

		String strmaquinaria = request.getParameter("maquinaria");

		InputStream entrada = getServlet().getServletContext()
				.getResourceAsStream(
						"/pages/reportes/RUtilizacionMaquinaria.jasper");

		HashMap<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("num_tar", strmaquinaria);
		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
		

		ServletOutputStream salida = response.getOutputStream();

		response.setContentType("application/pdf");
		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
				MySqlDbConn.obtenerConexion());

		return mapping.findForward(vista);

	}

	
	
	public ActionForward ListarFrecuenciaIncidentes(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String vista = "exito";

		String strcliente = request.getParameter("cliente");
		String stranio = request.getParameter("anio");

		InputStream entrada = getServlet().getServletContext()
				.getResourceAsStream(
						"/pages/reportes/RFrecuenciaIncidentes.jasper");

		HashMap<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("cod_cli", strcliente);
		parametros.put("anio", stranio);
		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
		

		ServletOutputStream salida = response.getOutputStream();

		response.setContentType("application/pdf");
		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
				MySqlDbConn.obtenerConexion());

		return mapping.findForward(vista);

	}

	public ActionForward ListarHistorialMaquinaria(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String vista = "exito";

		String strmaquinaria = request.getParameter("maquinaria");

		InputStream entrada = getServlet().getServletContext()
				.getResourceAsStream(
						"/pages/reportes/RHistorialAtencion.jasper");

		HashMap<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("num_tar", strmaquinaria);
		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
		

		ServletOutputStream salida = response.getOutputStream();

		response.setContentType("application/pdf");
		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
				MySqlDbConn.obtenerConexion());

		return mapping.findForward(vista);

	}
	
	public ActionForward ListarTecnicosOT(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
 
		String vista = "exito";
 		
		String strOt=request.getParameter("ot");
		String strfec_ini = request.getParameter("fechainicio");
		String strfec_fin = request.getParameter("fechafin");
		
		String fi=""; 
		String ff=""; 
		
		fi+= strfec_ini.substring(6,10)+"/"+strfec_ini.substring(3,5)+"/"+strfec_ini.substring(0,2);
		ff+=strfec_fin.substring(6,10)+"/"+strfec_fin.substring(3,5)+"/"+strfec_fin.substring(0,2);
		
		

		InputStream entrada = getServlet()
				.getServletContext()
				.getResourceAsStream("/pages/reportes/RTecnicosOT.jasper");

		HashMap<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("ot", strOt);
		parametros.put("fec_ini", fi);  
		parametros.put("fec_fin", ff);
		parametros.put("img_cen",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskiner.png"));
		parametros.put("img_cab",getServlet().getServletContext().getResourceAsStream("/pages/reportes/logomaskinerletras.png"));
		

		ServletOutputStream salida = response.getOutputStream();

		response.setContentType("application/pdf");
		JasperRunManager.runReportToPdfStream(entrada, salida, parametros,
				MySqlDbConn.obtenerConexion());
 		
		return mapping.findForward(vista);	
	}
	

}
