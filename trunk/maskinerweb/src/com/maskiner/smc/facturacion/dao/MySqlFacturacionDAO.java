package com.maskiner.smc.facturacion.dao;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;

import com.maskiner.smc.facturacion.bean.BusquedaBean;
import com.maskiner.smc.facturacion.bean.DetalleFacturaBean;
import com.maskiner.smc.facturacion.bean.DetallePrefacturaBean;
import com.maskiner.smc.facturacion.bean.FacturaBean;
import com.maskiner.smc.facturacion.bean.PrefacturaAuxBean;
import com.maskiner.smc.facturacion.bean.PrefacturaBean;
import com.maskiner.smc.liquidartrabajo.bean.BeanLiquidacion;
import com.maskiner.smc.maestroclientes.bean.ClienteBean;
import com.maskiner.smc.mylib.MySqlDbConn;


public class MySqlFacturacionDAO implements FacturacionDAO {
	
	
	/* (non-Javadoc)
	 * @see com.maskiner.smc.facturacion.dao.FacturacionDAO#buscarPrefactura(java.lang.String, java.sql.Date, java.lang.String)
	 */
	public List<BeanLiquidacion> buscarPrefactura(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {

		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call  pr_buscarPrefacturas(?, ?, ?) }");
		st.setString(1, nombreEmpresa);
		st.setDate(2, fechaIncidente);
		st.setString(3, descripcionIncidente);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<BeanLiquidacion> arr = new ArrayList<BeanLiquidacion>();
		
		while (rs.next()) {
			BeanLiquidacion liq = new BeanLiquidacion();
			liq.setStrNumPrefactura(rs.getString(1));
			liq.setStrNumOrdTrabajo(rs.getString(2));
			liq.setStrFecIncidente(rs.getString(3));
			arr.add(liq);
		}
		
		cn.close();
		
		return arr;
	}
	
	public List<BusquedaBean> buscarPrefacturaAprobadas(String nombreEmpresa,
			Date fechaIncidente, String descripcionIncidente) throws Exception {

		//obtener una conexion
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call  pr_buscarfacturas(?, ?, ?) }");
		st.setString(1, nombreEmpresa);
		st.setDate(2, fechaIncidente);
		st.setString(3, descripcionIncidente);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<BusquedaBean> arr = new ArrayList<BusquedaBean>();
		
		while (rs.next()) {
			BusquedaBean bus = new BusquedaBean();
			
			bus.setStrCodCliente(rs.getString(1));
			bus.setStrNumPrefactura(rs.getString(2));
			bus.setStrNumIncidente(rs.getString(3));
			bus.setStrFechaIncidente(rs.getString(4));
			arr.add(bus);
		}
		
		cn.close();
		
