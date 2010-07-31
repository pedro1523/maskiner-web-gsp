package com.maskiner.smc.liquidartrabajo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.maskiner.smc.liquidartrabajo.bean.LiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.liquidartrabajo.bean.TecnicosXLiquidacionBean;
import com.maskiner.smc.maestromaquinarias.bean.MaquinariaSucursalBean;
import com.maskiner.smc.mylib.MySqlDbConn;

public class MySqlLiquidacionDAO implements LiquidacionDAO {

	@Override
	public String RegistrarLiquidacionYDetalle(LiquidacionBean bean,
			ArrayList<MaterialesXLiquidacionBean> mat, ArrayList<TecnicosXLiquidacionBean> tec) throws Exception {
		String idLiq ="";
		String idPre ="";
		String estPre="";
		Connection cn = MySqlDbConn.obtenerConexion();
		
		
		CallableStatement st5 = cn.prepareCall("{call pr_obtenerEstadoIncidente(?)}");
		st5.setString(1, bean.getStrNumIncidente());
		ResultSet rs5 = st5.executeQuery();
		if(rs5.next()){
			estPre=(rs5.getString(1));
		}
		
		if(estPre.equals("5")){
			
			CallableStatement st7 = cn.prepareCall("{call pr_verificarPrefactura(?)}");
			st7.setString(1, bean.getStrNumIncidente());
			ResultSet rs7 = st7.executeQuery();
			if(rs7.next()){
				idPre=(rs7.getString(1));
			}
				
			CallableStatement st6 = cn.prepareCall("{call pr_insertarLiquidacion(?,?,?,?,?,?)}");
			
			st6.setString(1, bean.getStrNumOrdTrabajo());
			st6.setString(2, bean.getStrCodRegistrador());
			st6.setString(3, bean.getStrDesAtenRealizada());
			st6.setString(4, bean.getStrAporConocimiento());
			st6.setInt(5, bean.getIntEstLiquidacion());
			st6.setString(6, idPre);
			
			ResultSet rs6 = st6.executeQuery();
			if(rs6.next()){
				idLiq=(rs6.getString(1));
			}
		}
		else{
			CallableStatement st3 = cn.prepareCall("{call pr_insertarPrefactura(?,?,?)}");
			st3.setString(1, bean.getStrCodRegistrador());
			st3.setInt(2, 1);
			st3.setString(3, bean.getStrNumIncidente());
			
			ResultSet rs = st3.executeQuery();
			if(rs.next()){
				idPre=(rs.getString(1));
			}
			
			
			CallableStatement st = cn.prepareCall("{call pr_insertarLiquidacion(?,?,?,?,?,?)}");
			
			st.setString(1, bean.getStrNumOrdTrabajo());
			st.setString(2, bean.getStrCodRegistrador());
			st.setString(3, bean.getStrDesAtenRealizada());
			st.setString(4, bean.getStrAporConocimiento());
			st.setInt(5, bean.getIntEstLiquidacion());
			st.setString(6, idPre);
			
			ResultSet rs2 = st.executeQuery();
			if(rs2.next()){
				idLiq=(rs2.getString(1));
			}
		}
				
		
		if (mat!=null){
				for(int i=0;i<mat.size();i++){
					MaterialesXLiquidacionBean material = mat.get(i);
					CallableStatement st2 = cn.prepareCall("{call pr_insertarMaterialXLiquidacion(?,?,?,?,?,?,?)}");
					st2.setString(1, idLiq);
					st2.setString(2, material.getStrCodMaterial());
					st2.setInt(3, material.getIntItem());
					st2.setString(4, material.getStrDescripMaterialExterno());
					st2.setInt(5, material.getIntCantidad());
					st2.setBigDecimal(6, material.getDecPrecioUnitario());
					st2.setBigDecimal(7, material.getDecMontoTotal());
					st2.executeUpdate();
				}
		}
		for(int n=0;n<tec.size();n++){
			TecnicosXLiquidacionBean tecnico = tec.get(n);
			CallableStatement st4 = cn.prepareCall("{call pr_insertarTecnicosXLiquidacion(?,?,?,?,?,?)}");
			st4.setString(1, idLiq);
			st4.setString(2, tecnico.getStrCodTecnico());
			st4.setString(3, tecnico.getStrCodPaquete());
			st4.setTime(4, tecnico.getTmHoraInicio());
			st4.setTime(5, tecnico.getTmHoraFin());
			st4.setString(6, tecnico.getStrCodOrdenTrabajo());
			st4.executeUpdate();
		}
		
		CallableStatement st8 = cn.prepareCall("{call pr_actualizaHorometro(?,?)}");
		st8.setString(1, bean.getStrNumOrdTrabajo());
		st8.setInt(2, bean.getIntValHorometro());
		st8.executeUpdate();
		
		
		cn.close();
		
		return idLiq;
	}
	
	@Override
	public MaquinariaSucursalBean obtenerMaquinariaXOT(String numOT)
	throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerMaquinariaXOT(?) }");
		st.setString(1, numOT);
		
		ResultSet rs = st.executeQuery();
		MaquinariaSucursalBean maq = null;
		if (rs.next()) {
			maq = new MaquinariaSucursalBean();
			maq.setStrNumTarjeta(rs.getString(1));
			maq.setStrModMaquinaria(rs.getString(2));
			maq.setStrDescTipMaq(rs.getString(3));
			maq.setStrDescMarMaq(rs.getString(4));
			maq.setStrNumSerieMaquinaria(rs.getString(5));
			maq.setStrDirSucursal(rs.getString(6));		
			maq.setStrMedHorometro(rs.getString(7));	
		}
		
		cn.close();
		
		return maq;
    }
	
	@Override
	public ArrayList<TecnicosXLiquidacionBean> obtenerTecnicosXOT(String numOT)
	throws Exception {
		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerTecnicosXOT(?) }");
		st.setString(1, numOT);
		
		ResultSet rs = st.executeQuery();
		ArrayList<TecnicosXLiquidacionBean> tecnicos = new ArrayList<TecnicosXLiquidacionBean>();
		TecnicosXLiquidacionBean tec = null;
		while (rs.next()) {
			tec= new TecnicosXLiquidacionBean();
			tec.setStrCodTecnico(rs.getString("cod_tco"));
			tec.setStrNombreCompleto(rs.getString("nombre"));
			tec.setStrCodPaquete(rs.getString("cod_paq"));
			tecnicos.add(tec);
		}
		
		cn.close();
		
		return tecnicos;
    }
	
}
