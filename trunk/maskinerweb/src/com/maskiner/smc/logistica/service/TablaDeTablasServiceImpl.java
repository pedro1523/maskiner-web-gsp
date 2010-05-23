package com.maskiner.smc.logistica.service;

import java.util.ArrayList;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.logistica.dao.TablaDeTablasDAO;
import com.maskiner.smc.gestionarincidentes.dao.IncidenteDAO;

public class TablaDeTablasServiceImpl implements TablaDeTablasServiceI {
	
	
	public ArrayList<TablaDeTablasBean> listarNaturalezaAverias()
		throws Exception {
		DAOFactory factoria = DAOFactory.getDAOFactory();
		TablaDeTablasDAO tablaTablasDAO = factoria.getTablaDeTablasDAO();

		ArrayList<TablaDeTablasBean> averias = (ArrayList<TablaDeTablasBean>)tablaTablasDAO.listarNaturalezaAverias();

		return averias;
		
}
	
}
