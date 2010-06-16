package com.maskiner.smc.programartrabajo.action;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
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
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProgramarTrabajoAction extends ActionSupport implements RequestAware, SessionAware, ParameterAware {
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String[]> parameters;
	
	private Integer numTecnicosNecesarios;
	private Integer numHorasNecesarias;
	private String paqueteSeleccionado;
	

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
		
/*		request.getSession().setAttribute("b_disponibilidadtecnicos", null);
*/		
		return "exito";
	}
	
	
	public String cargarGenerarOTPaso3() throws Exception {
		
		//verificar que no se pasa al paso 3 sin haber asignado al menos un paquete a la o/t
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) session.get("b_ordentrabajo");
		if(ordenTrabajo.getArrPaquetesXOT().size()==0){
			request.put("mensajeerror1", "Al menos debe asignar un paquete a la orden de trabajo");
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
		
/*		//obtener la orden de trabajo a guardar de la sesión
		OrdenTrabajoBean ordenTratajo = (OrdenTrabajoBean) request.getSession().getAttribute("b_ordentrabajo");
		
		//verificar que se haya asignado a cada paquete los técnicos requeridos
		for(PaqueteXOTBean pqot: ordenTratajo.getArrPaquetesXOT()){
			if(pqot.getDtFechEjecOrdenTrabajo()==null){
				request.setAttribute("mensajeErrorGenerarOrdenTrabajo", "Debe asignar técnicos a cada paquete de la orden de trabajo");
				return mapping.findForward("fracaso");
			}
		}
		
		ordenTratajo.setDtFechaOrdenTrabajo(new Date(Calendar.getInstance().getTimeInMillis()));
		try {
			OrdenTrabajoServiceI servicio = ProgramarTrabajoBusinessDelegate.getOrdenTrabajoService();
			servicio.generarOrdenTrabajo(ordenTratajo);
			//si todo va bien, registramos el bean ordenTrabajo en sesion
			request.getSession().setAttribute("b_ordentrabajo", ordenTratajo);
			
			//volvemos a refrescar los incidentes para que reflejen la información añadida a la bd
			RegistroIncidentesBean incidente = (RegistroIncidentesBean)request.getSession().getAttribute("b_incidente");
			
			//recuperamos el número de incidente y la razón social del cliente
			String strNumIncidente = incidente.getStrNumeroIncidente();
			request.setAttribute("razonsocialcliente", incidente.getStrRazonSocialCliente());
			
			IncidenteServiceI servicioIncidente = IncidenteBusinessDelegate.getIncidenteService();
			incidente = servicioIncidente.obtenerIncidente(strNumIncidente);

			//guardamos en la sesión
			request.getSession().setAttribute("b_incidente", incidente);
			
			return mapping.findForward("exito");
		} catch (Exception e) {
			request.setAttribute("mensajeErrorGenerarOrdenTrabajo", e.getMessage());
			return mapping.findForward("fracaso");
		}
*/	
		return null;
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
		
/*		Date dtFechaAtencion = FormatoFecha.getFechaDe(request.getParameter("fechaAtencion"));
		Time tmHoraInicio = FormatoFecha.getHoraDe(request.getParameter("horaInicio"));
		Time tmHoraFin    = FormatoFecha.getHoraDe(request.getParameter("horaFin"));
		
		if(!tmHoraInicio.before(tmHoraFin)){
			request.setAttribute("mensajeErrorBuscarDisponibilidadTecnicos", "La hora inicio debe ser menor que la hora final");
			return mapping.findForward("exito");			
		}
		
		TecnicoServiceI servicio = ProgramarTrabajoBusinessDelegate.getTecnicoService();
		
		ArrayList<TecnicoBean> arr = servicio.listarTecnicos(dtFechaAtencion, tmHoraInicio, tmHoraFin);
		
		request.getSession().setAttribute("b_disponibilidadtecnicos", arr);
*/		
		return "exito";
	}
	
	@SuppressWarnings("unchecked")
	public String asignarTecnicosAPaquete()	throws Exception {
		
/*		//requperamos el código de paquete seleccionado
		String strCodPaqueteSeleccionado = request.getParameter("paqueteSeleccionado");
		
		//verificamos si se ha seleccionado un paquete de servicio
		if(strCodPaqueteSeleccionado.equals("")){
			request.setAttribute("mensajeErrorAsignarTecnicos", "Debe seleccionar un paquete de servicio");
			return mapping.findForward("exito");
		}
		
		//recuperamos los códigos de los técnicos seleccionados
		String[] strCodTecnicosSeleccionados = request.getParameterValues("seleccionTecnicos");
		
		//verificamos si se ha seleccionado algún técnico
		if(strCodTecnicosSeleccionados==null){
			request.setAttribute("mensajeErrorAsignarTecnicos", "Debe seleccionar al menos un técnico");
			return mapping.findForward("exito");
		} else {
			//si se ha seleccionado técnicos, verificar que su número sea al menos el indicado
			//por el número de técnicos necesarios descrito por el paquete de servicio
			int intNumTecnicosNecesarios = Integer.parseInt(request.getParameter("numtecnicosnecesarios"));
			if(intNumTecnicosNecesarios>strCodTecnicosSeleccionados.length){
				request.setAttribute("mensajeErrorAsignarTecnicos", "Debe seleccionar al menos " + intNumTecnicosNecesarios + " técnicos");
				return mapping.findForward("exito");
			}
		}
		
		//recuperamos la fecha de atención, la hora de inicio y la hora fin
		Date dtFechAtencion = FormatoFecha.getFechaDe(request.getParameter("fechaAtencion"));
		Time tmHoraIni 		= FormatoFecha.getHoraDe(request.getParameter("horaInicio"));
		Time tmHoraFin 		= FormatoFecha.getHoraDe(request.getParameter("horaFin"));
		
		//verificamos si la hora de inicio < hora final
		if(!tmHoraIni.before(tmHoraFin)){
			request.setAttribute("mensajeErrorAsignarTecnicos", "La hora de inicio debe ser menor que la hora final");
			return mapping.findForward("exito");
		}
		
		//verificamos si el numero de horas es al menos el indicado por el paquete
//		int intNumHorasNecesarias = Integer.parseInt(request.getParameter("numhorasnecesarias"));
//		if()
		
		//recuperamos la orden de trabajo
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) request.getSession().getAttribute("b_ordentrabajo");
		
		//recuperamos los beans asociados a los técnicos disponibles
		ArrayList<TecnicoBean> arrTecnicosDisponibles = 
				(ArrayList<TecnicoBean>) request.getSession().getAttribute("b_disponibilidadtecnicos");
		
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
		PaqueteXOTBean paqueteSeleccionado = null;
		for(PaqueteXOTBean pq: paquetesDeOrdenTrabajo){
			if(pq.getStrCodPaquete().equals(strCodPaqueteSeleccionado)){
				paqueteSeleccionado = pq;
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
									request.setAttribute("mensajeErrorAsignarTecnicos", 
									  String.format("El técnico con código %1$s ya fué asignado al paquete %2$s", 
									  tcoSelec.getStrCodTecnico(), pq.getStrCodPaquete()));
									return mapping.findForward("exito");
								}
							}
						}
					}
				}
			}
		}
		
		//vaciamos la lista de técnicos para proceder a llenarlo con otros nuevos
		paqueteSeleccionado.getArrTecnicosAsignados().clear();
		
		//llenamos la lista de técnicos asignados al paquete seleccionado
		for(TecnicoBean tco: arrTecnicosSeleccionados){
			paqueteSeleccionado.getArrTecnicosAsignados().add(tco);
		}
		
		//establecemos la fecha de atención y horas de inicio y fin del paquete seleccionado
		paqueteSeleccionado.setDtFechEjecOrdenTrabajo(dtFechAtencion);
		paqueteSeleccionado.setTmHoraInicio(tmHoraIni);
		paqueteSeleccionado.setTmHoraFin(tmHoraFin);
		
		//guardamos la orden de trabajo en la sesion
		request.getSession().setAttribute("b_ordentrabajo", ordenTrabajo);
*/		
		return "exito";
	}
	
	public String quitarAsignacionDeTecnicosDePaqueteXOT() throws Exception {
		
/*		String strCodPaquete = request.getParameter("codPaq");
		
		OrdenTrabajoBean ordenTrabajo = (OrdenTrabajoBean) request.getSession().getAttribute("b_ordentrabajo");
		
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
		request.getSession().setAttribute("b_ordentrabajo", ordenTrabajo);
*/		
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
