package com.maskiner.smc.mylib;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class MySqlDbConn {

	
	public static Connection obtenerConexion() 
					throws NamingException {
		Connection conexion=null;
		
			try {
				// Creamos un contexto jndi inicial
				// Este context no tiene nada que ver con 
				// la etiqueta contexto donde esta el pool
				
				// Este context hace referencia un servicio de nombres
				// naming service
				Context ctx= new InitialContext();
				String nombreDelContextJNDI="java:comp/env/";
				DataSource	ds=
					(DataSource)ctx.lookup(
							nombreDelContextJNDI+"jdbc/MySqlPoolConections");
				
				conexion=ds.getConnection();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return conexion;
	}
	
	
	
}
