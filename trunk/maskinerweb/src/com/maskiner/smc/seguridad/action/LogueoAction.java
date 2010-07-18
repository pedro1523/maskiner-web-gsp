package com.maskiner.smc.seguridad.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.maskiner.smc.seguridad.service.SeguridadBusinessDelegate;
import com.maskiner.smc.seguridad.service.SeguridadServiceI;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class LogueoAction extends ActionSupport implements SessionAware {
	
	private String usuario;
	private String password;
	private String mensaje;
	private Map<String, Object> session;

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

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String login(){

		SeguridadServiceI servicio = SeguridadBusinessDelegate.getSeguridadService();
		UsuarioBean beanUsuario = null;
		try {
			beanUsuario = servicio.validar(getUsuario(), getPassword());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.setMensaje("Error de programa.");
			return "fracaso";
		}
		
		
		if(beanUsuario != null){
			
			//preguntamos el estado del usuario
			if(beanUsuario.getEstadoUsuario()==1){
				session.put("usuariologueado", beanUsuario);
				return "exito";
			}else {
				this.setMensaje("El usuario está inactivo.");
				return "fracaso";
			}
		}else{
			this.setMensaje("Usuario o password incorrectos.");
			return "fracaso";
		}
		

	}
	
	public String signOut() {
		
		
		session.remove("usuariologueado");
		return "exito";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

}
