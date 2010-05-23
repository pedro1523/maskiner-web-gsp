package com.maskiner.smc.seguridad.dao;

import com.maskiner.smc.seguridad.bean.UsuarioBean;

public interface SeguridadDAO {

	UsuarioBean validar(String username, String password) throws Exception;

}
