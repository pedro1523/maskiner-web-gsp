package com.maskiner.smc.liquidartrabajo.service;

import com.maskiner.smc.logistica.bean.MaterialBean;

public interface MaterialesServiceI {

	public MaterialBean obtenerMaterial(String codMaterial) throws Exception;
}
