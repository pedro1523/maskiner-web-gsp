package com.maskiner.smc.programartrabajo.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import sun.print.PrintJob2D;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;
import com.maskiner.smc.programartrabajo.service.OrdenTrabajoServiceI;
import com.maskiner.smc.programartrabajo.service.ProgramarTrabajoBusinessDelegate;
import com.maskiner.smc.programartrabajo.service.TecnicoServiceI;
import com.maskiner.smc.seguridad.bean.UsuarioBean;

public class ProgramarOTInspeccionAction extends MappingDispatchAction {

	public ActionForward cargarGenerarOTInspeccion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		//borramos el bean b_incidente de la sesión
		request.getSession().setAttribute("b_incidente", null);
		
		return mapping.findForward("exito");
	}
	
	/*===================CHRISTIAN================================*/
	public ActionForward lista(ActionMapping mapping, 
			ActionForm form,
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception  {		
			
			System.out.println("Dentro del metodo lista");
			
			String strFechaInspeccion=request.getParameter("fechaInspeccion");
			String strHoraInicio=request.getParameter("horaInicio");
			String strHoraFin=request.getParameter("horaFin");
			
			String maq=request.getParameter("maq");
			
			strFechaInspeccion=strFechaInspeccion.substring(6,10)+"-"+strFechaInspeccion.substring(3,5)+"-"+strFechaInspeccion.substring(0,2);
			
			if(maq==null){			
			  maq="";
			}
			System.out.println("maquinaria--->"+maq);
			request.getSession().setAttribute("maquinaria", maq);
			if(strFechaInspeccion==null)strFechaInspeccion="";
			if(strHoraInicio==null)strHoraInicio="";
			if(strHoraFin==null)strHoraFin="";
			
			
			
			TecnicoServiceI servicio=ProgramarTrabajoBusinessDelegate.getTecnicoService();		
			List<TecnicoBean> lista=servicio.listarTecnicos(strFechaInspeccion,strHoraInicio,
															strHoraFin);
			System.out.println("fecha---->"+strFechaInspeccion);
			System.out.println("Hora Inicio---->"+strHoraInicio);
			System.out.println("Hora Fin---->"+strHoraFin);
			System.out.println("tamaño del arreglo-----> "+ lista.size());
			request.setAttribute("listTecnicos",lista);
			obtenerCabecera(request, response);
			
			return mapping.findForward("exito");
		
		
		
			}	
			
			
	public ActionForward mostrar(ActionMapping mapping, 
			ActionForm form,
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception  {
			
			
			String strCodigo=request.getParameter("codTecnico");
			if(strCodigo==null)strCodigo="";
			System.out.println("nombre del criterio :"+ strCodigo);
			TecnicoServiceI servicio=ProgramarTrabajoBusinessDelegate.getTecnicoService();		
			TecnicoBean tecnico=servicio.obtenerTecnico(strCodigo);	
			
			
			request.setAttribute("beanTecnico",tecnico);
			
			return mapping.findForward("exito");
	}
	
	
	public ActionForward registrar(ActionMapping mapping, 
			ActionForm form,
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception  {
		
		
		System.out.println("dentro del metodo registrar");
		//recuperamos al tecnico
		String strCodTecnico=request.getParameter("chkTecnico");
		if(strCodTecnico==null){
			request.setAttribute("sms","(*)Debe Seleccionar Tecnico");
			return mapping.findForward("exito1");
		}
			
			
		System.out.println("codigo del tecnico---> "+ strCodTecnico);
		//recuperamos la cabecera del formulario de la session
		OrdenTrabajoInspeccionBean OTIBean=(OrdenTrabajoInspeccionBean)
											request.getSession().getAttribute("b_OTIAsignar");
		//asignamos al tecnico en el bean recuperado
		OTIBean.setStrCodTecnico(strCodTecnico);
		
		//utilizamos el servicio
		OrdenTrabajoServiceI servicio=ProgramarTrabajoBusinessDelegate.getOrdenTrabajoService();
		
		if(servicio.registrarOrdenTrabajoInspeccion(OTIBean)){
			//recuperamos el bean incidente de la session
			RegistroIncidentesBean incidenteBean=(RegistroIncidentesBean)
											request.getSession().getAttribute("b_incidente");
			
			String tarjetaEquipo=(String)request.getSession().getAttribute("tarjetaEquipo");
			ArrayList<DetalleRegistroIncidenteBean> listaEquipos=incidenteBean.getArrMaquinariasXIncidente();
							
			for(int i=0;i<listaEquipos.size();i++){
				if(tarjetaEquipo.equals(listaEquipos.get(i).getStrNumeroTarjetaEquipo())){
					listaEquipos.remove(i);
					request.getSession().setAttribute("b_incidente",incidenteBean);
					break;
				}
					
			}
			
			
			
			return mapping.findForward("exito");
			
		}
		else
			return mapping.findForward("exito2");
			
			
	}
	
	private void obtenerCabecera(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		
		System.out.println("dentro de obtener Cabecera");
		try{
		//recuperamos datos del formulario
		String strFechaInspeccion=request.getParameter("fechaInspeccion");
		String strHoraInicio=request.getParameter("horaInicio");
		String strHorafin=request.getParameter("horaFin");
		
		System.out.println("datos del formulario :");
		System.out.println("fecha :"+strFechaInspeccion+" hInicio :"+strHoraInicio + 
							"hFin :"+strHorafin);
		//recuperamos el bean incidente de la session
		RegistroIncidentesBean incidenteBean=(RegistroIncidentesBean)
										request.getSession().getAttribute("b_incidente");
		
		
		System.out.println("datos del bean incidente -->"+ incidenteBean.getStrNumeroIncidente());
		//recuperamos al usuario 		 
		UsuarioBean usuario=(UsuarioBean)
									request.getSession().getAttribute("usuariologueado");
		System.out.println("datos del bean usuario-->"+ usuario.getCodigoUsuario());
		//recuperamos el detalle de registro de incidente
		String tarjetaEquipo=(String)request.getSession().getAttribute("tarjetaEquipo");
		ArrayList<DetalleRegistroIncidenteBean> listaEquipos=incidenteBean.getArrMaquinariasXIncidente();
		int itemAveria=0;				
		for(int i=0;i<listaEquipos.size();i++){
			if(tarjetaEquipo.equals(listaEquipos.get(i).getStrNumeroTarjetaEquipo())){
				itemAveria=listaEquipos.get(i).getIntNumeroItem();
				break;
			}
				
		}
		
		//asignamos  los datos de los beans recuperados de la session a el bean 
		//ordentrabajoinspeccionbean		
		strFechaInspeccion=strFechaInspeccion.substring(6,10)+"-"+strFechaInspeccion.substring(3,5)+"-"+strFechaInspeccion.substring(0,2);
		OrdenTrabajoInspeccionBean OTIBean=new OrdenTrabajoInspeccionBean();		
		OTIBean.setStrFecInspeccion(strFechaInspeccion);
		OTIBean.setStrHorInicio(strHoraInicio);
		OTIBean.setStrHorFin(strHorafin);
		OTIBean.setStrCodRegistrador(usuario.getCodigoUsuario());		
		OTIBean.setStrNumIncidente(incidenteBean.getStrNumeroIncidente());		
		OTIBean.setStrNumTarjeta(tarjetaEquipo);
		OTIBean.setIntItemAveria(itemAveria);
		request.getSession().setAttribute("b_OTIAsignar", OTIBean);
		}catch(Exception e){
			System.out.println("error--->"+e.getMessage() );
		}
		
		
	}
	
			
	/*================FIN===================*/
	
	
}
