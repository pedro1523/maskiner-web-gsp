package com.maskiner.smc.programartrabajo.service;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;
import com.maskiner.smc.programartrabajo.dao.TecnicoDAO;



public class TecnicoServiceImpl implements TecnicoServiceI {
	
public TecnicoDAO tecnicoDAO;
	
	public  TecnicoServiceImpl(){
		DAOFactory factory=DAOFactory.getDAOFactory();
		tecnicoDAO=factory.getTecnicoDAO();
	}
	
	public TecnicoBean obtenerTecnico(String codigo) throws Exception{
		return tecnicoDAO.obtenerTecnico(codigo);
	}
	
	public ArrayList<TecnicoBean> listarTecnicos(String strFecInspeccion,
			String strHoraIncio,String strHoraFin)throws Exception{
		return tecnicoDAO.listarTecnicos(strFecInspeccion, strHoraIncio, strHoraFin);
	}

	@Override
	public ArrayList<TecnicoBean> listarTecnicos(Date fecInspeccion,
			Time horaIncio, Time horaFin) throws Exception {
		return tecnicoDAO.listarTecnicos(fecInspeccion, horaIncio, horaFin);
	}

}
