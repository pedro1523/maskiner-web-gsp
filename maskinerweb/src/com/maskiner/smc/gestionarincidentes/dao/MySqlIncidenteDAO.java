package com.maskiner.smc.gestionarincidentes.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.OrdenDeTrabajoXIncidenteBean;
import com.maskiner.smc.gestionarincidentes.bean.RegistroIncidentesBean;
import com.maskiner.smc.logistica.bean.TablaDeTablasBean;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.mylib.MySqlDbConn;


public class MySqlIncidenteDAO implements IncidenteDAO {

	@Override
	public List<RegistroIncidentesBean> buscarIncidentes(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {

		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_buscarIncidentesPendientes(?, ?, ?) }");
		st.setString(1, nombreEmpresa);
		st.setDate(2, fechaIncidente);
		st.setString(3, descripcionIncidente);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<RegistroIncidentesBean> arr = new ArrayList<RegistroIncidentesBean>();
		
		while (rs.next()) {
			RegistroIncidentesBean reg = new RegistroIncidentesBean();
			reg.setStrCodigoCliente(rs.getString("cod_cli"));
			reg.setStrCodigoRegistrador(rs.getString("cod_reg"));
			reg.setIntEstadoIncidente(rs.getInt("est_inc"));
			reg.setDtFechaIncidente(rs.getDate("fec_inc"));
			reg.setStrLugarAtencionCliente(rs.getString("dir_suc"));
			reg.setStrDistritoAtencion(rs.getString("distr"));
			reg.setStrNumeroIncidente(rs.getString("num_inc"));
			reg.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			reg.setStrDescripcionIncidente(rs.getString("desc_inc"));
			
			arr.add(reg);
		}
		
		cn.close();
		
		return arr;
	}
	@Override
	public List<RegistroIncidentesBean> buscarIncidentesOTI(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {

		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_buscarIncidentesOTI(?, ?, ?) }");
		st.setString(1, nombreEmpresa);
		st.setDate(2, fechaIncidente);
		st.setString(3, descripcionIncidente);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<RegistroIncidentesBean> arr = new ArrayList<RegistroIncidentesBean>();
		
		while (rs.next()) {
			RegistroIncidentesBean reg = new RegistroIncidentesBean();
			reg.setStrCodigoCliente(rs.getString("cod_cli"));
			reg.setStrCodigoRegistrador(rs.getString("cod_reg"));
			reg.setIntEstadoIncidente(rs.getInt("est_inc"));
			reg.setDtFechaIncidente(rs.getDate("fec_inc"));
			reg.setStrLugarAtencionCliente(rs.getString("dir_suc"));
			reg.setStrDistritoAtencion(rs.getString("distr"));
			reg.setStrNumeroIncidente(rs.getString("num_inc"));
			reg.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			reg.setStrDescripcionIncidente(rs.getString("desc_inc"));
			
			arr.add(reg);
		}
		
		cn.close();
		
		return arr;
	}
	
	

