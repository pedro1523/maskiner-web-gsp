package com.maskiner.smc.maestroclientes.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.maestroclientes.bean.SucursalBean;
import com.maskiner.smc.mylib.MySqlDbConn;


public class MySqlMaestroClientesDAO implements MaestroClientesDAO {

	public ArrayList<ClienteBean> buscarPorCliente(String razSocCliente) throws Exception {
		
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{call pr_buscarClientes(?)}");
		st.setString(1, razSocCliente);
		ResultSet rs = st.executeQuery();
		ArrayList<ClienteBean> arr = new ArrayList<ClienteBean>();
		while(rs.next()){
			ClienteBean r = new ClienteBean();
			r.setStrCodCliente(rs.getString("cod_cli"));
			r.setDtFecRegCliente(rs.getDate("fec_reg_cli"));
			r.setStrCodRegistrador(rs.getString("cod_reg"));
			r.setStrRucCliente(rs.getString("ruc_cli"));
			r.setStrRazSocCliente(rs.getString("raz_soc_cli"));
			r.setStrEmailCliente(rs.getString("email_cli"));
			r.setStrDesCliente(rs.getString("desc_cli"));
			
			arr.add(r);
		}
		cn.close();
		
		return arr;
	}
	
	public ClienteBean obtenerClientePK(String CodCliente) throws Exception {

		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{call pr_obtenerCliente(?)}");
		CallableStatement st2 = cn.prepareCall("{call pr_obtenerSucursalesXCliente(?)}");
		
		st.setString(1, CodCliente);
		st2.setString(1, CodCliente);
		
		ResultSet rs = st.executeQuery();
		ResultSet rs2 = st2.executeQuery();
		
		ClienteBean cliente = new ClienteBean();
		if(rs.next()){
			cliente.setStrCodCliente(rs.getString("cod_cli"));
			cliente.setDtFecRegCliente(rs.getDate("fec_reg_cli"));
			cliente.setStrCodRegistrador(rs.getString("cod_reg"));
			cliente.setStrRucCliente(rs.getString("ruc_cli"));
			cliente.setStrRazSocCliente(rs.getString("raz_soc_cli"));
			cliente.setStrEmailCliente(rs.getString("email_cli"));
			cliente.setStrDesCliente(rs.getString("desc_cli"));			
		}
		ArrayList<SucursalBean> sucursales = new ArrayList<SucursalBean>();
		
		while(rs2.next()){
			SucursalBean sucursal = new SucursalBean();
			sucursal.setStrNumSucursal(rs2.getString("num_suc"));
			sucursal.setStrDescDistrito(rs2.getString("desc_tab"));
			sucursales.add(sucursal);
		}
			cliente.setArrSucursalBean(sucursales);
		
		cn.close();
		
		return cliente;		
	}

}
