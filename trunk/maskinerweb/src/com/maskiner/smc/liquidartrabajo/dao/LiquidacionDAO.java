package com.maskiner.smc.liquidartrabajo.dao;

import java.util.ArrayList;

import com.maskiner.smc.liquidartrabajo.bean.LiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.TecnicosXLiquidacionBean;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;

public interface LiquidacionDAO {

	public MaquinariaSucursalBean obtenerMaquinariaXOT(String numOT)throws Exception;
	
	public ArrayList<TecnicosXLiquidacionBean> obtenerTecnicosXOT(String numOT)
	throws Exception;
	
	public String RegistrarLiquidacionYDetalle(LiquidacionBean bean,
			ArrayList<MaterialesXLiquidacionBean> mat, ArrayList<TecnicosXLiquidacionBean> tec) throws Exception;
	
}
