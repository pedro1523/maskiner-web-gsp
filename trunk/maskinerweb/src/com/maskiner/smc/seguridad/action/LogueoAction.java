package com.maskiner.smc.seguridad.action;

import java.util.Map;

import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.maskiner.smc.seguridad.service.SeguridadBusinessDelegate;
import com.maskiner.smc.seguridad.service.SeguridadServiceI;
import com.opensymphony.xwork2.ActionContext;


public class LogueoAction {
	
	private String usuario;
	private String password;
	private String mensaje;


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
				Map<String, Object> sesion = ActionContext.getContext().getSession();
				sesion.put("usuariologueado", beanUsuario);
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
		return "exito";
	}
	
	
}
