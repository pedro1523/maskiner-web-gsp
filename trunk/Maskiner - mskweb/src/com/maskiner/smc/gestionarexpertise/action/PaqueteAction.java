package com.maskiner.smc.gestionarexpertise.action;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import com.maskiner.smc.gestionarexpertise.bean.ActividadesBean;
import com.maskiner.smc.gestionarexpertise.bean.HerramientaBean;
import com.maskiner.smc.gestionarexpertise.bean.MaterialesBean;
import com.maskiner.smc.gestionarexpertise.bean.PaqueteBean;
import com.maskiner.smc.gestionarexpertise.service.PaqueteBusinessDelegate;
import com.maskiner.smc.gestionarexpertise.service.PaquetesServiceI;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.PaqueteXOTBean;

public class PaqueteAction extends MappingDispatchAction {

	public ActionForward lista(ActionMapping mapping, 
			ActionForm form,
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception  {

		String strNombre=request.getParameter("txtNombrePaquete");
		String strCodMaquinaria = request.getParameter("codMaquinaria");
		if(strNombre==null)strNombre="";
		if(strCodMaquinaria==null)strCodMaquinaria="";
			
		//System.out.println("nombre del criterio :"+ strNombre);
		PaquetesServiceI servicio=PaqueteBusinessDelegate.getPaqueteService();
		List<PaqueteBean> lista=servicio.listarPaquete(strNombre+"%", strCodMaquinaria+"%");
		
		//System.out.println("tamaño del arreglo-----> "+ lista.size());
		request.setAttribute("listPaquete",lista);		  
		return mapping.findForward("exito");
	}	


	public ActionForward mostrar(ActionMapping mapping, 
								ActionForm form,
								HttpServletRequest request, 
								HttpServletResponse response)
								throws Exception  {

		HttpSession session=request.getSession();
		
		String strCodigo = request.getParameter("codPaquete");
		PaquetesServiceI servicio = PaqueteBusinessDelegate.getPaqueteService();		
		PaqueteBean paquete = servicio.obtenerPaquete(strCodigo);
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.getAttribute("b_ordentrabajo");
		
		ArrayList<PaqueteXOTBean> arrPaqXOT = ordenTrabajo.getArrPaquetesXOT();
		
		//verificar si existe el código de paquete en el arraylist
		if(existeCodigoPaquete(strCodigo, arrPaqXOT)){
			request.setAttribute("mensajeerror", "No se puede ingresar el mismo paquete más de una vez.");
			return mapping.findForward("fracaso");
		}else{
			PaqueteXOTBean paqXOT = new PaqueteXOTBean();
			
			paqXOT.setStrCodPaquete(paquete.getStrCodPaquete());
			paqXOT.setStrNombrePaquete(paquete.getStrNombre());
			paqXOT.setIntNumeroHorasNecesarias(paquete.getIntCantidadHoraPaquete());
			paqXOT.setIntNumeroTecnicosNecesarios(paquete.getIntCantidadTecPaquete());
			
			arrPaqXOT.add(paqXOT);
			session.setAttribute("b_ordentrabajo",ordenTrabajo);		
			return mapping.findForward("exito");
		}
		
	}
	
	private boolean existeCodigoPaquete(String codigoPaquete,
			ArrayList<PaqueteXOTBean> listaPaqueteXOT) {
		boolean blnExiste = false;
		
		for(PaqueteXOTBean b: listaPaqueteXOT){
			if(b.getStrCodPaquete().equals(codigoPaquete)){
				blnExiste = true;
				break;
			}
		}
		return blnExiste;
	}
	
	//seguimos
	public ActionForward listaPaquetes(
			ActionMapping mapping, 
			ActionForm form,
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception {
		
		
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
	}
	
	public ActionForward AgregarHerramientaALista(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
			HttpSession sesion = request.getSession();
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
		
	}
	
	public ActionForward AgregarMaterialALista(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
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
		
	}
	
	public ActionForward AgregarActividadesALista(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
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
		
	}
	
//fallando	
	public ActionForward quitarActividades(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
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
	}

//
	public ActionForward quitarHerramientas(ActionMapping mapping, ActionForward form,
	HttpServletRequest request, HttpServletResponse response)
	throws Exception{
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
		
	}

	
	public ActionForward devolverHerramienta(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

			HttpSession sesion = request.getSession();
			HttpSession sesionMat = request.getSession();
	
			 PaquetesServiceI servicio = PaqueteBusinessDelegate.getPaqueteService();

				ArrayList<HerramientaBean> arr = servicio.listarHerramienta();
				ArrayList<MaterialesBean> arrMat = servicio.listarMateriales();		
				sesion.setAttribute("herramienta", arr);
				sesionMat.setAttribute("material", arrMat);
				
				System.out.println("puta madress");
				
				return mapping.findForward("exito");
	}
	
	public ActionForward registrarPaquete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			
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

	}
	
}
