package com.maskiner.smc.programartrabajo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;

import com.maskiner.smc.mylib.MySqlDbConn;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;

public class MySqlTecnicoDAO implements TecnicoDAO {
	
	public TecnicoBean obtenerTecnico(String strCodigo) throws Exception{		
		
		TecnicoBean tecnico=null;			
		Connection cn=MySqlDbConn.obtenerConexion();
		ResultSet rs=null;
		CallableStatement st=cn.prepareCall("{ call pr_obtenerTecnico(?) }");
		st.setString(1,strCodigo);
		rs=st.executeQuery();
		
		while(rs.next()){
			tecnico=new TecnicoBean();
			tecnico.setStrCodTecnico(rs.getString(1));
			tecnico.setStrApellidoPaterno(rs.getString(2));
			tecnico.setStrApellidoMaterno(rs.getString(3));
			tecnico.setStrNombre(rs.getString(4));
			tecnico.setIntNivelTecnico(rs.getInt(5));
			tecnico.setIntEspecialidadTecnico(rs.getInt(6));
			tecnico.setIntEstadoTecnico(rs.getInt(7));				
		}			
		return tecnico;
	}

	public ArrayList<TecnicoBean> listarTecnicos(String strFecInspeccion,
								String strHoraIncio,String strHoraFin)throws Exception{
	
		ArrayList<TecnicoBean> lista=new ArrayList<TecnicoBean>();
		TecnicoBean tecnico=null;
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_buscarDisponibilidadTecnicos(?, ?, ?) }");
			
		st.setString(1,strFecInspeccion);
		st.setString(2,strHoraIncio);
		st.setString(3,strHoraFin);
		ResultSet rs=st.executeQuery();
		while(rs.next()){		
			tecnico=new TecnicoBean();
			tecnico.setStrCodTecnico(rs.getString(1));
			tecnico.setStrApellidoPaterno(rs.getString(2));
			tecnico.setStrApellidoMaterno(rs.getString(3));
			tecnico.setStrNombre(rs.getString(4));
			tecnico.setStrDescripcionEspecialidad(rs.getString(5));
			lista.add(tecnico);			
		}		
		return lista;
}

	@Override
	public ArrayList<TecnicoBean> listarTecnicos(Date fecInspeccion,
			Time horaIncio, Time horaFin) throws Exception {
		ArrayList<TecnicoBean> lista=new ArrayList<TecnicoBean>();
		TecnicoBean tecnico=null;
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_buscarDisponibilidadTecnicos1(?, ?, ?) }");
			
		st.setDate(1,fecInspeccion);
		st.setTime(2,horaIncio);
		st.setTime(3,horaFin);
		ResultSet rs=st.executeQuery();
		while(rs.next()){		
			tecnico=new TecnicoBean();
			tecnico.setStrCodTecnico(rs.getString("cod_tco"));
			tecnico.setStrApellidoPaterno(rs.getString("ape_pat_tco"));
			tecnico.setStrApellidoMaterno(rs.getString("ape_mat_tco"));
			tecnico.setStrNombre(rs.getString("nom_tco"));
			tecnico.setStrDescripcionEspecialidad(rs.getString("espec_tco"));
			tecnico.setStrDescripcionNivelTecnico(rs.getString("niv_tco"));
			tecnico.setIntNumeroHorasTrabajadasSemana(rs.getInt("hor_trab"));
			lista.add(tecnico);			
		}		
		return lista;
	}
}
