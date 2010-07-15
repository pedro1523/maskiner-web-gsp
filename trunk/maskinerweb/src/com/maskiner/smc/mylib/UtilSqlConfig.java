package com.maskiner.smc.mylib;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// Esta clase retorna un objeto que representa el archivo 
// SqlMapConfig.xml. Este es el principal archivo de 
// cofiguracion de ibatis


public class UtilSqlConfig {
	private static final SqlMapClient sqlMap;
	
	static {
		try {
			
			String resource =
				"com/maskiner/smc/ibatis/SqlMapConfig.xml";
			
			Reader reader = Resources.getResourceAsReader(resource);
			
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(
					"Error inicializando la clase UtilSqlConfig class. Cause: " + e);
		}
	}

	public static SqlMapClient getSqlMapInstance() {
		return sqlMap;
	}
}
