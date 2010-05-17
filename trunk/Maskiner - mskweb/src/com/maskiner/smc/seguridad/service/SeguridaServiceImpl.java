package com.maskiner.smc.seguridad.service;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.seguridad.bean.UsuarioBean;
import com.maskiner.smc.seguridad.dao.SeguridadDAO;


public class SeguridaServiceImpl implements SeguridadServiceI {
	
	private SeguridadDAO seguridadDAO;
	
	public SeguridaServiceImpl() {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		seguridadDAO = factoria.getSeguridadDAO();
	}

	@Override
	public UsuarioBean validar(String username, String password)
			throws Exception {
		return seguridadDAO.validar(username, password);
	}

}
