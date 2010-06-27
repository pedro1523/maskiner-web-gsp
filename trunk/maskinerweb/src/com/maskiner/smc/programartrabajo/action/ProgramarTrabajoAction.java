package com.maskiner.smc.programartrabajo.action;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.gestionarincidentes.service.IncidenteBusinessDelegate;
import com.maskiner.smc.gestionarincidentes.service.IncidenteServiceI;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.PaqueteXOTBean;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;
import com.maskiner.smc.programartrabajo.service.OrdenTrabajoServiceI;
import com.maskiner.smc.programartrabajo.service.ProgramarTrabajoBusinessDelegate;
import com.maskiner.smc.programartrabajo.service.TecnicoServiceI;
import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.opensymphony.xwork2.ActionSupport;

public class ProgramarTrabajoAction extends ActionSupport implements RequestAware, SessionAware, ParameterAware {
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
	
	private Integer numTecnicosNecesarios;
	private Integer numHorasNecesarias;
	private String paqueteSeleccionado;
	
	private String fechaAtencion;
	private String horaInicio;
	private String horaFin;

	private String tmp_FechaAtencion;
	private String tmp_HoraInicio;
	private String tmp_HoraFin;
	

	public String getTmp_FechaAtencion() {
		return tmp_FechaAtencion;
	}

	public void setTmp_FechaAtencion(String tmpFechaAtencion) {
		tmp_FechaAtencion = tmpFechaAtencion;
	}

	public String getTmp_HoraInicio() {
		return tmp_HoraInicio;
	}

	public void setTmp_HoraInicio(String tmpHoraInicio) {
		tmp_HoraInicio = tmpHoraInicio;
	}

	public String getTmp_HoraFin() {
		return tmp_HoraFin;
	}

	public void setTmp_HoraFin(String tmpHoraFin) {
		tmp_HoraFin = tmpHoraFin;
	}

