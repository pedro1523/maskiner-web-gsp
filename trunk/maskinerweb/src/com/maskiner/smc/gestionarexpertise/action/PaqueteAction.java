package com.maskiner.smc.gestionarexpertise.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.gestionarexpertise.bean.PaqueteBean;
import com.maskiner.smc.gestionarexpertise.service.PaqueteBusinessDelegate;
import com.maskiner.smc.gestionarexpertise.service.PaquetesServiceI;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.PaqueteXOTBean;

public class PaqueteAction implements SessionAware, RequestAware, ParameterAware {
	
	private Map<String, Object> session;
	private Map<String, Object> request;
	private Map<String, String[]> parameters;

	public String mostrarBuscarPaquetes() throws Exception  {

		String strCodMaquinaria = parameters.get("codMaquinaria")[0];
		if(strCodMaquinaria==null)strCodMaquinaria="";
			
		PaquetesServiceI servicio=PaqueteBusinessDelegate.getPaqueteService();
		List<PaqueteBean> lista=servicio.listarPaquete("%", strCodMaquinaria);
		
		request.put("listPaquete",lista);
		request.put("codMaquinaria", strCodMaquinaria);
		return "exito";
	}	

	public String lista() throws Exception  {

		String strNombre= parameters.get("txtNombrePaquete")[0];
		String strCodMaquinaria = parameters.get("codMaquinaria")[0];
		if(strNombre==null)strNombre="";
		if(strCodMaquinaria==null)strCodMaquinaria="";
			
		PaquetesServiceI servicio=PaqueteBusinessDelegate.getPaqueteService();
		List<PaqueteBean> lista=servicio.listarPaquete(strNombre+"%", strCodMaquinaria);
		
		request.put("listPaquete",lista);		  
		request.put("codMaquinaria", strCodMaquinaria);
		return "exito";
	}	


	public String mostrar()	throws Exception  {

		String strCodigo = parameters.get("codPaquete")[0];
		PaquetesServiceI servicio = PaqueteBusinessDelegate.getPaqueteService();		
		PaqueteBean paquete = servicio.obtenerPaquete(strCodigo);
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		
		ArrayList<PaqueteXOTBean> arrPaqXOT = ordenTrabajo.getArrPaquetesXOT();
		
		//verificar si existe el código de paquete en el arraylist
		if(existeCodigoPaquete(strCodigo, arrPaqXOT)){
			request.put("mensajeerror", "No se puede ingresar el mismo paquete más de una vez.");
		}else{
			PaqueteXOTBean paqXOT = new PaqueteXOTBean();
			
			paqXOT.setStrCodPaquete(paquete.getStrCodPaquete());
			paqXOT.setStrNombrePaquete(paquete.getStrNombre());
			paqXOT.setIntNumeroHorasNecesarias(paquete.getIntCantidadHoraPaquete());
			paqXOT.setIntNumeroTecnicosNecesarios(paquete.getIntCantidadTecPaquete());
			
			arrPaqXOT.add(paqXOT);
			session.put("b_ordentrabajo",ordenTrabajo);		
		}
		return "exito";
	}
	
	
	private boolean existeCodigoPaquete(String codigoPaquete, ArrayList<PaqueteXOTBean> listaPaqueteXOT) {
		boolean blnExiste = false;
		
		for(PaqueteXOTBean b: listaPaqueteXOT){
			if(b.getStrCodPaquete().equals(codigoPaquete)){
				blnExiste = true;
				break;
			}
		}
		return blnExiste;
	}
	
	
	public String listaPaquetes() throws Exception {
		
/*		
		// 1. Recuperamos parametros del request
		String strCodigo=request.getParameter("codigoPaquete");
		String strNombre=request.getParameter("nombrePaquete");
		if(strCodigo==null) strCodigo="";
		if(strNombre==null) strNombre="";
		
		// 2. Invocamos a un servicio
		PaquetesServiceI servicio= PaqueteBusinessDelegate.getPaqueteService();
		List<PaqueteBean> lista=servicio.listadoPaquetes(strCodigo+"%",strNombre+"%");
		
		request.setAttribute("listPaq", lista);		
		return mapping.findForward("exito");
*/	
		return null;
	}
	
	
	public String AgregarHerramientaALista() throws Exception {
		
/*			HttpSession sesion = request.getSession();
			ArrayList<HerramientaBean> DetalleHerr = new ArrayList<HerramientaBean>();
			if(sesion.getAttribute("Herramienta")==null){
				DetalleHerr = (ArrayList<HerramientaBean>)sesion.getAttribute("HerramientaIni");
			}
			else{
				DetalleHerr =(ArrayList<HerramientaBean>)sesion.getAttribute("Herramienta");
			}
			
			HerramientaBean detalle = new HerramientaBean();
			detalle.setStrCodHerramienta(request.getParameter("herraPaquete"));
			detalle.setStrDescripcionHerram(request.getParameter("descHerraPaquete"));
			detalle.setIntCantidadHerramientaxPqte(new Integer(request.getParameter("cantHerraPaquete")));
			detalle.setIntItemHerramienta(DetalleHerr.size());
			DetalleHerr.add(detalle);
			
			sesion.setAttribute("Herramienta", DetalleHerr);
			return mapping.findForward("exito");
*/		
		return null;
	}
	

