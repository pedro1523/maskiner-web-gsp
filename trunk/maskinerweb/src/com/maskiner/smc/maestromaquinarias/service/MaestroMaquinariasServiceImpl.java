package com.maskiner.smc.maestromaquinarias.service;

import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.maestromaquinarias.dao.MaestroMaquinariasDAO;

public class MaestroMaquinariasServiceImpl implements MaestroMaquinariasI {

	private MaestroMaquinariasDAO maestroMaquinariasDAO;
	
	public MaestroMaquinariasServiceImpl() {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		maestroMaquinariasDAO = factoria.getMaestroMaquinariasDAO();
	}
	
	public ArrayList<MaquinariaSucursalBean> buscarMaquinariaXSucursal(String codCliente, String codSucursal)throws Exception {
		return maestroMaquinariasDAO.buscarMaquinariaXSucursal(codCliente, codSucursal);
	}

	@Override
	public List<MaquinariaSucursalBean> buscarMaquinarias(String razSocCliente,
			String marca, String modelo) throws Exception {
		return maestroMaquinariasDAO.buscarMaquinarias(razSocCliente, marca, modelo);
	}
}
