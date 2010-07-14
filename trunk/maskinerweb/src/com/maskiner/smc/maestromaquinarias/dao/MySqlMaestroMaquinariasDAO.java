package com.maskiner.smc.maestromaquinarias.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<MaquinariaSucursalBean> buscarMaquinarias(String razSocCliente,
			String marca, String modelo) throws Exception {
		Connection cn = MySqlDbConn.obtenerConexion();
		
		CallableStatement st = cn.prepareCall("{call pr_buscarMaquinarias(?,?,?)}");
		st.setString(1, razSocCliente);
		st.setString(2, marca);
		st.setString(3, modelo);
		
		ResultSet rs = st.executeQuery();
		ArrayList<MaquinariaSucursalBean> arr = new ArrayList<MaquinariaSucursalBean>();
		while(rs.next()){
			MaquinariaSucursalBean r = new MaquinariaSucursalBean();
			r.setStrNumTarjeta(rs.getString("num_tar"));
			r.setStrNumSerieMaquinaria(rs.getString("num_serie_maq"));
			r.setStrNumSucursal(rs.getString("num_suc"));
			r.setStrCodMaq(rs.getString("cod_maq"));
			r.setStrDescMaq(rs.getString("desc_maq"));
			r.setStrMarca(rs.getString("desc_mar_maq"));
			r.setStrModMaquinaria(rs.getString("mod_maq"));
			r.setStrDescTipMaq(rs.getString("desc_tip_maq"));
			r.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			r.setStrDistritoSucursal(rs.getString("sucursal"));
			arr.add(r);
		}
		cn.close();
		
		return arr;
	}

}
