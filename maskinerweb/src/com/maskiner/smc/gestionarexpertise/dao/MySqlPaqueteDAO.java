package com.maskiner.smc.gestionarexpertise.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.maskiner.smc.ibatis.*;
import com.maskiner.smc.gestionarexpertise.bean.ActividadesBean;
import com.maskiner.smc.gestionarexpertise.bean.HerramientaBean;
import com.maskiner.smc.gestionarexpertise.bean.MaterialesBean;
import com.maskiner.smc.gestionarexpertise.bean.PaqueteBean;
import com.maskiner.smc.gestionarexpertise.bean.PaqueteIbatis;
import com.maskiner.smc.mylib.MySqlDbConn;
import com.maskiner.smc.mylib.UtilSqlConfig;

public class MySqlPaqueteDAO implements PaqueteDAO {
	
	public PaqueteBean obtenerPaquete(String strCodigo) throws Exception{		
		
		PaqueteBean paquete=null;			
		Connection cn=MySqlDbConn.obtenerConexion();
		ResultSet rs=null;
		CallableStatement st=cn.prepareCall("{ call pr_obtenerPaquete(?) }");
		st.setString(1,strCodigo);
		rs=st.executeQuery();
		
		while(rs.next()){
			paquete=new PaqueteBean();
			paquete.setStrCodPaquete(rs.getString("cod_paq"));
			paquete.setDatFechaRegistroPaquete(rs.getDate("fec_reg_paq"));
			paquete.setStrCodRegistro(rs.getString("cod_reg"));
			paquete.setStrNombre(rs.getString("nom_paq"));
			paquete.setStrMarcaMaqApliPaquete(rs.getString("desc_mar_maq"));
			paquete.setStrModeloMaqApliPaquete(rs.getString("mod_maq"));
			paquete.setIntCantidadTecPaquete(rs.getInt("cant_tec_paq"));
			paquete.setIntCantidadHoraPaquete(rs.getInt("cant_hor_paq"));
			paquete.setIntIntervaloHorometro(rs.getInt("interv_horom"));
			
		}			
		return paquete;
	}

	@Override
	public List<PaqueteBean> listarPaquete(String nombrePaquete,
			String codMaquinaria) throws Exception {
		ArrayList<PaqueteBean> lista=new ArrayList<PaqueteBean>();
		PaqueteBean paquete=null;
		Connection cn=MySqlDbConn.obtenerConexion();
		CallableStatement st=null;
		st=cn.prepareCall("{ call pr_obtenerListaPaquetes(?, ?) }");
		st.setString(1,nombrePaquete);
		st.setString(2,codMaquinaria);
		
		//System.out.println("Dentro del metodo");
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			paquete=new PaqueteBean();
			paquete.setStrCodPaquete(rs.getString("cod_paq"));
			paquete.setDatFechaRegistroPaquete(rs.getDate("fec_reg_paq"));
			paquete.setStrCodRegistro(rs.getString("cod_reg"));
			paquete.setStrNombre(rs.getString("nom_paq"));
			paquete.setStrMarcaMaqApliPaquete(rs.getString("desc_mar_maq"));
			paquete.setStrModeloMaqApliPaquete(rs.getString("mod_maq"));
			paquete.setIntCantidadTecPaquete(rs.getInt("cant_tec_paq"));
			paquete.setIntCantidadHoraPaquete(rs.getInt("cant_hor_paq"));
			paquete.setIntIntervaloHorometro(rs.getInt("interv_horom"));
			lista.add(paquete);			
		}		
		return lista;
	}
	
	public List<PaqueteBean> listadoPaquetes(String codigoPaquete,String nombrePaquete 
	) throws Exception {
ArrayList<PaqueteBean> lista=new ArrayList<PaqueteBean>();
PaqueteBean mantenPaquete=null;
Connection cn=MySqlDbConn.obtenerConexion();
CallableStatement st=null;
st=cn.prepareCall("{ call pr_listaDePaquetes(?,?)} ");
st.setString(1,codigoPaquete);
st.setString(2, nombrePaquete);

//System.out.println("Dentro del metodo");
ResultSet rs=st.executeQuery();
while(rs.next()){
	mantenPaquete=new PaqueteBean();
	mantenPaquete.setStrCodPaquete(rs.getString("cod_paq"));
	mantenPaquete.setDatFechaRegistroPaquete(rs.getDate("fec_reg_paq"));
	mantenPaquete.setStrCodRegistro(rs.getString("cod_reg"));
	mantenPaquete.setStrNombre(rs.getString("nom_paq"));
	mantenPaquete.setStrMarcaMaqApliPaquete(rs.getString("cod_maq"));
	mantenPaquete.setStrModeloMaqApliPaquete(rs.getString("mod_maq"));
	mantenPaquete.setIntCantidadTecPaquete(rs.getInt("cant_tec_paq"));
	mantenPaquete.setIntCantidadHoraPaquete(rs.getInt("cant_hor_paq"));
	mantenPaquete.setIntIntervaloHorometro(rs.getInt("interv_horom"));
	lista.add(mantenPaquete);			
}		
return lista;
}

