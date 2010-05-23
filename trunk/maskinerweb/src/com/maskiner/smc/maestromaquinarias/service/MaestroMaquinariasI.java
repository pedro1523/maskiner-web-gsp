package com.maskiner.smc.maestromaquinarias.service;

import java.util.ArrayList;

import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;

public interface MaestroMaquinariasI {

	public ArrayList<MaquinariaSucursalBean> buscarMaquinariaXSucursal(String codCliente, String codSucursal)throws Exception;
}
