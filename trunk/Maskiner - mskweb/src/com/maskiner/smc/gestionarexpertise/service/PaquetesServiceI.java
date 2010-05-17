package com.maskiner.smc.gestionarexpertise.service;

import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.gestionarexpertise.bean.ActividadesBean;
import com.maskiner.smc.gestionarexpertise.bean.HerramientaBean;
import com.maskiner.smc.gestionarexpertise.bean.MaterialesBean;
import com.maskiner.smc.gestionarexpertise.bean.PaqueteBean;

public interface PaquetesServiceI {

	public PaqueteBean obtenerPaquete(String strCodigo) throws Exception;
	public List<PaqueteBean> listarPaquete(String nombrePaquete, String codMaquinaria)throws Exception;

	public List<HerramientaBean> listarHerramientas(String nomHerramienta) throws Exception;
	public List<MaterialesBean> listarMateriales(String nomMat) throws Exception;
	public List<ActividadesBean> listarActividades(String nomAct, int itm) throws Exception;
	
	public List<PaqueteBean> listadoPaquetes(String codigoPaquete, String nombrePaquete
	) throws Exception ;
	public ArrayList<HerramientaBean> listarHerramienta()throws Exception;
	public ArrayList<MaterialesBean> listarMateriales()throws Exception;
	public int RegistrarPaqueteyDetallePaquete(PaqueteBean bean,ArrayList<HerramientaBean> detHerr,ArrayList<MaterialesBean> detMat,ArrayList<ActividadesBean> detAct) throws Exception;
	public void RegistrarPaqueteyDetallePaquete(PaqueteBean regPaquete,
			ArrayList<HerramientaBean> detHerr,
			ArrayList<HerramientaBean> detMat, ArrayList<HerramientaBean> detAct);
	
	public void generarPaquete(PaqueteBean paquete)	throws Exception;
}
