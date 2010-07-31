package com.maskiner.smc.logistica.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.mylib.MySqlDbConn;

public class MySqlTablaDeTablasDAO implements TablaDeTablasDAO {

	public List<TablaDeTablasBean> listarNaturalezaAverias() throws Exception {

		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_listarNatAverias() }");

		ResultSet rs = st.executeQuery();
		
		ArrayList<TablaDeTablasBean> arr = new ArrayList<TablaDeTablasBean>();
		
		while (rs.next()) {
			TablaDeTablasBean reg = new TablaDeTablasBean();
			reg.setIntCodItemTabla(rs.getInt("cod_averia"));
			reg.setStrDescTabla(rs.getString("desc_averia"));
						
			arr.add(reg);
		}
		
		cn.close();
		
		return arr;
	}
	
}
