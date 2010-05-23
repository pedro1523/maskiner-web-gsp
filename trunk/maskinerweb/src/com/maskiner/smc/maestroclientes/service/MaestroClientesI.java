package com.maskiner.smc.maestroclientes.service;

import java.util.ArrayList;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;

public interface MaestroClientesI {
	
	public ArrayList<ClienteBean> buscarPorCliente(String razSocCliente) throws Exception;

	public ClienteBean obtenerClientePK(String codCliente) throws Exception;
}
