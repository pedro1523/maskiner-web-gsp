package com.maskiner.smc.maestromaquinarias.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.mylib.MySqlDbConn;

public class MySqlMaestroMaquinariasDAO implements MaestroMaquinariasDAO{
	
	public ArrayList<MaquinariaSucursalBean> buscarMaquinariaXSucursal(String codCliente, String codSucursal) throws Exception {
		
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{call pr_buscarMaquinariaXSucursal(?,?)}");
		st.setString(1, codCliente);
		st.setString(2, codSucursal);
		
		ResultSet rs = st.executeQuery();
		ArrayList<MaquinariaSucursalBean> arr = new ArrayList<MaquinariaSucursalBean>();
		while(rs.next()){
			MaquinariaSucursalBean r = new MaquinariaSucursalBean();
			r.setStrNumTarjeta (rs.getString("num_tar"));
			r.setStrDescMaq(rs.getString("desc_maq"));
			r.setStrDesEstMaquinaria(rs.getString("desc_tab"));
			
			arr.add(r);
		}
		cn.close();
		
		return arr;
	}

}
