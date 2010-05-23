package com.maskiner.smc.seguridad.service;

import com.maskiner.smc.seguridad.bean.UsuarioBean;

public interface SeguridadServiceI {
	
	public UsuarioBean validar(String username, String password) throws Exception;

}
