package com.maskiner.smc.logistica.service;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.logistica.service.TablaDeTablasServiceI;
import com.maskiner.smc.logistica.service.TablaDeTablasServiceImpl;


public class LogisticaBusinessDelegate {

	public static TablaDeTablasServiceI getTablaDeTablasService(){
		return new TablaDeTablasServiceImpl();
	}
	
	public static MaterialServiceI getMaterialService(){
		return new MaterialServiceImpl();
	}
}