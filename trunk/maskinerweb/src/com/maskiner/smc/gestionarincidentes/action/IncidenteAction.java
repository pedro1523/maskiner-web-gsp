package com.maskiner.smc.gestionarincidentes.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

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

public class IncidenteAction {
	
	// variables privadas
	private RegistroIncidentesBean b_incidente;
	private String formOrigen;
	
	
	
	
	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}

	public RegistroIncidentesBean getB_incidente() {
		return b_incidente;
	}

	public void setB_incidente(RegistroIncidentesBean bIncidente) {
		b_incidente = bIncidente;
	}

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

	@SuppressWarnings("unchecked")
	public String registrarIncidente() throws Exception {

		Map<String, Object> sesion = ActionContext.getContext().getSession();
		
		UsuarioBean usu = (UsuarioBean) sesion.get("usuariologueado");
		ArrayList<DetalleRegistroIncidenteBean> detalle = 
			(ArrayList<DetalleRegistroIncidenteBean>) sesion.get("Detalle");
		
		if (detalle==null)detalle= new ArrayList<DetalleRegistroIncidenteBean>();
		
		if(detalle.size()==0){
			
			ActionContext.getContext().getValueStack().set("mensajeerror1", "Primero debe agregar una incidencia");
			
			return "fracaso";
		}else{
		
		RegistroIncidentesBean regIncidente = new RegistroIncidentesBean();
		//Aqui se harán Cambios KLM
		regIncidente.setStrCodigoCliente((String) sesion.get("CodigoCliente"));
		regIncidente.setStrCodigoRegistrador(usu.getCodigoUsuario());
		regIncidente.setStrSucursal((String) sesion.get("codSucursal"));
		regIncidente.setIntEstadoIncidente(1);

		IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();

		sesion.put("id", servicio.RegistrarIncidenteYDetalle(regIncidente, detalle));

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
		Map<String, Object> sesion = ActionContext.getContext().getSession();	
		Map<String, Object> parametros = ActionContext.getContext().getParameters();
		String codIncidente = ((String[]) parametros.get("numIncidente"))[0].trim();

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
				b_incidente = servicio.obtenerIncidente(codIncidente);
				if (b_incidente == null) {
					exito = "exito1";
				} else {
					exito = "exito2";
					sesion.put("b_incidente", b_incidente);
					System.out.println("Nº maquinarias:"+b_incidente.getArrMaquinariasXIncidente().size());
				}
			}
		}
		return exito;
	}

	public String buscarIncidentes() throws Exception {
		
		Map<String, Object> request = ActionContext.getContext().getParameters();
		
		String strFormOrigen = (String) request.get("formOrigen");
		String strEmpresa = ((String) request.get("nombreEmpresa")).trim();
		String strFechaIncid = ((String) request.get("fechaIncidente")).trim();
		String strIncidente = ((String) request.get("incidente")).trim();
		
		if(strFormOrigen.equals("RegistrarLiquidacion")){
						
			Date dtFechaIncid = null;
			
			if(!strFechaIncid.equals("")){
				if(FormatoFecha.isFecha(strFechaIncid)){
					dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
				}
			}
			
			IncidenteServiceI isServicio = IncidenteBusinessDelegate.getIncidenteService();
			
			List<RegistroIncidentesBean> lstArr = isServicio.buscarIncidentesParaLiquidacion(strEmpresa, dtFechaIncid, strIncidente);
			request.put("formOrigen", strFormOrigen);
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
			request.put("formOrigen", strFormOrigen);
			request.put("arr_incidentes", lstArr);
		}
		return "exito";
	}

	public String irAPaginaOrigen() throws Exception {
		
		Map<String, Object> request = ActionContext.getContext().getParameters();

		String strPaginaOrigen = (String) request.get("formOrigen");

		if (strPaginaOrigen.equals("generarOTInspec")) {
			return "exito1";
		} else {
			return "exito2";
		}
	}

	public String buscarIncidentesDevolverResultado() throws Exception {
		/*
		HttpSession sesion = request.getSession();
		
		String paginaOrigen = request.getParameter("formOrigen");
		String numIncidente = request.getParameter("numIncidente");
		*/
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
		/*
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
			

			return "exito1";
		}else if(paginaOrigen.equals("RegistrarLiquidacion")){
			
			IncidenteServiceI servicio = IncidenteBusinessDelegate.getIncidenteService();
			
			RegistroIncidentesBean reg = servicio.obtenerIncidenteParaLiquidacion(numIncidente);
			
			request.getSession().setAttribute("incidente", reg);
			
			return "exito3";
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
			return "exito2";
		}
		*/
		return null;
	}


	/* FIN METODOS CLAUDIO */
	
}
