package com.maskiner.smc.seguridad.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.maskiner.smc.seguridad.service.SeguridadBusinessDelegate;
import com.maskiner.smc.seguridad.service.SeguridadServiceI;


public class LogueoAction extends MappingDispatchAction {

	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		
		SeguridadServiceI servicio = SeguridadBusinessDelegate.getSeguridadService();
		UsuarioBean beanUsuario = servicio.validar(usuario, password);
		
		if(beanUsuario != null){
			HttpSession sesion = request.getSession(true);
			//preguntamos el estado del usuario
			if(beanUsuario.getEstadoUsuario()==1){
				sesion.setAttribute("usuariologueado", beanUsuario);
				return mapping.findForward("exito");
			}else {
				request.setAttribute("mensaje", "El usuario está inactivo.");
				return mapping.findForward("fracaso");
			}
		}else{
			request.setAttribute("mensaje", "Usuario o password incorrectos");
			return mapping.findForward("fracaso");
		}
		

	}
	
	public ActionForward signOut(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		return mapping.findForward("exito");
	}
	
	
}
