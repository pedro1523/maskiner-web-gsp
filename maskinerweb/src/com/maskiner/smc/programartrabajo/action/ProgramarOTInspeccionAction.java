package com.maskiner.smc.programartrabajo.action;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;
import com.maskiner.smc.programartrabajo.service.OrdenTrabajoServiceI;
import com.maskiner.smc.programartrabajo.service.ProgramarTrabajoBusinessDelegate;
import com.maskiner.smc.programartrabajo.service.TecnicoServiceI;
import com.maskiner.smc.seguridad.bean.UsuarioBean;

public class ProgramarOTInspeccionAction implements SessionAware, ParameterAware  {
	
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
	private String horaInicio;
	private String horaFin;
	private String formOrigen;

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
	
	public String getFormOrigen() {
		return formOrigen;
	}

	public void setFormOrigen(String formOrigen) {
		this.formOrigen = formOrigen;
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
			String valor=validarCampos();
			String strFechaInspeccion=parameters.get("fechaInspeccion")[0].trim();

			String strHoraInicio=horaInicio;
			String strHoraFin=horaFin;
			session.remove("listTecnicos");
			if(valor.substring(0,1).equals("1") ){
				session.put("mensajeError", valor.substring(1)  );
				
				return "exito";
			}else if(!valor.substring(0,1).equals("0")){
				session.put("mensajeError", valor.substring(1)  );
							
				session.put("fechaInspeccion", strFechaInspeccion);
				return "exito";
			}
			
			session.remove("mensajeError");
		
			
			String maq=null;//=parameters.get("maq")[0].trim();
			System.out.println("maq--> " + maq);
			strFechaInspeccion=strFechaInspeccion.substring(6,10)+"-"+
								strFechaInspeccion.substring(3,5)+"-"+
								strFechaInspeccion.substring(0,2);
								
			if(maq==null){			
			  maq="";
			}
			
			System.out.println("maquinaria--->"+maq);
			session.put("maquinaria", maq);
			if(strFechaInspeccion==null)strFechaInspeccion="";
			if(strHoraInicio==null)strHoraInicio="";
			if(strHoraFin==null)strHoraFin="";
			
			
			
			TecnicoServiceI servicio=ProgramarTrabajoBusinessDelegate.getTecnicoService();		
			List<TecnicoBean> lista=servicio.listarTecnicos(strFechaInspeccion,strHoraInicio,
										strHoraFin);
			
			session.put("listTecnicos",lista);
			
			strFechaInspeccion=strFechaInspeccion.substring(8,10)+"/"+
			strFechaInspeccion.substring(5,7)+"/"+
			strFechaInspeccion.substring(0,4);
			
			session.put("fechaInspeccion", strFechaInspeccion);
			//request.put("fechaInspeccion", strFechaInspeccion);
			obtenerCabecera();
			
			return "exito";
		
		
		
			}	
			
			
	public String mostrar()
			throws Exception  {
						
			String strCodigo=parameters.get("codTecnico")[0].trim();
			if(strCodigo==null)strCodigo="";
			//System.out.println("nombre del criterio :"+ strCodigo);
			TecnicoServiceI servicio=ProgramarTrabajoBusinessDelegate.getTecnicoService();		
			TecnicoBean tecnico=servicio.obtenerTecnico(strCodigo);				
			session.put("beanTecnico",tecnico);			
			return "exito";
	}
	
	
	@SuppressWarnings("unchecked")
	public String registrar()
			throws Exception  {
		
		
		System.out.println("dentro del metodo registrar");
		//recuperamos al tecnico
		
		ArrayList<TecnicoBean> a_lista=(ArrayList<TecnicoBean>) session.get("listTecnicos");
		if(a_lista==null){
			session.put("mensajeError", "No existen técnicos disponibles");
			return "exito1";
		}
		String codTecnico="";
		try{
			codTecnico=parameters.get("chkTecnico")[0].trim();
		}catch (Exception e) {
			session.put("mensajeError", "falta seleccionar técnico");
			return "exito1";
		}
		
		session.remove("mensajeError");
			
		//recuperamos la cabecera del formulario de la session
		OrdenTrabajoInspeccionBean OTIBean=(OrdenTrabajoInspeccionBean)
											session.get("b_OTIAsignar");
		
		//asignamos al tecnico en el bean recuperado
		OTIBean.setStrCodTecnico(codTecnico);
		
		//utilizamos el servicio
		OrdenTrabajoServiceI servicio=ProgramarTrabajoBusinessDelegate.getOrdenTrabajoService();
		
		if(servicio.registrarOrdenTrabajoInspeccion(OTIBean)){
			//recuperamos el bean incidente de la session
			RegistroIncidentesBean incidenteBean=(RegistroIncidentesBean)
											session.get("b_incidente");
			//incidenteBean.setStrLugarAtencionCliente(strLugarAtencion);
			String tarjetaEquipo=(String)session.get("tarjetaEquipo");
			ArrayList<DetalleRegistroIncidenteBean> listaEquipos=incidenteBean.getArrMaquinariasXIncidente();
							
			for(int i=0;i<listaEquipos.size();i++){
				if(tarjetaEquipo.equals(listaEquipos.get(i).getStrNumeroTarjetaEquipo())){
					listaEquipos.remove(i);
					session.put("b_incidente",incidenteBean);
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
		//recuperamos datos del formulario
		String strFechaInspeccion=parameters.get("fechaInspeccion")[0].trim();
		String strHoraInicio=parameters.get("horaInicio")[0].trim();
		String strHorafin=parameters.get("horaFin")[0].trim();
		
		
		//recuperamos el bean incidente de la session
		RegistroIncidentesBean incidenteBean=(RegistroIncidentesBean)
											 session.get("b_incidente");
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
		strFechaInspeccion=strFechaInspeccion.substring(6,10)+"-"+
							strFechaInspeccion.substring(3,5)+"-"+
							strFechaInspeccion.substring(0,2);
		
		OrdenTrabajoInspeccionBean OTIBean=new OrdenTrabajoInspeccionBean();		
		OTIBean.setStrFecInspeccion(strFechaInspeccion);
		OTIBean.setStrHorInicio(strHoraInicio);
		OTIBean.setStrHorFin(strHorafin);
		OTIBean.setStrCodRegistrador(usuario.getCodigoUsuario());		
		OTIBean.setStrNumIncidente(incidenteBean.getStrNumeroIncidente());		
		OTIBean.setStrNumTarjeta(tarjetaEquipo);
		OTIBean.setIntItemAveria(itemAveria);
		session.put("b_OTIAsignar", OTIBean);
		}catch(Exception e){
			System.out.println("error--->"+e.getMessage() );
		}
		
		
	}
	
	public String validarCampos(){
		String strFechaInspeccion=parameters.get("fechaInspeccion")[0].trim();
		if(strFechaInspeccion.equals("")){
			return "1Ingrese fecha de Inspección";
		}
		Date fechaSys = new Date();
		System.out.println("Fecha actual--> " + fechaSys);
		Date fecha=null;
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm"); 
		Time dHoraIncio=null;
		Time dHoraFin=null;
		try {
			dHoraIncio = new Time(sdf.parse(horaInicio).getTime());
			dHoraFin = new Time(sdf.parse(horaFin).getTime());
			
			sdf=new SimpleDateFormat("dd/MM/yyyy");
			fecha=sdf.parse(strFechaInspeccion);
			
			
			if(FormatoFecha.getDiffFechas(fecha, fechaSys)>0 ){
				return "2fecha debe ser mayor o igual a la actual";
			}else if(dHoraIncio.getTime()>= dHoraFin.getTime() ){
				return "3hora inicio debe ser menor a la hora final";
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "0";
	}
	
	public String cargarOTIAsignar1(){
		
		session.remove("listTecnicos");
		session.remove("fechaInspeccion");
		session.remove("mensajeError");
		return "exito";
	}
			
	/*================FIN===================*/
	public String cargarBuscarIncidente(){
		
		return "exito";
	}
	
	public String cargarOTIAsignar() throws Exception{
		
			String numTarjeta=parameters.get("numTarjeta")[0].trim();
			session.put("tarjetaEquipo", numTarjeta);
			
		
		return "exito";
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		this.parameters=arg0;
		
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
