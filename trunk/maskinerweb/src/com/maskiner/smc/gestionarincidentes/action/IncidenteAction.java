package com.maskiner.smc.gestionarincidentes.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

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

public class IncidenteAction implements RequestAware, SessionAware, ParameterAware {
	
	// variables privadas
	private String formOrigen;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
		
	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}

	public String cargarNuevoIncidente() throws Exception {

		IncidenteServiceI servicio2 = IncidenteBusinessDelegate.getIncidenteService();

		ArrayList<TablaDeTablasBean> arr2;
		arr2 = servicio2.listarTipoDeAverias();
		session.put("averias", arr2);
			
		//limpia las variables
		session.remove("CodigoCliente");
		session.remove("codSucursal");
		session.remove("Detalle");
		session.remove("id");
		session.remove("maquinarias");
		session.remove("id");
		session.remove("cliente");
		
		return "exito";
	}

	@SuppressWarnings("unchecked")
	public String registrarIncidente() throws Exception {

		UsuarioBean usu = (UsuarioBean) session.get("usuariologueado");
		ArrayList<DetalleRegistroIncidenteBean> detalle = 
			(ArrayList<DetalleRegistroIncidenteBean>) session.get("Detalle");
		
		if (detalle==null)detalle= new ArrayList<DetalleRegistroIncidenteBean>();
		
		if(detalle.size()==0){
			
			ActionContext.getContext().getValueStack().set("mensajeerror1", "Primero debe agregar una incidencia");
			
			return "fracaso";
		}else{
		
		RegistroIncidentesBean regIncidente = new RegistroIncidentesBean();
		//Aqui se harán Cambios KLM
		regIncidente.setStrCodigoCliente((String) session.get("CodigoCliente"));
		regIncidente.setStrCodigoRegistrador(usu.getCodigoUsuario());
		regIncidente.setStrSucursal((String) session.get("codSucursal"));
		regIncidente.setIntEstadoIncidente(1);

		IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();

		session.put("id", servicio.RegistrarIncidenteYDetalle(regIncidente, detalle));

		return "exito";
		}
	}

	@SuppressWarnings("unchecked")
	public String AgregarALista() throws Exception {
		
		/*
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
			return "fracaso";
		}else if(request.getParameter("cboNatAveria").equals("-1")){
			request.setAttribute("mensajeerror", "Debe seleccionar una maturaleza de avería");
			return "fracaso";
		}else if(request.getParameter("Descripcion").equals("")){
				request.setAttribute("mensajeerror", "Debe ingresar la descripción de la avería");
				return "fracaso";
		}else{
		
		
		detalle.setStrNumeroTarjetaEquipo(request.getParameter("chk"));
		detalle.setIntNumeroItem(Detalles.size());

		Detalles.add(detalle);
		
		sesion.setAttribute("Detalle", Detalles);
		return "exito";
		}
		*/	
		return null;
	}

	public String quitarIncidenteDeLista() throws Exception {
		/*
		HttpSession sesion = request.getSession();
		ArrayList<DetalleRegistroIncidenteBean> Detalles = new ArrayList<DetalleRegistroIncidenteBean>();

		Detalles = (ArrayList<DetalleRegistroIncidenteBean>) sesion.getAttribute("Detalle");

		int fila = new Integer(request.getParameter("numFila").toString());

		for (int i = 0; i < Detalles.size(); i++) {
			if (Detalles.get(i).getIntNumeroItem() == fila) {
				Detalles.remove(i);
			}
		}

		sesion.setAttribute("Detalle", Detalles);
		return "exito";
		*/
		return null;
	}

	public String buscarMaquinarias() throws Exception {
		/*
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

		return "exito";
		*/
		return null;
	}

	public String buscarIncidenteLiquidacion() throws Exception {
		/*
		HttpSession sesion = request.getSession();
		sesion.setAttribute("incidente", null);
		sesion.setAttribute("maquinarias", null);
		sesion.setAttribute("Detalle",null);
		return "exito";
		*/
		return null;
	}

	public String devolver() throws Exception {
		/*
		HttpSession sesion = request.getSession();
		IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();
		ArrayList<TablaDeTablasBean> arr = servicio.listarTipoDeAverias();
		sesion.setAttribute("averias", arr);
		return "exito";
		*/
		return null;
	}

	/* METODOS DE CLAUDIO */

	public String cargarBuscarIncidentes() throws Exception {
		String exito = "";
		// recuperar el valor ingresado por el usuario en codIncidente
		String codIncidente = parameters.get("numIncidente")[0].trim();

		if (codIncidente.equals("")) {
			exito = "exito1";
		} else {
			// verificamos que el formato es el adecuado
			Pattern patron = Pattern.compile("^(IN)?\\d{1,4}$");
			boolean encontrado = patron.matcher(codIncidente).find();
			//System.out.println(encontrado);
			if (encontrado) {
				if (!codIncidente.startsWith("IN")) {
					// damos el formato adecuado
					codIncidente = "0000" + codIncidente;
					codIncidente = "IN"
							+ codIncidente.substring(codIncidente.length() - 4);
				}
				// buscar si este código devuelve un incidente
				IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();
				RegistroIncidentesBean incidente = servicio.obtenerIncidente(codIncidente);
				if (incidente == null) {
					exito = "exito1";
				} else {
					exito = "exito2";
					session.put("b_incidente", incidente);
				}
			}
		}
		return exito;
	}

	public String buscarIncidentes() throws Exception {
		
		String strEmpresa = parameters.get("nombreEmpresa")[0].trim();
		String strFechaIncid = parameters.get("fechaIncidente")[0].trim();
		String strIncidente = parameters.get("incidente")[0].trim();
		
		if(formOrigen.equals("RegistrarLiquidacion")){
						
			Date dtFechaIncid = null;
			
			if(!strFechaIncid.equals("")){
				if(FormatoFecha.isFecha(strFechaIncid)){
					dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
				}
			}
			
			IncidenteServiceI isServicio = IncidenteBusinessDelegate.getIncidenteService();
			
			List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentesParaLiquidacion(strEmpresa, dtFechaIncid, strIncidente);
			request.put("arr_incidentes", lstArr);
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
			request.put("arr_incidentes", lstArr);
		}
		return "exito";
	}

	public String irAPaginaOrigen() throws Exception {
		
		if (formOrigen.equals("generarOTInspec")) {
			return "exito1";
		} else {
			return "exito2";
		}
	}

	public String buscarIncidentesDevolverResultado() throws Exception {
		
		String numIncidente = parameters.get("numIncidente")[0];
		
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
		
		if (formOrigen.equals("generarOTInspec")) {
			// obtiene el bean BeanRegistroIncidentes seleccionado
			
			IncidenteServiceI servicio = IncidenteBusinessDelegate
					.getIncidenteService();

			RegistroIncidentesBean reg = servicio
					.obtenerIncidenteInspeccion(numIncidente);

			ClienteBean cliente = servicio
					.obtenerClientePorIncidente(numIncidente);
			session.put("b_cliente", cliente);
			session.put("b_incidente", reg);
			

			return "exito1";
		}else if(formOrigen.equals("RegistrarLiquidacion")){
			
			IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();
			
			RegistroIncidentesBean reg = servicio.obtenerIncidenteParaLiquidacion(numIncidente);
			
			session.put("incidente", reg);
			
			return "exito3";
		} 
		else {
			IncidenteServiceI servicio = IncidenteBusinessDelegate
					.getIncidenteService();

			RegistroIncidentesBean reg = servicio
					.obtenerIncidente(numIncidente);

			ClienteBean cliente = servicio
					.obtenerClientePorIncidente(numIncidente);

			session.put("b_incidente", reg);
			session.put("b_cliente", cliente);
			return "exito2";
		}
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}


	/* FIN METODOS CLAUDIO */
	
}
