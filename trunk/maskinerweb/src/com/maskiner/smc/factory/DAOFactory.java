package com.maskiner.smc.factory;


import java.util.ResourceBundle;


import com.maskiner.smc.facturacion.dao.FacturacionDAO;
import com.maskiner.smc.gestionarexpertise.dao.PaqueteDAO;
import com.maskiner.smc.gestionarincidentes.dao.IncidenteDAO;
import com.maskiner.smc.liquidartrabajo.dao.LiquidacionDAO;
import com.maskiner.smc.liquidartrabajo.dao.MaterialesDAO;
import com.maskiner.smc.logistica.dao.TablaDeTablasDAO;
import com.maskiner.smc.maestroclientes.dao.MaestroClientesDAO;
import com.maskiner.smc.maestromaquinarias.dao.MaestroMaquinariasDAO;
import com.maskiner.smc.programartrabajo.dao.OrdenTrabajoDAO;
import com.maskiner.smc.programartrabajo.dao.TecnicoDAO;
import com.maskiner.smc.seguridad.dao.SeguridadDAO;


public abstract class DAOFactory {
	
    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int DB2 = 3;
    public static final int SQLSERVER = 4;
    public static final int XML = 5;
    
    // metodos que devuelven DAOS
    
    public abstract OrdenTrabajoDAO getOrdenTrabajoDAO();
    public abstract TecnicoDAO getTecnicoDAO();
    public abstract SeguridadDAO getSeguridadDAO();
    public abstract IncidenteDAO getIncidenteDAO();
    public abstract PaqueteDAO getPaqueteDAO();  
    public abstract MaestroClientesDAO getMaestroClientesDAO();
    public abstract MaestroMaquinariasDAO getMaestroMaquinariasDAO();
    public abstract TablaDeTablasDAO getTablaDeTablasDAO();
    public abstract MaterialesDAO getMaterialesDAO();
    public abstract LiquidacionDAO getLiquidacionDAO();
    //CHRISTIAN
    public abstract FacturacionDAO getFacturaDAO();
    //FIN
    public static DAOFactory getDAOFactory(){
    	/* devuelve un DAOFActory del tipo especificado en
    		el archivo de recursos engine.properties */
    	
    	ResourceBundle rb = ResourceBundle.getBundle("com.maskiner.smc.recursos.engine");
    	int motor = Integer.parseInt(rb.getString("motor_bd"));
    	
        switch(motor){
	   		case MYSQL:
	    	    return new MySqlDAOFactory();
	     	/*case DB2:
	    	    return new Db2DAOFactory();
	    	case SQLSERVER:
	    	    return new SqlServerDAOFactory();
	    	case XML:
	    	    return new XmlDAOFactory();*/
	    	default:
	    	    return null;
        }
    }
    
    
}
