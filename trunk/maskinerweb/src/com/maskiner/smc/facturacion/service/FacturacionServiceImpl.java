 package com.maskiner.smc.facturacion.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.facturacion.bean.BusquedaBean;
import com.maskiner.smc.facturacion.bean.DetalleFacturaBean;
import com.maskiner.smc.facturacion.bean.DetallePrefacturaBean;
import com.maskiner.smc.facturacion.bean.FacturaBean;
import com.maskiner.smc.facturacion.bean.PrefacturaAuxBean;
import com.maskiner.smc.facturacion.bean.PrefacturaBean;
import com.maskiner.smc.facturacion.dao.FacturacionDAO;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;



public class FacturacionServiceImpl implements FacturacionServiceI {
	
	public FacturacionDAO facturacionDAO;
	
	public FacturacionServiceImpl(){
		DAOFactory factory= DAOFactory.getDAOFactory();
		facturacionDAO=factory.getFacturaDAO();		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList buscarPrefactura(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {
		// TODO Auto-generated method stub
		return (ArrayList) facturacionDAO.buscarPrefactura(nombreEmpresa, fechaIncidente, descripcionIncidente);
	}
	
	public PrefacturaBean obtenerCabeceraPrefactura(String strIncidente,String strNumPrefac) throws Exception{
		return facturacionDAO.obtenerCabeceraPrefactura( strIncidente, strNumPrefac);
	}
	public List<PrefacturaAuxBean> obtenerMateriales_x_Liquidacion(String strIncidente) throws Exception {
		return facturacionDAO.obtenerMateriales_x_Liquidacion(strIncidente);
	}
	public List<DetallePrefacturaBean> obtenerMateriales_x_Liquidacion1(String strLiquidacion) throws Exception{
		return facturacionDAO.obtenerMateriales_x_Liquidacion1(strLiquidacion);
	}
	public boolean aprobarPrefactura(PrefacturaBean prefactura , boolean flag,String[] servicio )throws Exception{
		return facturacionDAO.aprobarPrefactura(prefactura, flag,servicio);		
	}
	public double obtenerMontoDescuento(String strMaterial,String strCliente) throws Exception{
		return facturacionDAO.obtenerMontoDescuento(strMaterial, strCliente);
	}
	
	public void grabarDetallefactura(String strSerie,String strFactura,int item,double dblMonto) throws Exception{
		facturacionDAO.grabarDetallefactura(strSerie, strFactura, item, dblMonto);
		
	}
	
	public String[] obtenerSerieFactura (String prefactura) throws Exception{
		return facturacionDAO.obtenerSerieFactura(prefactura);
	}
	
	public boolean grabarFactura(PrefacturaBean prefactura ) throws Exception{
		return facturacionDAO.grabarFactura(prefactura);
	}
	
	public List<BusquedaBean> buscarPrefacturaAprobadas(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception{
		
		return facturacionDAO.buscarPrefacturaAprobadas(nombreEmpresa, fechaIncidente, descripcionIncidente);
	}
	
	public FacturaBean obtenerFactura(String codPrefactura) throws Exception{
		return facturacionDAO.obtenerFactura(codPrefactura);
	}
	public List<DetalleFacturaBean> obtenerDetalleFactura(String strSerie,String strNumFactura) throws Exception{
		return facturacionDAO.obtenerDetalleFactura(strSerie, strNumFactura);
	}
	
	public ClienteBean obtenerCliente(String strPrefactura) throws Exception{
		return facturacionDAO.obtenerCliente(strPrefactura);
	}
	
	

}