	public String getHoraFin() {
		return horaFin;
	}

	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}

	public String getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

	public String getFechaAtencion() {
		return fechaAtencion;
	}

	public void setFechaAtencion(String fechaAtencion) {
		this.fechaAtencion = fechaAtencion;
	}

	public String getPaqueteSeleccionado() {
		return paqueteSeleccionado;
	}

	public void setPaqueteSeleccionado(String paqueteSeleccionado) {
		this.paqueteSeleccionado = paqueteSeleccionado;
	}

	public Integer getNumTecnicosNecesarios() {
		return numTecnicosNecesarios;
	}

	public void setNumTecnicosNecesarios(Integer numTecnicosNecesarios) {
		this.numTecnicosNecesarios = numTecnicosNecesarios;
	}

	public Integer getNumHorasNecesarias() {
		return numHorasNecesarias;
	}

	public void setNumHorasNecesarias(Integer numHorasNecesarias) {
		this.numHorasNecesarias = numHorasNecesarias;
	}

	public String cargarGenerarOT()	throws Exception {
		
		//borramos el bean b_incidente de la sesión
		session.put("b_incidente",null);
		session.put("b_ordentrabajo",null);

		return "exito";
	}
	
	public String cargarGenerarOTPaso2() throws Exception {
		
		String numTarjeta = parameters.get("numtarj")[0];
		
		UsuarioBean usuario = (UsuarioBean) session.get("usuariologueado");
		RegistroIncidentesBean incidente = (RegistroIncidentesBean) session.get("b_incidente");
		
		String codRegistrador = usuario.getCodigoUsuario();
		String numIncidente = incidente.getStrNumeroIncidente();
		
		OrdenTrabajoBean ordenTrabajo = new OrdenTrabajoBean();
		ordenTrabajo.setStrCodRegistrador(codRegistrador);
		ordenTrabajo.setStrNumIncidente(numIncidente);
		ordenTrabajo.setStrNumTarjeta(numTarjeta);
		
		//encontrar el equipo averiado
		DetalleRegistroIncidenteBean detRegIncid = null;
		for(DetalleRegistroIncidenteBean det:incidente.getArrMaquinariasXIncidente()){
			if(det.getStrNumeroTarjetaEquipo().equals(numTarjeta)){
				detRegIncid = det;
				break;
			}
		}
		
		ordenTrabajo.setIntItmAveria(detRegIncid.getIntNumeroItem());
		
		ordenTrabajo.setStrDescripcionMaquinaria(detRegIncid.getStrDescripcionMaquinaria());
		ordenTrabajo.setStrCodMaquinaria(detRegIncid.getStrCodMaquinaria());
		ordenTrabajo.setStrMarcaMaquinaria(detRegIncid.getStrMarcaMaquinaria());
		ordenTrabajo.setStrModeloMaquinaria(detRegIncid.getStrModeloMaquinaria());
		ordenTrabajo.setStrDescripcionAveria(detRegIncid.getStrDescripcionAveria());
		
		session.put("b_ordentrabajo", ordenTrabajo);
		
		return "exito";
	}
	
	public String irAGenerarOT_paso2() throws Exception {
		
		session.put("b_disponibilidadtecnicos", null);
		
		return "exito";
	}
	
	
	public String cargarGenerarOTPaso3() throws Exception {
		
		//verificar que no se pasa al paso 3 sin haber asignado al menos un paquete a la o/t
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		if(ordenTrabajo.getArrPaquetesXOT().size()==0){
			//request.put("mensajeerror1", "Al menos debe asignar un paquete a la orden de trabajo");
			request.put("mensajeerror1", getText("pages.programartrabajo.generarot_p2.mensajeerror1"));
			return "fracaso";
		}else{
			//borramos la lista de tecnicos disponibles
			session.put("b_disponibilidadtecnicos", null);
			return "exito";
		}
	}
	
	public String quitarPaqueteDeOT() throws Exception {
		
		String strCodPaquete = parameters.get("codPqte")[0];
		//recuperar el paquete para eliminarlo
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		ArrayList<PaqueteXOTBean> paquetes = ordenTrabajo.getArrPaquetesXOT();
		
		for(PaqueteXOTBean pqt:paquetes){
			if(pqt.getStrCodPaquete().equals(strCodPaquete)){
				paquetes.remove(pqt);
				break;
			}
		}
		
		//actualizamos la sesion
		session.put("b_ordentrabajo", ordenTrabajo);
		
		return "exito";
	}
	
	
	public String generarOT() throws Exception {
		
		//obtener la orden de trabajo a guardar de la sesión
		OrdenTrabajoBean ordenTratajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		
		//verificar que se haya asignado a cada paquete los técnicos requeridos
		for(PaqueteXOTBean pqot: ordenTratajo.getArrPaquetesXOT()){
			if(pqot.getDtFechEjecOrdenTrabajo()==null){
				//request.put("mensajeErrorGenerarOrdenTrabajo", "Debe asignar técnicos a cada paquete de la orden de trabajo");
				request.put("mensajeErrorGenerarOrdenTrabajo", getText("pages.programartrabajo.generarot_p3.mensajeErrorGenerarOrdenTrabajo"));
				return "fracaso";
			}
		}
		
		ordenTratajo.setDtFechaOrdenTrabajo(new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
		try {
			OrdenTrabajoServiceI servicio = ProgramarTrabajoBusinessDelegate.getOrdenTrabajoService();
			servicio.generarOrdenTrabajo(ordenTratajo);
			//si todo va bien, registramos el bean ordenTrabajo en sesion
			session.put("b_ordentrabajo", ordenTratajo);
			
			//volvemos a refrescar los incidentes para que reflejen la información añadida a la bd
			RegistroIncidentesBean incidente = (RegistroIncidentesBean)session.get("b_incidente");
			
			//recuperamos el número de incidente y la razón social del cliente
			String strNumIncidente = incidente.getStrNumeroIncidente();
			request.put("razonsocialcliente", incidente.getStrRazonSocialCliente());
			
			IncidenteServiceI servicioIncidente = IncidenteBusinessDelegate.getIncidenteService();
			incidente = servicioIncidente.obtenerIncidente(strNumIncidente);

			//guardamos en la sesión
			session.put("b_incidente", incidente);
			
			return "exito";
		} catch (Exception e) {
			
			e.printStackTrace();
			request.put("mensajeErrorGenerarOrdenTrabajo", getText("pages.programartrabajo.generarot_p3.mensajeErrorGenerarOrdenTrabajo1"));
			
			return "fracaso";
		}
	}
	
	public String obtenerDatosHorasNecesarias()	throws Exception {
		
		String strCodPaquete = parameters.get("paqueteSeleccionado")[0];
		
		if(strCodPaquete.equals("")){
			
			numTecnicosNecesarios = null;
			numHorasNecesarias = null;
		
		}else{
			OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
			ArrayList<PaqueteXOTBean> paquetes = ordenTrabajo.getArrPaquetesXOT();
			
			for(PaqueteXOTBean pqt:paquetes){
				if(pqt.getStrCodPaquete().equals(strCodPaquete)){
					numTecnicosNecesarios = pqt.getIntNumeroTecnicosNecesarios();
					numHorasNecesarias = pqt.getIntNumeroHorasNecesarias();
					break;
				}
			}
		}
		
		return "exito";
	}
	
	
	public String buscarDisponibilidadTecnicos() throws Exception {
		
		session.put("b_disponibilidadtecnicos", null);
		fechaAtencion = null;
		horaInicio    = null;
		horaFin	      = null;
		
		
		//recupera la fecha y horas ingresadas por el usuario
		
		Date dtFechaAtencion = 	FormatoFecha.getFechaDe(tmp_FechaAtencion);
		Time tmHoraInicio 	 = 	FormatoFecha.getHoraDe(tmp_HoraInicio);
		Time tmHoraFin    	 = 	FormatoFecha.getHoraDe(tmp_HoraFin);
		
		if(dtFechaAtencion == null){
			//request.put("mensajeErrorBuscarDisponibilidadTecnicos", "Debe especificar la fecha de atención.");
			request.put("mensajeErrorBuscarDisponibilidadTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorBuscarDisponibilidadTecnicos"));
			return "exito";			
		}
		
		//verificar que la fecha de atencion sea mayor a la fecha actual
		dtFechaAtencion = FormatoFecha.getComponenteFecha(dtFechaAtencion);
		dtFechaAtencion = FormatoFecha.agregarHoraAFecha(dtFechaAtencion, tmp_HoraInicio);
		Date dtFechaActual = new Date();
		
		
//		System.out.println("fecha actual  : " + dtFechaActual);
//		System.out.println("fecha atencion: " + dtFechaAtencion);
		
		if(!dtFechaActual.equals(dtFechaAtencion) ){
			if(dtFechaActual.after(dtFechaAtencion)){
//				request.put("mensajeErrorBuscarDisponibilidadTecnicos", 
//						"La fecha de atención (" + FormatoFecha.formatearFecha(dtFechaAtencion, "dd/MM/yyyy hh:mm a") +
//						") debe ser posterior o igual a la fecha actual (" + 
//						FormatoFecha.formatearFecha(dtFechaActual, "dd/MM/yyyy hh:mm a") + ").");
				
				request.put("mensajeErrorBuscarDisponibilidadTecnicos",
						getText("pages.programartrabajo.generarot_p3.mensajeErrorBuscarDisponibilidadTecnicos1", 
						new String[]{FormatoFecha.formatearFecha(dtFechaAtencion, "dd/MM/yyyy hh:mm a"), 
								FormatoFecha.formatearFecha(dtFechaActual, "dd/MM/yyyy hh:mm a")})); 

				return "exito";			
			}
		}
		
		if(!tmHoraInicio.before(tmHoraFin)){
			//request.put("mensajeErrorBuscarDisponibilidadTecnicos", "La hora inicio debe ser menor que la hora final");
			request.put("mensajeErrorBuscarDisponibilidadTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorBuscarDisponibilidadTecnicos3"));
			return "exito";			
		}
		
		TecnicoServiceI servicio = ProgramarTrabajoBusinessDelegate.getTecnicoService();
		
		ArrayList<TecnicoBean> arr = servicio.listarTecnicos(new java.sql.Date(dtFechaAtencion.getTime()), tmHoraInicio, tmHoraFin);
		
		session.put("b_disponibilidadtecnicos", arr);
		
		//seteamos la fechaAtencion, horaInicio, horaFin
		
		if(arr.size()>0){
			//solo si la busqueda devuelve tecnicos, se setea estas variables
			fechaAtencion = tmp_FechaAtencion;
			horaInicio    = tmp_HoraInicio;
			horaFin	      = tmp_HoraFin;
		}
		
		return "exito";
	}
	
	@SuppressWarnings("unchecked")
	public String asignarTecnicosAPaquete()	throws Exception {
		
		//System.out.println("paquete seleccionado" + paqueteSeleccionado);
		
		//verificamos si se ha seleccionado un paquete de servicio
		if(paqueteSeleccionado.equals("")){
			//request.put("mensajeErrorAsignarTecnicos", "Debe seleccionar un paquete de servicio");
			request.put("mensajeErrorAsignarTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos"));
			return "exito";
		}
		
		//recuperamos los códigos de los técnicos seleccionados
		String[] strCodTecnicosSeleccionados = parameters.get("seleccionTecnicos");
		
		//verificamos si se ha seleccionado algún técnico
		if(strCodTecnicosSeleccionados==null){
			/* si strCodTecnicosSeleccionados es null puede significar significa que 
			 * 1) no se ha seleccionado tecnicos o 
			 * 2) no se ha buscado tecnicos (lista vacia)
			 * */
			if (fechaAtencion.equals("")){
				//campo fecha vacio indica que no se ha buscado tecnicos
//				request.put("mensajeErrorAsignarTecnicos", "Debe buscar los técnico disponibles " + 
//						"(para ello especifique la fecha de atención, hora de inicio y " + 
//						"hora de fin y presione el botón buscar");
				request.put("mensajeErrorAsignarTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos1"));
				
				return "exito";
			}else{
				//campo fecha no vacio indica que se ha buscado tecnicos, pero no se selecciono ninguno
				//request.put("mensajeErrorAsignarTecnicos", "Debe seleccionar al menos " + numTecnicosNecesarios + " técnicos");
				request.put("mensajeErrorAsignarTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos2",
						new String[]{numTecnicosNecesarios.toString()}));
				return "exito";
			}
			
		} else {
			//si se ha seleccionado técnicos, verificar que su número sea al menos el indicado
			//por el número de técnicos necesarios descrito por el paquete de servicio
			if(numTecnicosNecesarios>strCodTecnicosSeleccionados.length){
				//request.put("mensajeErrorAsignarTecnicos", "Debe seleccionar al menos " + numTecnicosNecesarios + " técnicos");
				request.put("mensajeErrorAsignarTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos2",
						new String[]{numTecnicosNecesarios.toString()}));
				return "exito";
			}
		}
		
		//System.out.println("paso la verificacion de tecnicos");
		//recuperamos la fecha de atención, la hora de inicio y la hora fin
		//si se han seleccionado tecnicos, implica que se ha seteado fechaAtencion, horaInicio y horaFin
		
		Date dtFechAtencion = FormatoFecha.getFechaDe(fechaAtencion);
		dtFechAtencion = FormatoFecha.agregarHoraAFecha(dtFechAtencion, horaInicio);
		Date dtFechaActual  = new Date();
		Time tmHoraIni 		= FormatoFecha.getHoraDe(horaInicio);
		Time tmHoraFin 		= FormatoFecha.getHoraDe(horaFin);
		
		//verificamos las fechas, puesto que puede haber avanzado la fecha actual y sobrepasado
		//la fecha de atencion
		
		if(!dtFechaActual.equals(dtFechAtencion) ){
			if(dtFechaActual.after(dtFechAtencion)){
//				request.put("mensajeErrorAsignarTecnicos", 
//						"La fecha de atención (" + FormatoFecha.formatearFecha(dtFechAtencion, "dd/MM/yyyy hh:mm a") +
//						") debe ser posterior o igual a la fecha actual (" + 
//						FormatoFecha.formatearFecha(dtFechaActual, "dd/MM/yyyy hh:mm a") + "). " + 
//						"Vuela a realizar la búsqueda de técnicos disponibles con la fecha y horas correctas");
				request.put("mensajeErrorAsignarTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos3", 
						new String[]{FormatoFecha.formatearFecha(dtFechAtencion, "dd/MM/yyyy hh:mm a"), 
						FormatoFecha.formatearFecha(dtFechaActual, "dd/MM/yyyy hh:mm a")}));

				return "exito";			
			}
		}
		
		//ya no verificamos las horas puesto que esto se verifico al buscar la disponibilidad
