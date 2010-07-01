package com.maskiner.smc.gestionarincidentes.action;

import java.util.ArrayList;
import java.util.Date;
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
import com.maskiner.smc.maestroclientes.bean.SucursalBean;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasBusinessDelegate;
import com.maskiner.smc.maestromaquinarias.service.MaestroMaquinariasI;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IncidenteAction extends  ActionSupport  implements RequestAware, SessionAware, ParameterAware {
	
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
		session.put("Detalle", null);
		IncidenteServiceI servicio2 = IncidenteBusinessDelegate.getIncidenteService();
		
		ClienteBean cliente = new ClienteBean();
		ArrayList<SucursalBean> arrSucursalBean = new ArrayList<SucursalBean>();
		cliente.setArrSucursalBean(arrSucursalBean);
		
		session.put("cliente", cliente);
		session.put("arrSucursalBean", arrSucursalBean);
		//ultima prueba del día
		ArrayList<TablaDeTablasBean> arr2;
		arr2 = servicio2.listarTipoDeAverias();
		session.put("averia", arr2);
			
		//limpia las variables
		/*session.remove("CodigoCliente");
		session.remove("codSucursal");
		session.remove("Detalle");
		session.remove("id");
		session.remove("maquinarias");
		session.remove("id");
		session.remove("cliente");*/
		
		return "exito";
	}

	@SuppressWarnings("unchecked")
	public String registrarIncidente() throws Exception {

UsuarioBean usu = (UsuarioBean) session.get("usuariologueado");
		
		ArrayList<DetalleRegistroIncidenteBean> detalle = 
			(ArrayList<DetalleRegistroIncidenteBean>) session.get("Detalle");
		
		if (detalle==null)detalle= new ArrayList<DetalleRegistroIncidenteBean>();
		
		if(detalle.size()==0){
			request.put("mensajeerror1",getText("pages.gestionarincidentes.regincidentes.mensajeErrorAgregarIncidencia"));
			return "fracaso";
		}else{
		
		RegistroIncidentesBean regIncidente = new RegistroIncidentesBean();
		
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
		
System.out.println("a ver...");
		
		String numTarjetaEq = parameters.get("chk")[0];
		String naturalezaAveria = parameters.get("cboNatAveria")[0];
		String descripcionNatAveria = parameters.get("Descripcion")[0];
		
		ArrayList<DetalleRegistroIncidenteBean> Detalles =
			new ArrayList<DetalleRegistroIncidenteBean>();
		if(session.get("Detalle")==null){
			Detalles=(ArrayList<DetalleRegistroIncidenteBean>) session.get("DetalleIni");
		}
			else{
				Detalles=(ArrayList<DetalleRegistroIncidenteBean>) session.get("Detalle");
			}
		
		DetalleRegistroIncidenteBean detalle = new DetalleRegistroIncidenteBean();
		detalle.setStrNumeroTarjetaEquipo(numTarjetaEq);
		detalle.setIntNaturalezaAveria(Integer.parseInt(naturalezaAveria));
		detalle.setStrDescripcionNaturalezaAveria(descripcionNatAveria);
		
		if(numTarjetaEq==null){
			request.put("mensajeerror1",getText("pages.gestionarincidentes.regincidentes.mensajeError1"));
			return "fracaso";
		}else if(naturalezaAveria.equals("-1")){
			request.put("mensajeerror1",getText("pages.gestionarincidentes.regincidentes.mensajeError2"));
			return "fracaso";
		}else if(descripcionNatAveria.length()<1){
			request.put("mensajeerror1",getText("pages.gestionarincidentes.regincidentes.mensajeError3"));
			return "fracaso";
		}else{
			detalle.setStrNumeroTarjetaEquipo(numTarjetaEq);
			detalle.setIntNumeroItem(Detalles.size());

			Detalles.add(detalle);
			
			session.put("Detalle", Detalles);
			return "exito";
		}		
	}

	public String quitarIncidenteDeLista() throws Exception {
		String strNumTarjeta = parameters.get("numFila")[0];
		//int strNumTarjeta= new Integer(parameters.get("numFila").toString());
		ArrayList<DetalleRegistroIncidenteBean> Detalles = new ArrayList<DetalleRegistroIncidenteBean>();
		Detalles = (ArrayList<DetalleRegistroIncidenteBean>) session.get("Detalle");

		for (int i = 0; i < Detalles.size(); i++) {
			if (Detalles.get(i).getStrNumeroTarjetaEquipo() == strNumTarjeta) {
				Detalles.remove(i);
			}
		}
				session.put("Detalle", Detalles);
		
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
		return "exito";
	}

	public String buscarMaquinarias() throws Exception {
		ClienteBean c = (ClienteBean) session.get("cliente");
		String codCliente = c.getStrCodCliente();
		String codSucursal = parameters.get("Sucursal")[0].toString();//(String) request.get("Sucursal");
		System.out.println(codCliente);
		System.out.println(codSucursal);
		MaestroMaquinariasI servicio = MaestroMaquinariasBusinessDelegate
		.getMaestroMaquinariasService();
		
		ArrayList<MaquinariaSucursalBean> arr = servicio
		.buscarMaquinariaXSucursal(codCliente, codSucursal);
		
		session.put("arr_maquinarias", arr);
		
		return "exito";
		}
	public String cargarBuscarIncidenteLiquidacion() throws Exception {
		java.sql.Date dtFechaIncid = null;
		IncidenteServiceI isServicio = IncidenteBusinessDelegate.getIncidenteService();
		List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentesParaLiquidacion("",dtFechaIncid, "");
		request.put("arr_incidentes", lstArr);
		session.remove("incidente");
		session.remove("maquinarias");
		session.remove("Detalle");
		return "exito";
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
			} else
				exito = "exito1";
		}
		return exito;
	}

	
	public String buscarIncidentes() throws Exception {
		
		String strEmpresa = parameters.get("nombreEmpresa")[0].trim();
		String strFechaIncid = parameters.get("fechaIncidente")[0].trim();
		String strIncidente = parameters.get("incidente")[0].trim();
		
		System.out.println("FORMULARIO DE ORIGEN---> " + formOrigen);
		
		if(formOrigen.equals("RegistrarLiquidacion")){
						
			Date dtFechaIncid = null;
			
			if(!strFechaIncid.equals("")){
				if(FormatoFecha.isFecha(strFechaIncid)){
					dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
				}
			}
			
			IncidenteServiceI isServicio = IncidenteBusinessDelegate.getIncidenteService();
			
			List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentesParaLiquidacion(strEmpresa, 
					dtFechaIncid == null ? null : new java.sql.Date(dtFechaIncid.getTime()), 
					strIncidente);
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
			
			List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentes(strEmpresa, 
					dtFechaIncid == null ? null : new java.sql.Date(dtFechaIncid.getTime()), 
					strIncidente);
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
			System.out.println("NUMERO DE INCIDENTE---> " + numIncidente);
			IncidenteServiceI servicio = IncidenteBusinessDelegate
					.getIncidenteService();

			RegistroIncidentesBean reg = servicio
					.obtenerIncidenteInspeccion(numIncidente);

			ClienteBean cliente = servicio
					.obtenerClientePorIncidente(numIncidente);
			
			System.out.println("tamaño del arreglo -- > " + reg.getArrMaquinariasXIncidente().size());
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

//			ClienteBean cliente = servicio
//					.obtenerClientePorIncidente(numIncidente);

			session.put("b_incidente", reg);
//			session.put("b_cliente", cliente);
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
