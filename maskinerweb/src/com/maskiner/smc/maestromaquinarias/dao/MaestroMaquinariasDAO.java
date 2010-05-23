package com.maskiner.smc.maestromaquinarias.dao;

import java.util.ArrayList;

import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;

public interface MaestroMaquinariasDAO {
	
	public ArrayList<MaquinariaSucursalBean> buscarMaquinariaXSucursal(String codCliente, String codSucursal) throws Exception;


}
