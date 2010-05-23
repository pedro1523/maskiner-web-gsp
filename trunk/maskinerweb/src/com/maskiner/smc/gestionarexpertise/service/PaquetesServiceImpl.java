package com.maskiner.smc.gestionarexpertise.service;

import java.util.ArrayList;
import java.util.List;

import com.maskiner.smc.factory.DAOFactory;
import com.maskiner.smc.gestionarexpertise.bean.ActividadesBean;
import com.maskiner.smc.gestionarexpertise.bean.HerramientaBean;
import com.maskiner.smc.gestionarexpertise.bean.MaterialesBean;
import com.maskiner.smc.gestionarexpertise.bean.PaqueteBean;
import com.maskiner.smc.gestionarexpertise.dao.PaqueteDAO;

public class PaquetesServiceImpl implements PaquetesServiceI {
	
	public PaqueteDAO paqueteDAO;
	
	public PaquetesServiceImpl(){
		DAOFactory factory=DAOFactory.getDAOFactory();
		paqueteDAO=factory.getPaqueteDAO();
	}
	
	
	public PaqueteBean obtenerPaquete(String strCodigo) throws Exception{
		return paqueteDAO.obtenerPaquete(strCodigo);
	}

	@Override
	public List<PaqueteBean> listarPaquete(String nombrePaquete,
			String codMaquinaria) throws Exception {
		// TODO Auto-generated method stub
		return paqueteDAO.listarPaquete(nombrePaquete, codMaquinaria);
	}
	
public ArrayList<HerramientaBean> listarHerramienta() throws Exception{
		
		return paqueteDAO.listarHerramienta();
	}
	public List<MaterialesBean> listarMateriales(String nomMat) throws Exception{
	return paqueteDAO.listarMateriales(nomMat);	
	}
	public List<ActividadesBean> listarActividades(String nomAct, int itm) throws Exception{
	return paqueteDAO.listarActividades(nomAct, itm);	
	}


	public List<PaqueteBean> listadoPaquetes(String codigoPaquete, String nombrePaquete)
			throws Exception {
		
		return paqueteDAO.listadoPaquetes(codigoPaquete,nombrePaquete);
	}

	public List<HerramientaBean> listarHerramientas(String nomHerramienta)
	throws Exception {

return null;
}


@Override
public ArrayList<MaterialesBean> listarMateriales() throws Exception {

return paqueteDAO.listarMateriales();
}



@Override
public int RegistrarPaqueteyDetallePaquete(PaqueteBean bean,
	ArrayList<HerramientaBean> detHerr,
	ArrayList<MaterialesBean> detMat, ArrayList<ActividadesBean> detAct)
	throws Exception {

return 0;
}


@Override
public void RegistrarPaqueteyDetallePaquete(PaqueteBean bean,
	ArrayList<HerramientaBean> detHerr,
	ArrayList<HerramientaBean> detMat, ArrayList<HerramientaBean> detAct) {


}

public void generarPaquete(PaqueteBean paquete)	throws Exception{
paqueteDAO.generarPaquete(paquete);
}
}
