 package com.maskiner.smc.facturacion.action;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.maskiner.smc.facturacion.bean.BusquedaBean;
import com.maskiner.smc.facturacion.bean.DetalleFacturaBean;
import com.maskiner.smc.facturacion.bean.DetallePrefacturaBean;
import com.maskiner.smc.facturacion.bean.FacturaBean;
import com.maskiner.smc.facturacion.bean.PrefacturaAuxBean;
import com.maskiner.smc.facturacion.bean.PrefacturaBean;
import com.maskiner.smc.facturacion.service.FacturacionBusinessDelegate;
import com.maskiner.smc.facturacion.service.FacturacionServiceI;
import com.maskiner.smc.liquidartrabajo.bean.BeanLiquidacion;
import com.maskiner.smc.mylib.FormatoFecha;
import com.maskiner.smc.mylib.NumberToLetterConverter;
import com.maskiner.smc.seguridad.bean.UsuarioBean;

public class FacturacionAction implements SessionAware,RequestAware,ParameterAware{
//	private String nombreEmpresa;
//	private String fechaIncidente;
//	private String incidente;
//	private String prefactura;
	
	private Map<String,Object> session;
	private Map<String, Object> request;
	private Map<String, String[]> parameters;
	
	
	

	

//	public String getPrefactura() {
//		return prefactura;
//	}
//
//	public void setPrefactura(String prefactura) {
//		this.prefactura = prefactura;
//	}
//
//
//	public String getNombreEmpresa() {
//		return nombreEmpresa;
//	}
//
//	public void setNombreEmpresa(String nombreEmpresa) {
//		this.nombreEmpresa = nombreEmpresa;
//	}
//
//	public String getFechaIncidente() {
//		return fechaIncidente;
//	}
//
//	public void setFechaIncidente(String fechaIncidente) {
//		this.fechaIncidente = fechaIncidente;
//	}
//
//	public String getIncidente() {
//		return incidente;
//	}
//
//	public void setIncidente(String incidente) {
//		this.incidente = incidente;
//	}

	public String buscar()throws Exception { 		
		System.out.println("dentro del metodo buscar");
		String fechaIncidente = parameters.get("fechaIncidente")[0].trim();
		String nombreEmpresa = parameters.get("nombreEmpresa")[0].trim();
		String incidente = parameters.get("incidente")[0].trim();
		try{
		Date dtFechaIncid = null;
		
		if(!fechaIncidente.equals("")){
			if(FormatoFecha.isFecha(fechaIncidente)){
				dtFechaIncid = (Date) FormatoFecha.getFechaDe(fechaIncidente);
			}
		}	
	
	
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		List<BeanLiquidacion> lista = servicio.buscarPrefactura(nombreEmpresa, dtFechaIncid, incidente);
		System.out.println("total registros --> " + lista.size());
		
		session.put("listPrefactura", lista);
		
		}catch (Exception e) {
			e.printStackTrace();	
		}	
		
		return "exito";
	}
	
	public String buscarPrefacturasAprobadas()	throws Exception { 		
		
		//recuperar los parámetros de búsqueda
		String fechaIncidente = parameters.get("fechaIncidente")[0].trim();
		String nombreEmpresa = parameters.get("nombreEmpresa")[0].trim();
		String incidente = parameters.get("incidente")[0].trim();
		
		Date dtFechaIncid = null;
		
		if(!fechaIncidente.equals("")){
			if(FormatoFecha.isFecha(fechaIncidente)){
				dtFechaIncid = (Date) FormatoFecha.getFechaDe(fechaIncidente);
			}
		}		
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		List<BusquedaBean> lista =(ArrayList<BusquedaBean>) servicio.buscarPrefacturaAprobadas(nombreEmpresa, dtFechaIncid, incidente);
		session.put("listPrefactura", lista);
			
		
		return "exito";
	}
	
	
	public String mostrar()	throws Exception { 		
		System.out.println("dentro del metodo mostrar");
		//recuperar los parámetros de búsqueda
		String strNumPrefactura = parameters.get("prefactura")[0].trim();
		String strNumIncidente = parameters.get("incidente")[0].trim();
		System.out.println("valor recuperado del request  -  " + strNumPrefactura);
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		PrefacturaBean prefactura =servicio.obtenerCabeceraPrefactura(strNumIncidente, strNumPrefactura);
		ArrayList<PrefacturaAuxBean>lista=(ArrayList<PrefacturaAuxBean>) servicio.obtenerMateriales_x_Liquidacion(strNumIncidente);
		ArrayList<DetallePrefacturaBean> listaDetalle=(ArrayList<DetallePrefacturaBean>) 
														servicio.obtenerMateriales_x_Liquidacion1(strNumIncidente);
		System.out.println("LISTA--> " + lista.size() );
		System.out.println("LISTA DETALLE--> " + listaDetalle.size());
		session.put("b_prefactura", prefactura);			
		session.put("a_lista", lista);
		session.put("a_listaDetalle", listaDetalle);
		return "exito";
	}
	