	@Override
	public RegistroIncidentesBean obtenerIncidente(String numIncidente)
			throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerIncidentePendiente(?) }");
		st.setString(1, numIncidente);
		
		ResultSet rs = st.executeQuery();
		RegistroIncidentesBean reg = null;
		if (rs.next()) {
			reg = new RegistroIncidentesBean();
			reg.setStrCodigoCliente(rs.getString("cod_cli"));
			reg.setStrCodigoRegistrador(rs.getString("cod_reg"));
			reg.setIntEstadoIncidente(rs.getInt("est_inc"));
			reg.setDtFechaIncidente(rs.getDate("fec_inc"));
			reg.setStrLugarAtencionCliente(rs.getString("dir_suc"));
			reg.setStrDistritoAtencion(rs.getString("distr"));
			reg.setStrNumeroIncidente(rs.getString("num_inc"));
			reg.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			reg.setStrDescripcionIncidente(rs.getString("desc_inc"));
			
			//recupera las maquinarias x incidente
			st = cn.prepareCall("{ call pr_obtenerMaquinariaSucursalXIncidentePendiente(?) }");
			st.setString(1, numIncidente);
			ResultSet rs1 = st.executeQuery();
			while(rs1.next()){
				DetalleRegistroIncidenteBean detReg = new DetalleRegistroIncidenteBean();
				detReg.setIntNumeroItem(rs1.getInt("itm_aver"));
				detReg.setStrDescripcionAveria(rs1.getString("desc_aver"));
				detReg.setIntNaturalezaAveria(rs1.getInt("natur_aver"));
				detReg.setStrNumeroIncidente(rs1.getString("num_inc"));
				detReg.setStrNumeroTarjetaEquipo(rs1.getString("num_tar"));
				detReg.setStrDescripcionNaturalezaAveria(rs1.getString("desc_natur_aver"));
				detReg.setStrDescripcionMaquinaria(rs1.getString("desc_maq"));
				detReg.setStrCodMaquinaria(rs1.getString("cod_maq"));
				detReg.setStrMarcaMaquinaria(rs1.getString("mar_maq"));
				detReg.setStrModeloMaquinaria(rs1.getString("mod_maq"));
				detReg.setIntEstadoAveria(rs1.getInt("est_aver"));
				reg.getArrMaquinariasXIncidente().add(detReg);
			}
		}
		
		cn.close();
		
		return reg;
	}



	@Override
	public String RegistrarIncidenteYDetalle(RegistroIncidentesBean bean,
			ArrayList<DetalleRegistroIncidenteBean> det) throws Exception {
		String id ="";
		Connection cn = MySqlDbConn.obtenerConexion();
		
		
		CallableStatement st = cn.prepareCall("{call pr_agregarIncidente(?,?,?,?)}");
		
		st.setString(1, bean.getStrCodigoRegistrador());
		st.setString(2, bean.getStrCodigoCliente());
		st.setString(3, bean.getStrSucursal());
		st.setInt(4, bean.getIntEstadoIncidente());
		
		ResultSet rs = st.executeQuery();
		if(rs.next()){
			id=(rs.getString(1));
		}
		
		
		/**********ACCCCCCCCCCCCCCCCCCCCA**/	
		for(int i=0;i<det.size();i++){
			DetalleRegistroIncidenteBean detalle = det.get(i);
			CallableStatement st2 = cn.prepareCall("{call pr_agregarMaquinariaXIncidente(?,?,?,?,?)}");
			st2.setString(1, id);
			st2.setString(2, detalle.getStrNumeroTarjetaEquipo());
			st2.setString(3, detalle.getStrDescripcionNaturalezaAveria());
			st2.setInt(4, detalle.getIntNaturalezaAveria());
			st2.setInt(5, detalle.getIntNumeroItem());
			st2.executeUpdate();
		}
		
		/**********ACCCCCCCCCCCCCCCCCCCCA**/		

		
		cn.close();
		
		return id;
	}



	@Override
	public List<RegistroIncidentesBean> buscarIncidentesParaLiquidacion(
			String nombreEmpresa, Date fechaIncidente,
			String descripcionIncidente) throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_buscarIncidentesParaLiquidacion(?, ?, ?) }");
		st.setString(1, nombreEmpresa);
		st.setDate(2, fechaIncidente);
		st.setString(3, descripcionIncidente);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<RegistroIncidentesBean> arr = new ArrayList<RegistroIncidentesBean>();
		
		while (rs.next()) {
			RegistroIncidentesBean reg = new RegistroIncidentesBean();
			reg.setStrCodigoCliente(rs.getString("cod_cli"));
			reg.setStrCodigoRegistrador(rs.getString("cod_reg"));
			reg.setIntEstadoIncidente(rs.getInt("est_inc"));
			reg.setDtFechaIncidente(rs.getDate("fec_inc"));
			reg.setStrNumeroIncidente(rs.getString("num_inc"));
			reg.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			reg.setStrDescripcionIncidente(rs.getString("desc_inc"));
			
			arr.add(reg);
		}
		
		cn.close();
		
		return arr;
	}

	@Override
	public RegistroIncidentesBean obtenerIncidenteParaLiquidacion(
			String numIncidente) throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerIncidenteLiquidacion(?) }");
		st.setString(1, numIncidente);
		
		ResultSet rs = st.executeQuery();
		RegistroIncidentesBean reg = null;
		if (rs.next()) {
			reg = new RegistroIncidentesBean();
			reg.setStrCodigoCliente(rs.getString("cod_cli"));
			reg.setStrCodigoRegistrador(rs.getString("cod_reg"));
			reg.setIntEstadoIncidente(rs.getInt("est_inc"));
			reg.setDtFechaIncidente(rs.getDate("fec_inc"));
			reg.setStrNumeroIncidente(rs.getString("num_inc"));
			reg.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			reg.setStrDescripcionIncidente(rs.getString("desc_inc"));
			
			//recupera las maquinarias x incidente
			st = cn.prepareCall("{ call pr_obtenerOTxIncidente(?) }");
			st.setString(1, numIncidente);
			ResultSet rs1 = st.executeQuery();
			while(rs1.next()){
				OrdenDeTrabajoXIncidenteBean detReg = new OrdenDeTrabajoXIncidenteBean();
				detReg.setStrNumeroOT(rs1.getString("num_ord_trab"));
				detReg.setStrNumeroTarjeta(rs1.getString("num_tar"));
				detReg.setStrTipoAveria(rs1.getString("desc_natur_aver"));
				detReg.setStrEstadoAveria(rs1.getString("est_aver"));
				reg.getArrOrdenDeTrabajoXIncidente().add(detReg);
			}
		}
		
		cn.close();
		
		return reg;
	}



	@Override
	public ArrayList<TablaDeTablasBean> listarTipoDeAverias() throws Exception {
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{call pr_listarNatAverias()}");
		
		ResultSet rs = st.executeQuery();
		ArrayList<TablaDeTablasBean> arr = new ArrayList<TablaDeTablasBean>();
		while(rs.next()){
			TablaDeTablasBean r = new TablaDeTablasBean();
			
			r.setIntCodItemTabla(rs.getInt("cod_item_tab"));
			r.setStrDescTabla(rs.getString("desc_tab"));
			
			arr.add(r);
		}
		cn.close();
		
		return arr;
	}
	
	/*===================CHRISTIAN=================================*/
	@Override
	public ClienteBean obtenerClientePorIncidente(String numIncidente)
	throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerClientePorIncidente(?) }");
		st.setString(1, numIncidente);
		
		ResultSet rs = st.executeQuery();
		ClienteBean cli = null;
		if (rs.next()) {
			cli = new ClienteBean();
			cli.setStrCodCliente(rs.getString(1));
			cli.setDtFecRegCliente(rs.getDate(2));
			cli.setStrCodRegistrador(rs.getString(3));
			cli.setStrRucCliente(rs.getString(4));
			cli.setStrRazSocCliente(rs.getString(5));
			cli.setStrEmailCliente(rs.getString(6));
			cli.setStrDesCliente(rs.getString(7));			
			
		}
		
		cn.close();
		
		return cli;
    }
	
	@Override
	public RegistroIncidentesBean obtenerIncidenteInspeccion(String numIncidente)
			throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerIncidentePendiente(?) }");
		st.setString(1, numIncidente);
		
		ResultSet rs = st.executeQuery();
		RegistroIncidentesBean reg = null;
		if (rs.next()) {
			reg = new RegistroIncidentesBean();
			reg.setStrCodigoCliente(rs.getString("cod_cli"));
			reg.setStrCodigoRegistrador(rs.getString("cod_reg"));
			reg.setIntEstadoIncidente(rs.getInt("est_inc"));
			reg.setDtFechaIncidente(rs.getDate("fec_inc"));
			reg.setStrLugarAtencionCliente(rs.getString("dir_suc"));
			reg.setStrDistritoAtencion(rs.getString("distr"));
			reg.setStrNumeroIncidente(rs.getString("num_inc"));
			reg.setStrRazonSocialCliente(rs.getString("raz_soc_cli"));
			reg.setStrDescripcionIncidente(rs.getString("desc_inc"));
			
			//recupera las maquinarias x incidente
			st = cn.prepareCall("{ call pr_obtenerMaquinariaSucursalXIncidentePendienteInspeccion(?) }");
			st.setString(1, numIncidente);
			ResultSet rs1 = st.executeQuery();
			while(rs1.next()){
				DetalleRegistroIncidenteBean detReg = new DetalleRegistroIncidenteBean();
				detReg.setIntNumeroItem(rs1.getInt("itm_aver"));
				detReg.setStrDescripcionAveria(rs1.getString("desc_aver"));
				detReg.setIntNaturalezaAveria(rs1.getInt("natur_aver"));
				detReg.setStrNumeroIncidente(rs1.getString("num_inc"));
				detReg.setStrNumeroTarjetaEquipo(rs1.getString("num_tar"));
				detReg.setStrDescripcionNaturalezaAveria(rs1.getString("desc_natur_aver"));
				detReg.setStrDescripcionMaquinaria(rs1.getString("desc_maq"));
				detReg.setStrCodMaquinaria(rs1.getString("cod_maq"));
				detReg.setStrMarcaMaquinaria(rs1.getString("mar_maq"));
				detReg.setStrModeloMaquinaria(rs1.getString("mod_maq"));
				reg.getArrMaquinariasXIncidente().add(detReg);
			}
		}
		
		cn.close();
		
		return reg;
	}

	/*============================================*/
	
	

}