/*		if(!tmHoraIni.before(tmHoraFin)){
			request.put("mensajeErrorAsignarTecnicos", "La hora de inicio debe ser menor que la hora final");
			return "exito";
		}
*/		
		//verificamos si el numero de horas es al menos el indicado por el paquete
		int intHorasEscogidas = FormatoFecha.getDiffHoras(tmHoraIni, tmHoraFin);
		if(intHorasEscogidas < numHorasNecesarias){
			//request.put("mensajeErrorAsignarTecnicos", "El número de horas seleccionadas debe ser igual o mayor al número de horas indicado por el paquete");
			request.put("mensajeErrorAsignarTecnicos", getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos4"));
			return "exito";
		}
		
		//recuperamos la orden de trabajo
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		
		//recuperamos los beans asociados a los técnicos disponibles
		ArrayList<TecnicoBean> arrTecnicosDisponibles = 
				(ArrayList<TecnicoBean>) session.get("b_disponibilidadtecnicos");
		
		//recuperamos a los técnicos seleccionados
		ArrayList<TecnicoBean> arrTecnicosSeleccionados = new ArrayList<TecnicoBean>();

		for(String strCod:strCodTecnicosSeleccionados){
			for(TecnicoBean tco: arrTecnicosDisponibles){
				if(tco.getStrCodTecnico().equals(strCod)){
					arrTecnicosSeleccionados.add(tco);
					break;
				}
			}
		}
		
		//recuperamos la lista de paquetes de la orden de trabajo
		ArrayList<PaqueteXOTBean> paquetesDeOrdenTrabajo = ordenTrabajo.getArrPaquetesXOT();
		
		//recuperamos el paquete seleccionado
		PaqueteXOTBean beanPaqueteSeleccionado = null;
		for(PaqueteXOTBean pq: paquetesDeOrdenTrabajo){
			if(pq.getStrCodPaquete().equals(paqueteSeleccionado)){
				beanPaqueteSeleccionado = pq;
				break;
			}
		}
		
		//verificamos si no hay superposición de fecha, hora y técnicos
		for(PaqueteXOTBean pq: paquetesDeOrdenTrabajo){
			//System.out.println("paq. en OT:" + pq.getCodPaquete() + ", paq. selec:" + paqueteSeleccionado.getCodPaquete());
			if(!pq.equals(paqueteSeleccionado)){
				//System.out.println("Fech Aten OT selecc:" + dtFechAtencion + ", Fech Aten en OT:" + pq.getFechEjecOrdenTrabajo());
				if(dtFechAtencion.equals(pq.getDtFechEjecOrdenTrabajo())){
					//determinar si hay superposición de horas
					Time hA0 = tmHoraIni;
					Time hB0 = tmHoraFin;
					Time hA1 = pq.getTmHoraInicio();
					Time hB1 = pq.getTmHoraFin();
					if((hA0.compareTo(hA1)<=0 && hA1.compareTo(hB0)<=0) ||
					   (hA1.compareTo(hA0)<=0 && hB0.compareTo(hB1)<=0) ||
					   (hA0.compareTo(hB1)<=0 && hB1.compareTo(hB0)<=0) ||
					   (hA0.compareTo(hA1)<=0 && hB1.compareTo(hB0)<=0)){
						//si existe superposición de horas, verificar si al menos
						//un técnico está comprometido
						for(TecnicoBean tcoSelec: arrTecnicosSeleccionados){
							for(TecnicoBean tcoEnPaquete: pq.getArrTecnicosAsignados()){
								if(tcoSelec.getStrCodTecnico().equals(tcoEnPaquete.getStrCodTecnico())){
//									request.put("mensajeErrorAsignarTecnicos", 
//									  String.format("El técnico con código %1$s ya fué asignado al paquete %2$s", 
//									  tcoSelec.getStrCodTecnico(), pq.getStrCodPaquete()));
									request.put("mensajeErrorAsignarTecnicos", 
											getText("pages.programartrabajo.generarot_p3.mensajeErrorAsignarTecnicos5", 
											new String[]{tcoSelec.getStrCodTecnico(),pq.getStrCodPaquete()}));

									return "exito";
								}
							}
						}
					}
				}
			}
		}
		
		//vaciamos la lista de técnicos para proceder a llenarlo con otros nuevos
		//System.out.println("llegue hasta aqui...");
		beanPaqueteSeleccionado.getArrTecnicosAsignados().clear();
		
		//llenamos la lista de técnicos asignados al paquete seleccionado
		for(TecnicoBean tco: arrTecnicosSeleccionados){
			beanPaqueteSeleccionado.getArrTecnicosAsignados().add(tco);
		}
		
		//establecemos la fecha de atención y horas de inicio y fin del paquete seleccionado
		beanPaqueteSeleccionado.setDtFechEjecOrdenTrabajo(new java.sql.Date(dtFechAtencion.getTime()));
		beanPaqueteSeleccionado.setTmHoraInicio(tmHoraIni);
		beanPaqueteSeleccionado.setTmHoraFin(tmHoraFin);
		
		//guardamos la orden de trabajo en la sesion
		session.put("b_ordentrabajo", ordenTrabajo);
		
		return "exito";
	}
	
	public String quitarAsignacionDeTecnicosDePaqueteXOT() throws Exception {
		
		String strCodPaquete = parameters.get("codPaq")[0];
		
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		
		//recuperamos el paquete
		//recuperamos la lista de paquetes de la orden de trabajo
		ArrayList<PaqueteXOTBean> paquetesDeOrdenTrabajo = ordenTrabajo.getArrPaquetesXOT();
		
		//recuperamos el paquete seleccionado
		PaqueteXOTBean paquete = null;
		for(PaqueteXOTBean pq: paquetesDeOrdenTrabajo){
			if(pq.getStrCodPaquete().equals(strCodPaquete)){
				paquete = pq;
				break;
			}
		}
		
		//quitamos la información de los técnicos y el horario asignado
		paquete.setDtFechEjecOrdenTrabajo(null);
		paquete.setTmHoraInicio(null);
		paquete.setTmHoraFin(null);
		
		paquete.getArrTecnicosAsignados().clear();
		
		//registramos las modificaciones en la sesion
		session.put("b_ordentrabajo", ordenTrabajo);
		
		return "exito";
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}
	
}