	public String mostrarFactura()throws Exception { 		
		System.out.println("dentro del metodo mostrar factura");
		//recuperar los parámetros de búsqueda
		String strNumPrefactura = parameters.get("prefactura")[0].trim();		
		
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		FacturaBean factura =servicio.obtenerFactura(strNumPrefactura);
		ArrayList<DetalleFacturaBean>lista=  (ArrayList<DetalleFacturaBean>)
											servicio.obtenerDetalleFactura(factura.getStrNumSerie(),
																			factura.getStrNumFactura());					
		session.put("b_factura", factura);			
		session.put("a_lista", lista);
		String strMonto=NumberToLetterConverter.convertNumberToLetter(factura.getBdesTotal().doubleValue() );  
		session.put("monto", strMonto);
		return "exito";
	}
	
	
	
	public String aprobar()	throws Exception { 	
		
		/*recuperacmos los montos de los servicio*/
		
		String[]aServicio=obtenerServicio();
		String strValorCheck=null;
		try{
		 strValorCheck=parameters.get("chkObservacion")[0];
		}catch (Exception e) {

		}
		UsuarioBean usuario=(UsuarioBean)session.get("usuariologueado");
		System.out.println("check" + strValorCheck);
		if(strValorCheck==null){
			System.out.println("dentro del if ");
			BigDecimal monto=BigDecimal.valueOf(Double.parseDouble(parameters.get("monto")[0]));
			PrefacturaBean prefactura=(PrefacturaBean)session.get("b_prefactura");
			
	//		 
	//		
			double dblMontoDescuento=obtenerMontoDescuento( prefactura.getStrCodCliente());
			
			prefactura.setDecMonPrefactura(monto);
			prefactura.setStrCodRegistrador(usuario.getCodigoUsuario());
			prefactura.setDecMonDescuento(new BigDecimal(dblMontoDescuento));		
			FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
	//		recuperamos la serie y el numero de factura 
			System.out.println("prefactura "+prefactura.getStrNumPrefactura() );
		
			
			session.put("NumPrefac", prefactura.getStrNumPrefactura());
			if(servicio.aprobarPrefactura(prefactura, true,aServicio)){
						servicio.grabarFactura(prefactura);
						String[] aCodigo=servicio.obtenerSerieFactura(prefactura.getStrNumPrefactura());
						grabarDetalleFactura(aServicio, aCodigo);
						return  "exito";
			}
			else{System.out.println("Error al grabar prefactura");
						return "exito";
			}
		}		
		else{
				System.out.println("dentro del else ");
				String strObservacion=parameters.get("observacion")[0];
				if(strObservacion.trim().equals("")){
					request.put("mensaje","(*)Ingrese Observación");
					return "exito";				
				}else{
				BigDecimal monto=BigDecimal.valueOf(Double.parseDouble(parameters.get("monto")[0]));
				PrefacturaBean prefactura=(PrefacturaBean)session.get("b_prefactura");
				double dblMontoDescuento=obtenerMontoDescuento( prefactura.getStrCodCliente());
				prefactura.setDecMonDescuento(new BigDecimal(dblMontoDescuento));
				prefactura.setDecMonPrefactura(monto);
				prefactura.setStrObsPrefactura(strObservacion);
				prefactura.setStrCodRegistrador(usuario.getCodigoUsuario());
				FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
				session.put("NumPrefac", prefactura.getStrNumPrefactura());
				servicio.aprobarPrefactura(prefactura, false,aServicio);
				/*recuperamos la serie y el numero de factura */
				servicio.grabarFactura(prefactura);
				String[] aCodigo=servicio.obtenerSerieFactura(prefactura.getStrNumPrefactura());
				grabarDetalleFactura(aServicio, aCodigo);
					return "exito";			
			  }	
	 	
		}  
	
		
		
	}
	
	
	private String[] obtenerServicio (){	
		
		ArrayList<PrefacturaAuxBean>lista=(ArrayList<PrefacturaAuxBean>											)session.get("a_lista");
		ArrayList<DetallePrefacturaBean> listaDetalle=(ArrayList<DetallePrefacturaBean>)
														session.get("a_listaDetalle");
		
		String[] servicio=new String[3];
		double totalMateriales=0;
		double totalAdicionales=0;
		double totalServicio=0;
		System.out.println("tammño lista " + lista.size());
		System.out.println("tammño listadetalle " + listaDetalle.size());
		for(int i=0;i<lista.size();i++){
			for(int j=0;j<listaDetalle.size();j++){
				if(lista.get(i).getStrLiquidacion().equals(listaDetalle.get(j).getStrNumLiquidacion())){
					if(listaDetalle.get(j).getStrCodigo()!=null && listaDetalle.get(j).getStrCodigo().equals("MA0000") ){
							
							totalAdicionales+=Double.parseDouble(listaDetalle.get(j).getDecImporte()+"");
						}
					if(listaDetalle.get(j).getStrCodigo()!=null && !listaDetalle.get(j).getStrCodigo().equals("MA0000") &&
							listaDetalle.get(j).getStrFlag()==null ){
							totalMateriales+=Double.parseDouble(listaDetalle.get(j).getDecImporte()+"");					
					}
					if(listaDetalle.get(j).getStrFlag()!=null && listaDetalle.get(j).getStrFlag().equals("TC")  ) {

						totalServicio+=Double.parseDouble(listaDetalle.get(j).getDecImporte()+"");
					}
					
					
				}
			}			
		}
			servicio[0]=totalServicio+"";
			servicio[1]=totalMateriales+"";
			servicio[2]=totalAdicionales+"";
			
			System.out.println("montos "+ servicio[0]);
			System.out.println("montos "+ servicio[1]);
			System.out.println("montos "+ servicio[2]);
		
		return servicio;
		
	}
	
	private double obtenerMontoDescuento(String strCodCliente) throws Exception{
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		double descuento=0;
		ArrayList<DetallePrefacturaBean> listaDetalle=(ArrayList<DetallePrefacturaBean>)
													session.get("a_listaDetalle");

		
		for(int i=0;i<listaDetalle.size();i++){
			if(listaDetalle.get(i).getStrCodigo()!=null&& listaDetalle.get(i).getStrFlag()!=null &&  !listaDetalle.get(i).getStrCodigo().equals("MA0000") && 
					!listaDetalle.get(i).getStrFlag().equals("TC")){
				descuento+=servicio.obtenerMontoDescuento(listaDetalle.get(i).getStrCodigo(), strCodCliente);
				
			}
				
			
		}
		
		
		return descuento;
	}
	
	private void grabarDetalleFactura(String[] aServicios,String[] aCodigo) throws  Exception{
		System.out.println("dentro del metodo grabar detalle factura action");
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		for(int i=0; i < aServicios.length;i++){
			if(!aServicios[i].equals("0.0")){
				servicio.grabarDetallefactura(aCodigo[0], aCodigo[1], i+1,Double.parseDouble(aServicios[i]));
			}
		}
		
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
		
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		this.parameters=arg0;
		
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	
}