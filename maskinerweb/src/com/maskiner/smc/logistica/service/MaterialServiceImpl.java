package com.maskiner.smc.logistica.service;

import java.util.List;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.liquidartrabajo.dao.MaterialesDAO;
import com.maskiner.smc.logistica.bean.MaterialBean;
import com.maskiner.smc.logistica.bean.TipoMaterialBean;

public class MaterialServiceImpl implements MaterialServiceI {
	
	DAOFactory factory = DAOFactory.getDAOFactory();
	MaterialesDAO materialesDAO = factory.getMaterialesDAO();
	
	@Override
	public List<MaterialBean> buscarMateriales(int codTipoMaterial,
			String descripcion) throws Exception {
		// TODO Auto-generated method stub
		return materialesDAO.buscarMateriales(codTipoMaterial, descripcion);
	}

	@Override
	public MaterialBean obtenerMaterial(String codMaterial) throws Exception {
		// TODO Auto-generated method stub
		return materialesDAO.obtenerMaterial(codMaterial);
	}

	@Override
	public List<TipoMaterialBean> obtenerTiposMateriales() throws Exception {
		// TODO Auto-generated method stub
		return materialesDAO.obtenerTiposMateriales();
	}

}
