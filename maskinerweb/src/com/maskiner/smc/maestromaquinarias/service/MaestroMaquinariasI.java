package com.maskiner.smc.maestromaquinarias.service;

import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;

public interface MaestroMaquinariasI {

	public ArrayList<MaquinariaSucursalBean> buscarMaquinariaXSucursal(String codCliente, String codSucursal)throws Exception;

	public List<MaquinariaSucursalBean> buscarMaquinarias(String razSocCliente, String marca, String modelo) throws Exception;
}
