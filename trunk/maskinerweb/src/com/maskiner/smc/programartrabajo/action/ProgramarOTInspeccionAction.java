package com.maskiner.smc.programartrabajo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;
import com.maskiner.smc.programartrabajo.service.OrdenTrabajoServiceI;
import com.maskiner.smc.programartrabajo.service.ProgramarTrabajoBusinessDelegate;
import com.maskiner.smc.programartrabajo.service.TecnicoServiceI;
import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.opensymphony.xwork2.ActionSupport;

public class ProgramarOTInspeccionAction extends ActionSupport {
	
	private Map<String, Object> session;
	private String fechaInspeccion;
	private String horaInicio;
	private String horaFin;
	private String maq;
	private String codTecnico;
	private String chkTecnico;
	private OrdenTrabajoInspeccionBean OTIBean;
	private String formOrigen;
	//private String tarjetaEquipo;
	
	
	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getFechaInspeccion() {
		return fechaInspeccion;
	}

	public void setFechaInspeccion(String fechaInspeccion) {
		this.fechaInspeccion = fechaInspeccion;
	}

	public String getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

	public String getHoraFin() {
		return horaFin;
	}

	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}

	public String getMaq() {
		return maq;
	}

	public void setMaq(String maq) {
		this.maq = maq;
	}

	public String cargarGenerarOTInspeccion()
			throws Exception {
		//borramos el bean b_incidente de la sesión
		try {
			session.put("b_incidente",null);
		} catch (Exception e) {
			System.out.println(e.getMessage());		
			}
				
		return "exito";
	}
	
	/*===================CHRISTIAN================================*/
	public String lista()
			throws Exception  {		
			
			System.out.println("Dentro del metodo lista");
			/*
			String strFechaInspeccion=request.getParameter("fechaInspeccion");
			String strHoraInicio=request.getParameter("horaInicio");
			String strHoraFin=request.getParameter("horaFin");
			
			String maq=request.getParameter("maq");*/
			
			this.fechaInspeccion=this.fechaInspeccion.substring(6,10)+"-"+
								 this.fechaInspeccion.substring(3,5)+"-"+
								 this.fechaInspeccion.substring(0,2);
			
			if(this.maq==null){			
			  this.maq="";
			}
			
			System.out.println("maquinaria--->"+maq);
			this.session.put("maquinaria", maq);
			if(this.fechaInspeccion==null)this.fechaInspeccion="";
			if(this.horaInicio==null)this.horaInicio="";
			if(this.horaFin==null)this.horaFin="";
			
			
			
			TecnicoServiceI servicio=ProgramarTrabajoBusinessDelegate.getTecnicoService();		
			List<TecnicoBean> lista=servicio.listarTecnicos(this.fechaInspeccion,this.horaInicio,
															this.horaFin);
			
			session.put("listTecnicos",lista);
			obtenerCabecera();
			
			return "exito";
		
		
		
			}	
			
			
	public String mostrar()
			throws Exception  {
						
			//String strCodigo=request.getParameter("codTecnico");
			if(this.codTecnico==null)this.codTecnico="";
			//System.out.println("nombre del criterio :"+ strCodigo);
			TecnicoServiceI servicio=ProgramarTrabajoBusinessDelegate.getTecnicoService();		
			TecnicoBean tecnico=servicio.obtenerTecnico(this.codTecnico);				
			this.session.put("beanTecnico",tecnico);			
			return "exito";
	}
	
	
	public String registrar()
			throws Exception  {
		
		
		System.out.println("dentro del metodo registrar");
		//recuperamos al tecnico
		this.codTecnico=this.chkTecnico;
		if(this.codTecnico==null){
			this.session.put("sms","(*)Debe Seleccionar Tecnico");
			return "exito1";
		}
			
			
		//System.out.println("codigo del tecnico---> "+ strCodTecnico);
		//recuperamos la cabecera del formulario de la session
		OrdenTrabajoInspeccionBean OTIBean=(OrdenTrabajoInspeccionBean)
											this.session.get("b_OTIAsignar");
		//asignamos al tecnico en el bean recuperado
		OTIBean.setStrCodTecnico(this.codTecnico);
		
		//utilizamos el servicio
		OrdenTrabajoServiceI servicio=ProgramarTrabajoBusinessDelegate.getOrdenTrabajoService();
		
		if(servicio.registrarOrdenTrabajoInspeccion(OTIBean)){
			//recuperamos el bean incidente de la session
			RegistroIncidentesBean incidenteBean=(RegistroIncidentesBean)
											this.session.get("b_incidente");
			
			String tarjetaEquipo=(String)this.session.get("tarjetaEquipo");
			ArrayList<DetalleRegistroIncidenteBean> listaEquipos=incidenteBean.getArrMaquinariasXIncidente();
							
			for(int i=0;i<listaEquipos.size();i++){
				if(tarjetaEquipo.equals(listaEquipos.get(i).getStrNumeroTarjetaEquipo())){
					listaEquipos.remove(i);
					this.session.put("b_incidente",incidenteBean);
					break;
				}
					
			}
			
			
			
			return "exito";
			
		}
		else
			return "exito2";
			
			
	}
	
	private void obtenerCabecera()throws Exception{
		
		System.out.println("dentro de obtener Cabecera");
		try{
		/*recuperamos datos del formulario
		String strFechaInspeccion=request.getParameter("fechaInspeccion");
		String strHoraInicio=request.getParameter("horaInicio");
		String strHorafin=request.getParameter("horaFin");
		
		System.out.println("datos del formulario :");
		System.out.println("fecha :"+strFechaInspeccion+" hInicio :"+strHoraInicio + 
							"hFin :"+strHorafin);*/
		//recuperamos el bean incidente de la session
		RegistroIncidentesBean incidenteBean=(RegistroIncidentesBean)
											 this.session.get("b_incidente");
										//request.getSession().getAttribute("b_incidente");
		
		
		//System.out.println("datos del bean incidente -->"+ incidenteBean.getStrNumeroIncidente());
		//recuperamos al usuario 		 
		UsuarioBean usuario=(UsuarioBean) session.get("usuariologueado");
									//request.getSession().getAttribute("usuariologueado");
		System.out.println("datos del bean usuario-->"+ usuario.getCodigoUsuario());
		//recuperamos el detalle de registro de incidente
		String tarjetaEquipo=(String)session.get("tarjetaEquipo");
		//request.getSession().getAttribute("tarjetaEquipo");
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
		this.fechaInspeccion=this.fechaInspeccion.substring(6,10)+"-"+
							 this.fechaInspeccion.substring(3,5)+"-"+
							 this.fechaInspeccion.substring(0,2);
		
		OrdenTrabajoInspeccionBean OTIBean=new OrdenTrabajoInspeccionBean();		
		OTIBean.setStrFecInspeccion(this.fechaInspeccion);
		OTIBean.setStrHorInicio(this.OTIBean.getStrHorInicio());
		OTIBean.setStrHorFin(this.OTIBean.getStrHorFin());
		OTIBean.setStrCodRegistrador(usuario.getCodigoUsuario());		
		OTIBean.setStrNumIncidente(incidenteBean.getStrNumeroIncidente());		
		OTIBean.setStrNumTarjeta(tarjetaEquipo);
		OTIBean.setIntItemAveria(itemAveria);
		this.session.put("b_OTIAsignar", OTIBean);
		}catch(Exception e){
			System.out.println("error--->"+e.getMessage() );
		}
		
		
	}
	
			
	/*================FIN===================*/
	public String cargarBuscarIncidente(){
		
		return "exito";
	}
	
}
