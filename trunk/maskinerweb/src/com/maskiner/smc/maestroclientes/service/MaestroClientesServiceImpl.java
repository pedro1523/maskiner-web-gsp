package com.maskiner.smc.maestroclientes.service;

import java.util.ArrayList;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestroclientes.dao.MaestroClientesDAO;
import com.maskiner.smc.factory.DAOFactory;

public class MaestroClientesServiceImpl implements MaestroClientesI {
	
	private MaestroClientesDAO maestroClientesDAO;
	
	public MaestroClientesServiceImpl() {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		maestroClientesDAO = factoria.getMaestroClientesDAO();
	}


	public ArrayList<ClienteBean> buscarPorCliente(String empresa)
			throws Exception {
		return maestroClientesDAO.buscarPorCliente(empresa);
	}
	
	public ClienteBean obtenerClientePK(String cod_cli) 
	throws Exception {
		return maestroClientesDAO.obtenerClientePK(cod_cli);
	}
}
