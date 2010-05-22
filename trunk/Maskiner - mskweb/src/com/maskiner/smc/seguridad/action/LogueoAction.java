package com.maskiner.smc.seguridad.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.maskiner.smc.seguridad.service.SeguridadBusinessDelegate;
import com.maskiner.smc.seguridad.service.SeguridadServiceI;
import com.opensymphony.xwork2.ActionContext;

public class LogueoAction {
	
	private String usuario;
	private String password;
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String login() {
		
		SeguridadServiceI servicio = SeguridadBusinessDelegate.getSeguridadService();
		UsuarioBean beanUsuario = null;
		try {
			beanUsuario = servicio.validar(usuario, password);
			Map<String, Object>	sesion = ActionContext.getContext().getSession();
			
			if(beanUsuario != null){
				

				//preguntamos el estado del usuario
				if(beanUsuario.getEstadoUsuario()==1){
					sesion.put("usuariologueado", beanUsuario);
					return "exito";
				}else {
					sesion.put("mensaje", "El usuario está inactivo.");
					return "fracaso";
				}
			}else{
				sesion.put("mensaje", "Usuario o password incorrectos");
				return "fracaso";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fracaso";
		}
		
		
	}
	
/*	public ActionForward login(ActionMapping mapping, ActionForm form,
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
*/	
	
}