		return arr;
	}
	
	
	
	public PrefacturaBean obtenerCabeceraPrefactura(String strIncidente,String strNumPrefac) throws Exception {

		PrefacturaBean prefactura=prefactura = new PrefacturaBean();
		System.out.println("dentro del metodo obtenetcabeceraprefactura parametro - " + strNumPrefac);
		//obtener una conexion
		String consulta="Select * from prefactura where num_prefac=?";
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call  pr_mostrarCabeceraPrefactura(?) }");
		st.setString(1, strIncidente);
		PreparedStatement pstm= cn.prepareStatement(consulta);
		pstm.setString(1, strNumPrefac);
		ResultSet rss=pstm.executeQuery();
		ResultSet rs = st.executeQuery();
				
		while (rs.next()) {
			System.out.println("dentro del while");			
		    
			prefactura.setStrNumPrefactura(rs.getString(1));
			prefactura.setStrCodCliente(rs.getString(2));
			prefactura.setStrRazonSocial(rs.getString(3));
			prefactura.setStrRuc(rs.getString(4));
			prefactura.setStrDireccion(rs.getString(5));
			}
		while(rss.next()){
			prefactura.setStrNumPrefactura(rss.getString(1));
			prefactura.setStrFecPrefactura(rss.getString(2));
		}
		
		cn.close();
		
		return prefactura;
	}
	
	
	public List<PrefacturaAuxBean> obtenerMateriales_x_Liquidacion(String strIncidente) throws Exception {

		
		 ArrayList<PrefacturaAuxBean> lista=new ArrayList<PrefacturaAuxBean>();
		//obtener una conexion		
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call  pr_obtenerMateriales_x_Liquidacion(?) }");
		st.setString(1, strIncidente);
	
		ResultSet rs = st.executeQuery();				
		while (rs.next()) {	
			PrefacturaAuxBean aux=new PrefacturaAuxBean();
			aux.setStrOT(rs.getString(1));
		    aux.setStrLiquidacion(rs.getString(2));
		    aux.setStrCodMaquina(rs.getString(3));
		    aux.setStrNumTarjeta(rs.getString(4));
		    lista.add(aux);
		}
		
		cn.close();
		
		return lista;
	}
	
	public List<DetallePrefacturaBean> obtenerMateriales_x_Liquidacion1(String strIncidente) throws Exception {

		
		 ArrayList<DetallePrefacturaBean> lista=new ArrayList<DetallePrefacturaBean>();
		 
		//obtener una conexion		
		Connection cn = MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call  pr_obtenerMateriales_x_Liquidacion1(?) }");
		st.setString(1, strIncidente);
	
		ResultSet rs = st.executeQuery();	
		/*insertamos los gastos por materiales */
		while (rs.next()) {	
			DetallePrefacturaBean detalle=new DetallePrefacturaBean();
			detalle.setStrNumLiquidacion(rs.getString(1));
			detalle.setStrCodigo(rs.getString(2));
			if(rs.getString("des_mat_ext")==null || rs.getString("des_mat_ext").equals("") || rs.getString("des_mat_ext").equals("NULL")  )
				detalle.setStrDescripcion(rs.getString(8));
			else
			  detalle.setStrDescripcion(rs.getString(4));
			
			detalle.setIntCantidad(rs.getInt(5));
			detalle.setDecPrecio(rs.getBigDecimal(6));
			detalle.setDecImporte(rs.getBigDecimal(7));
		   lista.add(detalle);
		}
		/*insertamos los gastos por tecnicos*/
		
		 st = cn.prepareCall("{ call  pr_obtenerTecnico_x_Liquidacion(?) }");
		 st.setString(1, strIncidente);	
		 rs = st.executeQuery();				
		while (rs.next()) {	
			DetallePrefacturaBean detalle=new DetallePrefacturaBean();
			detalle.setStrNumLiquidacion(rs.getString(1));
			detalle.setStrCodigo(rs.getString(2));
			detalle.setStrDescripcion(rs.getString(3));			
			detalle.setIntCantidad(rs.getInt(4));
			detalle.setDecPrecio(rs.getBigDecimal(5));
			detalle.setDecImporte(rs.getBigDecimal(6));
			detalle.setStrFlag("TC");
		   lista.add(detalle);
		}	
		
		cn.close();
		
		return lista;
	}
	
	
	
	
	
	public boolean aprobarPrefactura(PrefacturaBean prefactura , boolean flag,String[] servicio  )throws Exception{
		//obtener una conexion
		Connection cn =MySqlDbConn.obtenerConexion();
		CallableStatement st = cn.prepareCall("{ call pr_aprobarPrefactura(?,?,?,?)}");
		if(flag){
			System.out.println("dentro del la implementacion opcion if");
			st.setString(1,prefactura.getStrNumPrefactura());
			st.setString(2,"");
			st.setBigDecimal(3,prefactura.getDecMonPrefactura());
			st.setBoolean(4,true);
		}else{
			System.out.println("dentro del la implementacion opcion else");
			st.setString(1,prefactura.getStrNumPrefactura());
			st.setString(2,prefactura.getStrObsPrefactura());
			st.setBigDecimal(3,prefactura.getDecMonPrefactura());
			st.setBoolean(4,false);
		}
		
		st.execute();
			
				
		return true;
	}
	
	
	public boolean grabarFactura(PrefacturaBean prefactura ) throws Exception{
		
		/*obtenemos el numero de la factura de la tabla talonario*/
		Connection cn=MySqlDbConn.obtenerConexion();
		/*CallableStatement st=cn.prepareCall("{ call  pr_obtenerSiguienteCDPDeTalonario() }");
		ResultSet rs=st.executeQuery();
		String strSerie="";
		String strFactura="";
			if(rs.next()){
				strSerie=rs.getString(1);
				strFactura=rs.getString(2);
			}*/
	//	BigDecimal total=new BigDecimal("0.0");
		//total.add(prefactura.getDecMonPrefactura());
		//total.add(prefactura.getDecMonPrefactura().multiply(new BigDecimal(0.19)));
			
			BigDecimal montoPrefac = prefactura.getDecMonPrefactura();
			BigDecimal igv         = prefactura.getDecMonPrefactura().multiply(new BigDecimal(0.19));
			BigDecimal descuento   = prefactura.getDecMonDescuento();
			
			BigDecimal total       = montoPrefac.add(igv).add(descuento).subtract(descuento) ;
		String[] aCodigo=obtenerSiquienteSerie();
		/*generamos la factura */
		CallableStatement st=cn.prepareCall("{ call pr_generarfactura(?,?,?,?,?,?,?,?) }");
				st.setString(1, aCodigo[0]);
				st.setString(2, aCodigo[1]);
				st.setString(3, prefactura.getStrNumPrefactura());
				st.setString(4, prefactura.getStrCodRegistrador());
				st.setBigDecimal(5,montoPrefac);
				st.setBigDecimal(6,igv);
				st.setBigDecimal(7, descuento);
				st.setBigDecimal(8, total);				
			
				if(st.execute())
					return true;
				
		return true;
	}
	
	
	public double obtenerMontoDescuento(String strMaterial,String strCliente) throws Exception{
		Connection cn =MySqlDbConn.obtenerConexion();
		double dblMontoDescuento=0;
		CallableStatement st = cn.prepareCall("{ call pr_obtenerDescuentoMateriales_x_Cliente(?,?)}");
		st.setString(1,strMaterial);
		st.setString(2,strCliente);
		st.execute();
		dblMontoDescuento=st.getDouble(1);		
		return dblMontoDescuento;
	}
	
	public void grabarDetallefactura(String strSerie,String strFactura,int item,double dblMonto) throws Exception{
		System.out.println("grabar detalle factura");
		Connection cn =MySqlDbConn.obtenerConexion();
		CallableStatement st1=cn.prepareCall("{ call pr_generardetalleFactura(?,?,?,?) }");
		st1.setString(1, strSerie);
		st1.setString(2, strFactura);
		st1.setInt(3,item );
		st1.setDouble(4,dblMonto);
	
		st1.execute();
	}
	
	private String[] obtenerSiquienteSerie() throws Exception{
		
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st=cn.prepareCall("{ call  pr_obtenerSiguienteCDPDeTalonario() }");
		String[]acodigo=new String[2];
		ResultSet rs=st.executeQuery();
		String strSerie="";
		String strFactura="";
			if(rs.next()){
				acodigo[0]=rs.getString(1);
				acodigo[1]=rs.getString(2);
			}
			return acodigo;
	}
	
	public String[] obtenerSerieFactura (String prefactura) throws Exception{
		System.out.println("dentro del metodo obtenerserie factura con numero prefactura " + prefactura);
		Connection cn =MySqlDbConn.obtenerConexion();
		String consulta="select num_serie,num_fac from factura where num_prefac=?";
		String[] sdatos=new String[2];
		PreparedStatement st=cn.prepareStatement(consulta);
		st.setString(1, prefactura);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			sdatos[0]=rs.getString(1);
			sdatos[1]=rs.getString(2);
		}
		System.out.println("serie  " + sdatos[0]);
		System.out.println("factura  " + sdatos[1]);
		return sdatos;
	}
	
	
	public FacturaBean obtenerFactura(String codPrefactura) throws Exception
	
	{
		FacturaBean factura=null;
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st=cn.prepareCall("{ call  pr_obtenerfactura(?) }");
		st.setString(1,codPrefactura);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			factura=new FacturaBean();
			factura.setStrNumSerie(rs.getString(1));
			factura.setStrNumFactura(rs.getString(2));
			factura.setStrNumPrefactura(rs.getString(3));
			factura.setBdecSubTotal(rs.getBigDecimal(6));
			factura.setBdecIGV(rs.getBigDecimal(7));
			factura.setStrIgv(rs.getString(7));
			factura.setBdecMontoDescuento(rs.getBigDecimal(8));
			factura.setBdesTotal(rs.getBigDecimal(9));
		}
		
		
		return factura;
	}
	
	public List<DetalleFacturaBean> obtenerDetalleFactura(String strSerie,String strNumFactura) throws Exception{
		DetalleFacturaBean detalle=null;
		ArrayList<DetalleFacturaBean>lista=new ArrayList<DetalleFacturaBean>();
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st=cn.prepareCall("{ call  pr_obtenerdetallefactura(?,?) }");
		st.setString(1,strSerie);
		st.setString(2,strNumFactura);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			detalle=new DetalleFacturaBean();
			detalle.setStrNumSerie(rs.getString(1));
			detalle.setStrNumFactura(rs.getString(2));
			detalle.setIntCodServicio(rs.getInt(3));
			detalle.setDblMonto(rs.getDouble(4));
			detalle.setStrDescripcion(rs.getString(5));
			lista.add(detalle);
		}
		
		
		return lista;
	}
	
	public ClienteBean obtenerCliente(String strPrefactura) throws Exception{
		ClienteBean cliente = null;
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st=cn.prepareCall("{ call  pr_buscarClientesPorPrefactura(?) }");		
		st.setString(1,strPrefactura);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			cliente=new ClienteBean();
			cliente.setStrRucCliente(rs.getString(4));
			cliente.setStrRazSocCliente(rs.getString(5));
			
		}
		
		
		return cliente;
	}
	
	
	

}
