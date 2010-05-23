package com.maskiner.smc.maestroclientes.dao;

import java.util.ArrayList;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;

public interface MaestroClientesDAO {
	
	ArrayList<ClienteBean> buscarPorCliente(String razSocCliente) throws Exception;
	
	ClienteBean obtenerClientePK(String strCodCliente) throws Exception;
}
