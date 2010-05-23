package com.maskiner.smc.liquidartrabajo.service;

import java.util.ArrayList;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.liquidartrabajo.bean.LiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.TecnicosXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.dao.LiquidacionDAO;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;

public class LiquidacionServiceImpl implements LiquidacionServiceI {
	
	@Override
	public MaquinariaSucursalBean obtenerMaquinariaXOT(String numOT)
			throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		LiquidacionDAO liquidacionDAO = factoria.getLiquidacionDAO();
		
		MaquinariaSucursalBean liq = liquidacionDAO.obtenerMaquinariaXOT(numOT);
		
		return liq;
	}

	@Override
	public ArrayList<TecnicosXLiquidacionBean> obtenerTecnicosXOT(String numOT)
			throws Exception {
		
		DAOFactory factoria = DAOFactory.getDAOFactory();
		LiquidacionDAO liquidacionDAO = factoria.getLiquidacionDAO();
		
		ArrayList<TecnicosXLiquidacionBean> arr = liquidacionDAO.obtenerTecnicosXOT(numOT);
		
		return arr;
	}

	@Override
	public String RegistrarLiquidacionYDetalle(LiquidacionBean bean,
			ArrayList<MaterialesXLiquidacionBean> mat,
			ArrayList<TecnicosXLiquidacionBean> tec) throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		LiquidacionDAO liquidacionDAO = factoria.getLiquidacionDAO();
		
		return liquidacionDAO.RegistrarLiquidacionYDetalle(bean, mat,tec);
	}
	
}
