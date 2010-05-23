package com.maskiner.smc.liquidartrabajo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.logistica.bean.MaterialBean;
import com.maskiner.smc.logistica.bean.TipoMaterialBean;
import com.maskiner.smc.mylib.MySqlDbConn;

public class MySqlMaterialesDAO implements MaterialesDAO {

	@Override
	public List<MaterialBean> buscarMateriales(int codTipoMaterial,
			String descripcion) throws Exception {
		
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_buscarMateriales(?, ?) }");
		st.setInt(1, codTipoMaterial);
		st.setString(2, descripcion);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<MaterialBean> arr = new ArrayList<MaterialBean>();
		
		while(rs.next()){
			MaterialBean material = new MaterialBean();
			material.setStrCodMaterial(rs.getString("cod_mat"));
			material.setIntCodTipoMaterial(rs.getInt("cod_tip_mat"));
			material.setStrTipoMaterial(rs.getString("tip_mat"));
			material.setStrDescripMaterial(rs.getString("desc_mat"));
			material.setStrUnidadMedida(rs.getString("und_med_mat"));
			material.setBdPrecioUnitario(rs.getBigDecimal("prec_uni_mat"));
			arr.add(material);
		}
		rs.close();
		cn.close();
		return arr;
	}

	@Override
	public MaterialBean obtenerMaterial(String codMaterial) throws Exception {
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerMaterial(?) }");
		st.setString(1, codMaterial);
		
		ResultSet rs = st.executeQuery();
		
		MaterialBean mat = new MaterialBean();
		if(rs.next()){
			
			mat.setStrCodMaterial(rs.getString("cod_mat"));
			mat.setStrTipoMaterial(rs.getString("tip_mat"));
			mat.setStrDescripMaterial(rs.getString("desc_mat"));
			mat.setStrUnidadMedida(rs.getString("und_med_mat"));
			mat.setBdPrecioUnitario(rs.getBigDecimal("prec_uni_mat"));
			mat.setStrDescTipoMaterial(rs.getString("descTipMat"));
			//System.out.println(mat.getBdPrecioUnitario());
		}
		rs.close();
		cn.close();
		return mat;
	}

	@Override
	public List<TipoMaterialBean> obtenerTiposMateriales() throws Exception {
		
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_obtenerTiposMateriales() }");
		ResultSet rs = st.executeQuery();
		
		ArrayList<TipoMaterialBean> arr = new ArrayList<TipoMaterialBean>();
		
		while(rs.next()){
			TipoMaterialBean tipo = new TipoMaterialBean();
			tipo.setIntCodTipoMaterial(rs.getInt("cod_tip_mat"));
			tipo.setStrTipoMaterial(rs.getString("desc_tip_mat"));
			arr.add(tipo);
		}
		rs.close();
		cn.close();
		return arr;
	}

}