/*
	  public List<PaqueteBean> listadoPaquetes(String codigoPaquete,String nombrePaquete) throws Exception{
		
		System.out.println("listamos por nombre con ibatis");
		 ArrayList<PaqueteBean> objPaqueteBean =new ArrayList<PaqueteBean>();
		 		
		SqlMapClient sqlmap = UtilSqlConfig.getSqlMapInstance();
		
		objPaqueteBean=
					(ArrayList<PaqueteBean>)sqlmap.queryForList("ibatis_listaPorPaquete","%"+ nombrePaquete+"%");
		
		return objPaqueteBean;
		
	}*/
	
//
public ArrayList<PaqueteBean> buscarPorPaquete(String strCodigo,String strNombre) throws Exception {

Connection cn = MySqlDbConn.obtenerConexion();
CallableStatement st = cn.prepareCall("{call pr_obtenerMantenerPaquete(?,?)}");
st.setString(1, strCodigo);
st.setString(2,strNombre);
ResultSet rs = st.executeQuery();
ArrayList<PaqueteBean> arr = new ArrayList<PaqueteBean>();
while(rs.next()){
	PaqueteBean r = new PaqueteBean();
	r.setStrCodPaquete(rs.getString("cod_paq"));
	r.setStrNombre(rs.getString("nom_cod"));
	r.setStrMarcaMaqApliPaquete(rs.getString("cod_reg"));
	r.setStrModeloMaqApliPaquete(rs.getString("ruc_cli"));
	
	arr.add(r);
}
cn.close();

return arr;
}
//registar un nuevo paquete
public void generarPaquete(PaqueteBean paquete)	throws Exception{

Connection cn =null;

try{
	cn = MySqlDbConn.obtenerConexion();
	cn.setAutoCommit(false);
	//obtener el nuevo numero de Paquete
	String strNuevoNumPaq = null;
	CallableStatement st1;
	//ResultSet rs =st1.executeQuery();
	//insertar paquete
	st1 = cn.prepareCall("{pr_insertarPaquete}");
	st1.setString(1, strNuevoNumPaq);
	st1.setDate(2,paquete.getDatFechaRegistroPaquete());
	st1.setString(3, paquete.getStrCodPaquete());
	st1.setString(4, paquete.getStrNombre());
	st1.setString(5, paquete.getStrMarcaMaqApliPaquete());
	st1.setString(6, paquete.getStrModeloMaqApliPaquete());
	st1.setInt(7, paquete.getIntCantidadTecPaquete());
	st1.setInt(8, paquete.getIntCantidadHoraPaquete());
	st1.setInt(9,paquete.getIntIntervaloHorometro());
	
	st1.execute();
	//insertar detalles
	CallableStatement  st2;
	CallableStatement st3;
	CallableStatement st4;
	
	st2 = cn.prepareCall("{pr_insertarActividad_Paquete}");
	st3 = cn.prepareCall("{pr_insertarHerramientas_Paquete}");
	st4 =cn.prepareCall("{pr_insertarMateriales_Paquete}");
	
	//insertar actividades en el paquete
	for(ActividadesBean actividades: paquete.getArrPaqueteDetActivBean()){
		st2.setString(1, actividades.getStrCodPaquetexAct());
		st2.setInt(2, actividades.getIntnumItemActxPaquete());
		st2.setString(3, actividades.getStrDescripcionAct());
		st2.execute();
	}
	//insertar herramientas en el paquete
	for(HerramientaBean herramientas: paquete.getArrPaqueteDetHerrBean()){

		st3.setString(1, herramientas.getStrCodPaquetexHerram());
		st3.setString(2, herramientas.getStrCodHerramienta());
		st3.setInt(3, herramientas.getIntCantidadHerramientaxPqte());
		st3.execute();
	}
	
	for(MaterialesBean materiales: paquete.getArrPaqueteDetMatBean()){
		st4.setString(1, materiales.getStrCodPaquetexMat());
		st4.setString(2, materiales.getStrCodMaterial());
		st4.setInt(3, materiales.getIntCantidadMat());
		st4.execute();
	}
	//grabamos el registro
	cn.commit();
	
}catch (Exception e){
	e.printStackTrace();
	cn.rollback();
	throw new Exception(e.getMessage(),e);
}
}
//FIN JUANK