	public String AgregarMaterialALista() throws Exception {
/*		
			HttpSession sesion = request.getSession();
			ArrayList<MaterialesBean> DetalleMat = new ArrayList<MaterialesBean>();
			if(sesion.getAttribute("Materiales")==null){
				DetalleMat = (ArrayList<MaterialesBean>)sesion.getAttribute("MaterialesIni");
			}
			else{
				DetalleMat =(ArrayList<MaterialesBean>)sesion.getAttribute("Materiales");
			}
			
			MaterialesBean detalle = new MaterialesBean();
			detalle.setStrCodMaterial(request.getParameter("materialPaquete"));
			detalle.setIntCantidadMat(new Integer(request.getParameter("cantMatPaquete")));
			detalle.setIntItemMaterial(DetalleMat.size());
			DetalleMat.add(detalle);
			
			sesion.setAttribute("Materiales", DetalleMat);
			return mapping.findForward("exito");
*/		
		return null;
	}
	
	
	public String AgregarActividadesALista() throws Exception {
/*		
			HttpSession sesion = request.getSession();
			ArrayList<ActividadesBean> DetalleAct = new ArrayList<ActividadesBean>();
			if(sesion.getAttribute("Actividades")==null){
				DetalleAct = (ArrayList<ActividadesBean>)sesion.getAttribute("ActividadesIni");
			}
			else{
				DetalleAct =(ArrayList<ActividadesBean>)sesion.getAttribute("Actividades");
			}
			
			ActividadesBean detalle = new ActividadesBean();
			detalle.setStrDescripcionAct(request.getParameter("actPaquete"));
			detalle.setIntnumItemActxPaquete(DetalleAct.size());
			
			DetalleAct.add(detalle);
			
			sesion.setAttribute("Actividades", DetalleAct);
			return mapping.findForward("exito");
*/		
		return null;
	}
	


	public String quitarActividades() throws Exception {
/*		
		HttpSession sesion = request.getSession();
		int numItem =new Integer( request.getParameter("num_item").toString());
		
		PaqueteBean pqte = (PaqueteBean) request.getSession().getAttribute("b_actividad");
		ArrayList<ActividadesBean> DetalleAct = pqte.getArrPaqueteDetActivBean();
		
		//DetalleAct =(ArrayList<ActividadesBean>)sesion.getAttribute("Actividades");
		for(ActividadesBean actividad:DetalleAct){
			if(actividad.getStrCodPaquetexAct().equals(numItem)){
				DetalleAct.remove(actividad);
				break;
			}
		}
		sesion.setAttribute("Actividades", DetalleAct);
		return mapping.findForward("exito");
*/	
		return null;
	}


	public String quitarHerramientas() throws Exception{
/*		
 		int fila = new Integer(request.getParameter("numFila").toString());
		HttpSession sesion = request.getSession();
		ArrayList<HerramientaBean> DetalleHerr = new ArrayList<HerramientaBean>();
	
		DetalleHerr = (ArrayList<HerramientaBean>) sesion
		.getAttribute("Detalle");
		for (int i = 0; i < DetalleHerr.size(); i++) {
			if (DetalleHerr.get(i).getIntItemHerramienta() == fila) {
				DetalleHerr.remove(i);
			}
		}
		sesion.setAttribute("Detalle", DetalleHerr);
		return mapping.findForward("exito");
*/		
		return null;
	}

	
	public String devolverHerramienta() throws Exception {
/*
			HttpSession sesion = request.getSession();
			HttpSession sesionMat = request.getSession();
	
			 PaquetesServiceI servicio = PaqueteBusinessDelegate.getPaqueteService();

				ArrayList<HerramientaBean> arr = servicio.listarHerramienta();
				ArrayList<MaterialesBean> arrMat = servicio.listarMateriales();		
				sesion.setAttribute("herramienta", arr);
				sesionMat.setAttribute("material", arrMat);
				
				System.out.println("puta madress");
				
				return mapping.findForward("exito");
*/		
		return null;
	}
	
	
	public String registrarPaquete() throws Exception {
/*			
		//UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute("usuariologueado");
		//String codRegistrador = usuario.getCodigoUsuario();
		//ordenTrabajo.setCodRegistrador(codRegistrador);
			HttpSession sesion = request.getSession();
			sesion.setAttribute("b_paquete", null);
			
			PaqueteBean paquete = (PaqueteBean) request.getSession().getAttribute("b_paquete");
			
			PaquetesServiceI servicio = PaqueteBusinessDelegate.getPaqueteService();
			servicio.generarPaquete(paquete);
			sesion.setAttribute("b_paquete", paquete);
			
			PaqueteBean regPaquete = new PaqueteBean();
			regPaquete.setStrCodPaquete((String)sesion.getAttribute("CodigoCliente"));
			regPaquete.setStrNombre((String)sesion.getAttribute(""));
			regPaquete.setStrMarcaMaqApliPaquete((String)sesion.getAttribute("codSucursal"));
			regPaquete.setStrModeloMaqApliPaquete((String)sesion.getAttribute(""));
			
			ArrayList<HerramientaBean> detHerr = (ArrayList<HerramientaBean>)sesion.getAttribute("DetalleHerr");
			ArrayList<HerramientaBean> detMat = (ArrayList<HerramientaBean>)sesion.getAttribute("DetalleMat");
			ArrayList<HerramientaBean> detAct = (ArrayList<HerramientaBean>)sesion.getAttribute("DetalleAct");
		
			return mapping.findForward("exito");
*/
		return null;
	}


	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}


	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}
	
}
