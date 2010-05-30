package com.maskiner.smc.gestionarincidentes.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.gestionarincidentes.service.IncidenteBusinessDelegate;
import com.maskiner.smc.gestionarincidentes.service.IncidenteServiceI;
import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasI;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IncidenteAction extends ActionSupport implements ServletRequestAware {
	
	private HttpServletRequest request;

	public String cargarNuevoIncidente() throws Exception {

		Map<String, Object> sesion = ActionContext.getContext().getSession();

		IncidenteServiceI servicio2 = IncidenteBusinessDelegate.getIncidenteService();

		ArrayList<TablaDeTablasBean> arr2;
		arr2 = servicio2.listarTipoDeAverias();
		sesion.put("averias", arr2);
			
		//limpia las variables
		sesion.remove("CodigoCliente");
		sesion.remove("codSucursal");
		sesion.remove("Detalle");
		sesion.remove("id");
		sesion.remove("maquinarias");
		sesion.remove("id");
		sesion.remove("cliente");
		
		return "exito";
	}

	public String registrarIncidente() throws Exception {

		Map<String, Object> sesion = ActionContext.getContext().getSession();
		
		UsuarioBean usu = (UsuarioBean) sesion.get("usuariologueado");
		ArrayList<DetalleRegistroIncidenteBean> detalle = 
			(ArrayList<DetalleRegistroIncidenteBean>) sesion.get("Detalle");
		
		if (detalle==null)detalle= new ArrayList<DetalleRegistroIncidenteBean>();
		
		if(detalle.size()==0){
						
			request.setAttribute("mensajeerror1", "Primero debe agregar una incidencia");
			return mapping.findForward("fracaso");
		}else{
		
		RegistroIncidentesBean regIncidente = new RegistroIncidentesBean();

		regIncidente.setStrCodigoCliente((String) sesion.getAttribute("CodigoCliente"));
		regIncidente.setStrCodigoRegistrador(usu.getCodigoUsuario());
		regIncidente.setStrSucursal((String) sesion.getAttribute("codSucursal"));
		regIncidente.setIntEstadoIncidente(1);



		IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();

		sesion.setAttribute("id", servicio.RegistrarIncidenteYDetalle(regIncidente, detalle));

		return mapping.findForward("exito");
		}
	}

	@SuppressWarnings("unchecked")
	public ActionForward AgregarALista(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession sesion = request.getSession();
		ArrayList<DetalleRegistroIncidenteBean> Detalles = new ArrayList<DetalleRegistroIncidenteBean>();
		if (sesion.getAttribute("Detalle") == null) {
			Detalles = (ArrayList<DetalleRegistroIncidenteBean>) sesion.getAttribute("DetalleIni");
		} else {
			Detalles = (ArrayList<DetalleRegistroIncidenteBean>) sesion.getAttribute("Detalle");
		}


		DetalleRegistroIncidenteBean detalle = new DetalleRegistroIncidenteBean();
		
		detalle.setStrNumeroTarjetaEquipo(request.getParameter("chk"));
		detalle.setIntNaturalezaAveria(Integer.parseInt(request.getParameter("cboNatAveria")));
		detalle.setStrDescripcionNaturalezaAveria(request.getParameter("Descripcion"));
		
		if (request.getParameter("chk")==null){
			request.setAttribute("mensajeerror", "Primero debe seleccionar alguna maquinaria");
			return mapping.findForward("fracaso");
		}else if(request.getParameter("cboNatAveria").equals("-1")){
			request.setAttribute("mensajeerror", "Debe seleccionar una maturaleza de avería");
			return mapping.findForward("fracaso");
		}else if(request.getParameter("Descripcion").equals("")){
				request.setAttribute("mensajeerror", "Debe ingresar la descripción de la avería");
				return mapping.findForward("fracaso");
		}else{
		
		
		detalle.setStrNumeroTarjetaEquipo(request.getParameter("chk"));
		detalle.setIntNumeroItem(Detalles.size());

		Detalles.add(detalle);
		
		sesion.setAttribute("Detalle", Detalles);
		return mapping.findForward("exito");
		}
	}

	public ActionForward quitarIncidenteDeLista(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession sesion = request.getSession();
		ArrayList<DetalleRegistroIncidenteBean> Detalles = new ArrayList<DetalleRegistroIncidenteBean>();

		Detalles = (ArrayList<DetalleRegistroIncidenteBean>) sesion
				.getAttribute("Detalle");

		int fila = new Integer(request.getParameter("numFila").toString());

		for (int i = 0; i < Detalles.size(); i++) {
			if (Detalles.get(i).getIntNumeroItem() == fila) {
				Detalles.remove(i);
			}
		}

		sesion.setAttribute("Detalle", Detalles);
		return mapping.findForward("exito");
	}

	public ActionForward buscarMaquinarias(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession sesion = request.getSession();
		String codCliente = request.getParameter("CodCliente");
		String codSucursal = request.getParameter("Sucursal");

		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate
				.getMaestroMaquinariasService();

		ArrayList<MaquinariaSucursalBean> arr = servicio
				.buscarMaquinariaXSucursal(codCliente, codSucursal);

		sesion.setAttribute("maquinarias", arr);
		sesion.setAttribute("codSucursal", codSucursal);
		sesion.setAttribute("CodigoCliente", request.getParameter("CodCliente"));

		return mapping.findForward("exito");
	}

	public ActionForward buscarIncidenteLiquidacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession sesion = request.getSession();
		sesion.setAttribute("incidente", null);
		sesion.setAttribute("maquinarias", null);
		sesion.setAttribute("Detalle",null);
		return mapping.findForward("exito");
	}

	public ActionForward devolver(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession sesion = request.getSession();

		IncidenteServiceI servicio = IncidenteBusinessDelegate
				.getIncidenteService();

		ArrayList<TablaDeTablasBean> arr = servicio.listarTipoDeAverias();

		sesion.setAttribute("averias", arr);

		return mapping.findForward("exito");
	}

	/* METODOS DE CLAUDIO */

	public ActionForward cargarBuscarIncidentes(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String exito = "";
		// recuperar el valor ingresado por el usuario en codIncidente
		String codIncidente = request.getParameter("numIncidente").trim();

		if (codIncidente.equals("")) {
			exito = "exito1";
		} else {
			// verificamos que el formato es el adecuado
			Pattern patron = Pattern.compile("^(IN)?\\d{1,4}$");
			boolean encontrado = patron.matcher(codIncidente).find();
			System.out.println(encontrado);
			if (encontrado) {
				if (!codIncidente.startsWith("IN")) {
					// damos el formato adecuado
					codIncidente = "0000" + codIncidente;
					codIncidente = "IN"
							+ codIncidente.substring(codIncidente.length() - 4);
				}
				// buscar si este código devuelve un incidente
				IncidenteServiceI servicio = IncidenteBusinessDelegate
						.getIncidenteService();
				RegistroIncidentesBean incidente = servicio
						.obtenerIncidente(codIncidente);
				if (incidente == null) {
					exito = "exito1";
					mapping.findForward("exito1");
				} else {
					exito = "exito2";
					request.getSession().setAttribute("b_incidente", incidente);
				}

			}
		}
		return mapping.findForward(exito);
	}

	public ActionForward buscarIncidentes(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strFormOrigen = request.getParameter("formOrigen");
		String strEmpresa = request.getParameter("nombreEmpresa").trim();
		String strFechaIncid = request.getParameter("fechaIncidente").trim();
		String strIncidente = request.getParameter("incidente").trim();
		
		if(strFormOrigen.equals("RegistrarLiquidacion")){
						
			Date dtFechaIncid = null;
			
			if(!strFechaIncid.equals("")){
				if(FormatoFecha.isFecha(strFechaIncid)){
					dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
				}
			}
			
			IncidenteServiceI isServicio = IncidenteBusinessDelegate.getIncidenteService();
			
			List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentesParaLiquidacion(strEmpresa, dtFechaIncid, strIncidente);
			request.setAttribute("formOrigen", strFormOrigen);
			request.setAttribute("arr_incidentes", lstArr);
		}
		else{
			Date dtFechaIncid = null;
			
			if(!strFechaIncid.equals("")){
				if(FormatoFecha.isFecha(strFechaIncid)){
					dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
				}
			}
			
			IncidenteServiceI isServicio = IncidenteBusinessDelegate.getIncidenteService();
			
			List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentes(strEmpresa, dtFechaIncid, strIncidente);
			request.setAttribute("formOrigen", strFormOrigen);
			request.setAttribute("arr_incidentes", lstArr);
		}
		return mapping.findForward("exito");
	}

	public ActionForward irAPaginaOrigen(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strPaginaOrigen = request.getParameter("formOrigen");

		if (strPaginaOrigen.equals("generarOTInspec")) {
			return mapping.findForward("exito1");
		} else {
			return mapping.findForward("exito2");
		}
	}

	public ActionForward buscarIncidentesDevolverResultado(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession sesion = request.getSession();
		
		String paginaOrigen = request.getParameter("formOrigen");
		String numIncidente = request.getParameter("numIncidente");

		/*
		 * obtiene el bean BeanRegistroIncidentes seleccionado
		 * 
		 * IncidenteServiceI servicio =
		 * IncidenteBusinessDelegate.getIncidenteService();
		 * 
		 * RegistroIncidentesBean reg = servicio.obtenerIncidente(numIncidente);
		 * 
		 * =================CHRISTIAN======================== ClienteBean
		 * cliente=servicio.obtenerClientePorIncidente(numIncidente);
		 * request.getSession().setAttribute("b_cliente", cliente);
		 * ==========================================
		 */

		if (paginaOrigen.equals("generarOTInspec")) {
			// obtiene el bean BeanRegistroIncidentes seleccionado
			
			IncidenteServiceI servicio = IncidenteBusinessDelegate
					.getIncidenteService();

			RegistroIncidentesBean reg = servicio
					.obtenerIncidenteInspeccion(numIncidente);

			ClienteBean cliente = servicio
					.obtenerClientePorIncidente(numIncidente);
			request.getSession().setAttribute("b_cliente", cliente);
			request.getSession().setAttribute("b_incidente", reg);
			

			return mapping.findForward("exito1");
		}else if(paginaOrigen.equals("RegistrarLiquidacion")){
			
			IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();
			
			RegistroIncidentesBean reg = servicio.obtenerIncidenteParaLiquidacion(numIncidente);
			
			request.getSession().setAttribute("incidente", reg);
			
			return mapping.findForward("exito3");
		} 
		else {
			IncidenteServiceI servicio = IncidenteBusinessDelegate
					.getIncidenteService();

			RegistroIncidentesBean reg = servicio
					.obtenerIncidente(numIncidente);

			ClienteBean cliente = servicio
					.obtenerClientePorIncidente(numIncidente);

			request.getSession().setAttribute("b_incidente", reg);
			request.getSession().setAttribute("b_cliente", cliente);
			return mapping.findForward("exito2");
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.request=req;
	}

	/* FIN METODOS CLAUDIO */

}