public List<ActividadesBean> listarActividades(String nomAct, int itm)
	throws Exception {
ArrayList<ActividadesBean> listaAct = new ArrayList<ActividadesBean>();
ActividadesBean detalleAct = null;

Connection cn =MySqlDbConn.obtenerConexion();

String sql = "call pr_obtenerActividades";
PreparedStatement st=cn.prepareStatement(sql);
st.setString(1,"%"+nomAct+"%" );
st.setInt(2, itm);
ResultSet rs=st.executeQuery();

while(rs.next()){
	 
	   detalleAct = new ActividadesBean();
	detalleAct.setStrCodPaquetexAct(rs.getString(1));
	detalleAct.setIntnumItemActxPaquete(rs.getInt(2));
	
	listaAct.add(detalleAct);
}
cn.close();
return listaAct;

}


public ArrayList<MaterialesBean> listarMateriales()
	throws Exception {
		
Connection cn =MySqlDbConn.obtenerConexion();
CallableStatement st= cn.prepareCall("{CALL pr_obtenerMateriales()}");

ResultSet rs=st.executeQuery();
ArrayList<MaterialesBean> listaMat = new ArrayList<MaterialesBean>();
MaterialesBean detalleMat = null;

while(rs.next()){
	 
	   detalleMat = new MaterialesBean();
	detalleMat.setStrCodMaterial(rs.getString(1));
	detalleMat.setStrDescrMat(rs.getString(3));
	
	listaMat.add(detalleMat);
}
cn.close();
return listaMat;

}


public ArrayList<HerramientaBean> listarHerramienta()
	throws Exception {
Connection cn =MySqlDbConn.obtenerConexion();
CallableStatement st= cn.prepareCall("{call pr_obtenerHerramienta()}");

ResultSet rs=st.executeQuery();
ArrayList<HerramientaBean> listaHerr = new ArrayList<HerramientaBean>();
HerramientaBean detalleHerr = null;

while(rs.next()){
	 
	   detalleHerr = new HerramientaBean();
	detalleHerr.setStrCodHerramienta(rs.getString(1));
	detalleHerr.setStrDescripcionHerram(rs.getString(2));
	
	listaHerr.add(detalleHerr);
}
cn.close();
return listaHerr;
}

@Override
public List<HerramientaBean> listarHerramientas(String nomHerramienta)
		throws Exception {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<MaterialesBean> listarMateriales(String nomMat) throws Exception {
	// TODO Auto-generated method stub
	return null;
}


	
}
