 package com.maskiner.smc.facturacion.action;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
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

public class FacturacionAction extends MappingDispatchAction{
	
	
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception { 		
		
		//recuperar los parámetros de búsqueda
		String strEmpresa = request.getParameter("nombreEmpresa").trim();
		String strFechaIncid = request.getParameter("fechaIncidente").trim();
		String strIncidente = request.getParameter("incidente").trim();
		Date dtFechaIncid = null;
		
		if(!strFechaIncid.equals("")){
			if(FormatoFecha.isFecha(strFechaIncid)){
				dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
			}
		}		
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		ArrayList<BeanLiquidacion> lista =servicio.buscarPrefactura(strEmpresa, dtFechaIncid, strIncidente);
		request.setAttribute("listPrefactura", lista);
			
		
		return mapping.findForward("exito");
	}
	
	public ActionForward buscarPrefacturasAprobadas(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception { 		
		
		//recuperar los parámetros de búsqueda
		String strEmpresa = request.getParameter("nombreEmpresa").trim();
		String strFechaIncid = request.getParameter("fechaIncidente").trim();
		String strIncidente = request.getParameter("incidente").trim();
		Date dtFechaIncid = null;
		
		if(!strFechaIncid.equals("")){
			if(FormatoFecha.isFecha(strFechaIncid)){
				dtFechaIncid = FormatoFecha.getFechaDe(strFechaIncid);
			}
		}		
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		ArrayList<BusquedaBean> lista =(ArrayList<BusquedaBean>) servicio.buscarPrefacturaAprobadas(strEmpresa, dtFechaIncid, strIncidente);
		request.setAttribute("listPrefactura", lista);
			
		
		return mapping.findForward("exito");
	}
	
	
	public ActionForward mostrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception { 		
		System.out.println("dentro del metodo mostrar");
		//recuperar los parámetros de búsqueda
		String strNumPrefactura = request.getParameter("prefactura");
		String strNumIncidente = request.getParameter("incidente");
		System.out.println("valor recuperado del request  -  " + strNumPrefactura);
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		PrefacturaBean prefactura =servicio.obtenerCabeceraPrefactura(strNumIncidente,strNumPrefactura);
		ArrayList<PrefacturaAuxBean>lista=(ArrayList<PrefacturaAuxBean>) servicio.obtenerMateriales_x_Liquidacion(strNumIncidente);
		ArrayList<DetallePrefacturaBean> listaDetalle=(ArrayList<DetallePrefacturaBean>) 
														servicio.obtenerMateriales_x_Liquidacion1(strNumIncidente);
		request.getSession().setAttribute("b_prefactura", prefactura);			
		request.getSession().setAttribute("a_lista", lista);
		request.getSession().setAttribute("a_listaDetalle", listaDetalle);
		return mapping.findForward("exito");
	}
	
	public ActionForward mostrarFactura(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception { 		
		System.out.println("dentro del metodo mostrar factura");
		//recuperar los parámetros de búsqueda
		String strNumPrefactura = request.getParameter("prefactura");		
		
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		FacturaBean factura =servicio.obtenerFactura(strNumPrefactura);
		ArrayList<DetalleFacturaBean>lista=  (ArrayList<DetalleFacturaBean>)
											servicio.obtenerDetalleFactura(factura.getStrNumSerie(),
																			factura.getStrNumFactura());					
		request.getSession().setAttribute("b_factura", factura);			
		request.getSession().setAttribute("a_lista", lista);
		String strMonto=NumberToLetterConverter.convertNumberToLetter(factura.getBdesTotal().doubleValue() );  
		request.getSession().setAttribute("monto", strMonto);
		return mapping.findForward("exito");
	}
	
	
	
	public ActionForward aprobar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception { 	
		/*recuperacmos los montos de los servicio*/
		String[]aServicio=obtenerServicio(request);
		
		String strValorCheck=request.getParameter("chkObservacion");
		UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute("usuariologueado");
		System.out.println("check" + strValorCheck);
		if(strValorCheck==null){
		System.out.println("dentro del if ");
		BigDecimal monto=BigDecimal.valueOf(Double.parseDouble( request.getParameter("monto")));
		PrefacturaBean prefactura=(PrefacturaBean)request.getSession().getAttribute("b_prefactura");
		
		 
		
		double dblMontoDescuento=obtenerMontoDescuento(request, prefactura.getStrCodCliente());
		
		prefactura.setDecMonPrefactura(monto);
		prefactura.setStrCodRegistrador(usuario.getCodigoUsuario());
		prefactura.setDecMonDescuento(new BigDecimal(dblMontoDescuento));		
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		/*recuperamos la serie y el numero de factura */
		System.out.println("prefactura "+prefactura.getStrNumPrefactura() );
		
		
		
		request.getSession().setAttribute("NumPrefac", prefactura.getStrNumPrefactura());
				if(servicio.aprobarPrefactura(prefactura, true,aServicio)){
					servicio.grabarFactura(prefactura);
					String[] aCodigo=servicio.obtenerSerieFactura(prefactura.getStrNumPrefactura());
					grabarDetalleFactura(aServicio, aCodigo);
					return mapping.findForward("exito");
				}
				else{System.out.println("Error al grabar prefactura");
					return mapping.findForward("exito");
					}
		}		
		else{
			System.out.println("dentro del else ");
			String strObservacion=request.getParameter("observacion");
			if(strObservacion.trim().equals("")){
				request.setAttribute("mensaje","(*)Ingrese Observación");
				return mapping.findForward("exito1");				
			}else{
			BigDecimal monto=BigDecimal.valueOf(Double.parseDouble( request.getParameter("monto")));
			PrefacturaBean prefactura=(PrefacturaBean)request.getSession().getAttribute("b_prefactura");
			double dblMontoDescuento=obtenerMontoDescuento(request, prefactura.getStrCodCliente());
			prefactura.setDecMonDescuento(new BigDecimal(dblMontoDescuento));
			prefactura.setDecMonPrefactura(monto);
			prefactura.setStrObsPrefactura(strObservacion);
			prefactura.setStrCodRegistrador(usuario.getCodigoUsuario());
			FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
			request.getSession().setAttribute("NumPrefac", prefactura.getStrNumPrefactura());
			servicio.aprobarPrefactura(prefactura, false,aServicio);
			/*recuperamos la serie y el numero de factura */
			servicio.grabarFactura(prefactura);
			String[] aCodigo=servicio.obtenerSerieFactura(prefactura.getStrNumPrefactura());
			grabarDetalleFactura(aServicio, aCodigo);
				return mapping.findForward("exito");			
			}
		}		

  }
	
	
	
	
	private String[] obtenerServicio (HttpServletRequest request){		
		ArrayList<PrefacturaAuxBean>lista=(ArrayList<PrefacturaAuxBean>
											)request.getSession().getAttribute("a_lista");
		ArrayList<DetallePrefacturaBean> listaDetalle=(ArrayList<DetallePrefacturaBean>)
														request.getSession().getAttribute("a_listaDetalle");
		
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
	
	private double obtenerMontoDescuento(HttpServletRequest request,String strCodCliente) throws Exception{
		FacturacionServiceI servicio=FacturacionBusinessDelegate.getFacturacionService();
		double descuento=0;
		ArrayList<DetallePrefacturaBean> listaDetalle=(ArrayList<DetallePrefacturaBean>)
													request.getSession().getAttribute("a_listaDetalle");

		
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
	
	
	
	
	
}