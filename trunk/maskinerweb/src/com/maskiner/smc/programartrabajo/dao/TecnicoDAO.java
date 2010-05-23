package com.maskiner.smc.programartrabajo.dao;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import com.maskiner.smc.programartrabajo.bean.TecnicoBean;



public interface TecnicoDAO {

	public TecnicoBean obtenerTecnico(String strCodigo) throws Exception;
	public ArrayList<TecnicoBean> listarTecnicos(String strFecInspeccion,
			String strHoraIncio,String strHoraFin)throws Exception;
	public ArrayList<TecnicoBean> listarTecnicos(Date fecInspeccion,
			Time horaIncio, Time horaFin) throws Exception;

}
