package com.maskiner.smc.liquidartrabajo.service;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.liquidartrabajo.dao.MaterialesDAO;
import com.maskiner.smc.logistica.bean.MaterialBean;


public class MaterialesServiceImpl implements MaterialesServiceI {

	@Override
	public MaterialBean obtenerMaterial(String codMaterial) throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		MaterialesDAO materialesDAO = factoria.getMaterialesDAO();
		
		MaterialBean mat = materialesDAO.obtenerMaterial(codMaterial);
		
		return mat;
	}

}
