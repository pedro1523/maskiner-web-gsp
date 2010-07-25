package com.maskiner.smc.seguridad.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.maskiner.smc.mylib.MySqlDbConn;
import com.maskiner.smc.mylib.SHA1;
import com.maskiner.smc.seguridad.bean.RolUsuarioBean;
import com.maskiner.smc.seguridad.bean.UsuarioBean;



public class MySqlSeguridadDAO implements SeguridadDAO {

	@Override
	public UsuarioBean validar(String username, String password)
			throws Exception {
		
		UsuarioBean usuario = null;

		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_validarusuario(?, ?) }");
		st.setString(1, username);
		st.setString(2, SHA1.getHash(password));
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()){
			usuario = new UsuarioBean();
			usuario.setCodigoUsuario(rs.getString("cod_usr"));
			usuario.setDniUsuario(rs.getString("dni_usr"));
			usuario.setApellidoPaterno(rs.getString("ape_pat_usr"));
			usuario.setApellidoMaterno(rs.getString("ape_mat_usr"));			
			usuario.setNombres(rs.getString("nom_usr"));
			usuario.setDomicilio(rs.getString("dom_usr"));
			usuario.setTelefono(rs.getString("tel_usr"));
			usuario.setCargo(rs.getString("cargo_usr"));
			usuario.setUsername(rs.getString("username"));
			usuario.setPassword(rs.getString("password"));
			usuario.setEstadoUsuario(rs.getInt("est_usr"));
			
		}
		
		if(usuario != null){
			//recuperamos los roles del usuario
			st = cn.prepareCall("{ call pr_obtenerRolesUsuario(?) }");
			st.setString(1, usuario.getCodigoUsuario());
			
			rs = st.executeQuery();
			
			ArrayList<RolUsuarioBean> roles = usuario.getRoles();
			
			while(rs.next()){
				RolUsuarioBean rol = new RolUsuarioBean();
				rol.setCodigoRol(rs.getString("cod_rol"));
				rol.setDescripcionRol(rs.getString("desc_rol"));
				roles.add(rol);
			}
		}
		
		cn.close();
		
		return usuario;
	}
}
