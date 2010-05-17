package com.maskiner.smc.logistica.service;

import java.util.List;

import com.maskiner.smc.logistica.bean.MaterialBean;
import com.maskiner.smc.logistica.bean.TipoMaterialBean;

public interface MaterialServiceI {
	
	public abstract List<TipoMaterialBean> obtenerTiposMateriales() throws Exception;
	
	public abstract List<MaterialBean> buscarMateriales(int codTipoMaterial, String descripcion) throws Exception;
	
	public abstract MaterialBean obtenerMaterial(String codMaterial) throws Exception;

}
