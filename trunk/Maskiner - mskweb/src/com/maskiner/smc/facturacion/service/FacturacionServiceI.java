 package com.maskiner.smc.facturacion.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.facturacion.bean.BusquedaBean;
import com.maskiner.smc.facturacion.bean.DetalleFacturaBean;
import com.maskiner.smc.facturacion.bean.DetallePrefacturaBean;
import com.maskiner.smc.facturacion.bean.FacturaBean;
import com.maskiner.smc.facturacion.bean.PrefacturaAuxBean;
import com.maskiner.smc.facturacion.bean.PrefacturaBean;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;

public interface FacturacionServiceI {

	public  ArrayList buscarPrefactura(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception;

	public PrefacturaBean obtenerCabeceraPrefactura(String strIncidente,String strNumPrefac) throws Exception;
	
	public List<PrefacturaAuxBean> obtenerMateriales_x_Liquidacion(String strIncidente) throws Exception;
	public List<DetallePrefacturaBean> obtenerMateriales_x_Liquidacion1(String strLiquidacion) throws Exception;
	public boolean aprobarPrefactura(PrefacturaBean prefactura , boolean flag,String[] servicio )throws Exception;
	public double obtenerMontoDescuento(String strMaterial,String strCliente) throws Exception;
	public void grabarDetallefactura(String strSerie,String strFactura,int item,double dblMonto) throws Exception;
	public String[] obtenerSerieFactura (String prefactura) throws Exception;
	public boolean grabarFactura(PrefacturaBean prefactura ) throws Exception;
	public List<BusquedaBean> buscarPrefacturaAprobadas(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception;
	public FacturaBean obtenerFactura(String codPrefactura) throws Exception;
	public List<DetalleFacturaBean> obtenerDetalleFactura(String strSerie,String strNumFactura) throws Exception;
	public ClienteBean obtenerCliente(String strPrefactura) throws Exception;
	
}