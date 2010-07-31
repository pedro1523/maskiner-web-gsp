package com.maskiner.smc.seguridad.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RolesInterceptor;

import com.maskiner.smc.seguridad.bean.UsuarioBean;

public class MSKRolesInterceptor extends RolesInterceptor {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2436766463617499972L;
	private List<String> allowedRoles = new ArrayList<String>();
	private List<String> disallowedRoles = new ArrayList<String>(); 
	
	public void setAllowedRoles(String roles) {
		this.allowedRoles = stringToList(roles);
	}

	public void setDisallowedRoles(String roles) {
		this.disallowedRoles = stringToList(roles);
	}

	@Override
	protected boolean isAllowed(HttpServletRequest request, Object action) {
		UsuarioBean usuario=null;
		
		try {
			usuario = (UsuarioBean) request.getSession().getAttribute("usuariologueado");
		} catch (Exception e) {
			// nada
		}
		
		if(usuario==null) return false;

		if (allowedRoles.size() > 0) {
			boolean result = false;
			for (String role : allowedRoles) {
				if (usuario.tieneRol(role)) {
					result = true;
				}
			}
			return result;
		} else if (disallowedRoles.size() > 0) {
			for (String role : disallowedRoles) {
				if (usuario.tieneRol(role)) {
					return false;
				}
			}
		}
		return true;

	}

}
