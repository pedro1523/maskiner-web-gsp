package com.maskiner.smc.logistica.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import com.maskiner.smc.gestionarincidentes.bean.DetalleRegistroIncidenteBean;
import com.maskiner.smc.liquidartrabajo.bean.MaterialesXLiquidacionBean;
import com.maskiner.smc.logistica.bean.MaterialBean;
import com.maskiner.smc.logistica.bean.TipoMaterialBean;
import com.maskiner.smc.logistica.service.LogisticaBusinessDelegate;
import com.maskiner.smc.logistica.service.MaterialServiceI;

public class MaterialesAction extends MappingDispatchAction {
	
	public ActionForward cargarBuscarMateriales(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.getSession().setAttribute("b_tiposMateriales", null);
		request.getSession().setAttribute("b_materiales", null);
		
		MaterialServiceI servicio = LogisticaBusinessDelegate.getMaterialService();
		
		List<TipoMaterialBean> tiposMateriales = servicio.obtenerTiposMateriales();
				
		request.getSession().setAttribute("b_tiposMateriales", tiposMateriales);
		
		return mapping.findForward("exito");
	}
	

	public ActionForward buscarMateriales(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//recupera los parámetros de búsqueda
		
		int intCodTipMaterial = request.getParameter("tipoMaterial")==null?0:Integer.parseInt(request.getParameter("tipoMaterial"));
		String strDescripcion = request.getParameter("descripMaterial");
		
		MaterialServiceI servicio = LogisticaBusinessDelegate.getMaterialService();
		List<MaterialBean> materiales = servicio.buscarMateriales(intCodTipMaterial, strDescripcion);
		
		request.getSession().setAttribute("b_materiales", materiales);
		
		return mapping.findForward("exito");
	}
	

	public ActionForward buscarMaterialesDevolverMaterial(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession sesion = request.getSession();
		request.getSession().setAttribute("b_tiposMateriales", null);
		request.getSession().setAttribute("b_materiales", null);
		
		String strCodMaterial = request.getParameter("CodMaterial");
		
		//recuperar el bean
		MaterialServiceI servicio = LogisticaBusinessDelegate.getMaterialService();
		MaterialBean material = servicio.obtenerMaterial(strCodMaterial);
		
		sesion.setAttribute("b_material", material);

		return mapping.findForward("exito");
	}
	
	
	public ActionForward buscarMaterialesSalir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.getSession().setAttribute("b_tiposMateriales", null);
		request.getSession().setAttribute("b_materiales", null);
		
		return mapping.findForward("exito");
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward AgregarALista(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession sesion = request.getSession();
		ArrayList<MaterialesXLiquidacionBean> Materiales = new ArrayList<MaterialesXLiquidacionBean>();
		if (sesion.getAttribute("Materiales") == null) {
			Materiales = (ArrayList<MaterialesXLiquidacionBean>)sesion.getAttribute("materialesIni");
		} else {
			Materiales = (ArrayList<MaterialesXLiquidacionBean>)sesion.getAttribute("Materiales");
		}

		
		if(sesion.getAttribute("b_material")==null){
			request.setAttribute("mensajeerror", "Primero debe buscar un material");
			return mapping.findForward("exito");
		}else{
			try{
				Integer.parseInt(request.getParameter("cantidadMaterial"));
			}
			
			catch (Exception e) {
				request.setAttribute("mensajeerror", "Debe ingresar una Cantidad Válida");
				return mapping.findForward("exito");
			}
			
			Integer i = Integer.parseInt(request.getParameter("cantidadMaterial"));
			
			MaterialesXLiquidacionBean material = new MaterialesXLiquidacionBean();
			MaterialBean bean = (MaterialBean)sesion.getAttribute("b_material");
			material.setStrCodMaterial(bean.getStrCodMaterial());
			material.setStrDescripTipoMaterial(bean.getStrDescripMaterial());
			material.setStrDescripMaterial(bean.getStrDescripMaterial());
			material.setIntCantidad(Integer.parseInt(request.getParameter("cantidadMaterial")));
			material.setDecPrecioUnitario(bean.getBdPrecioUnitario());
			material.setDecMontoTotal(bean.getBdPrecioUnitario().multiply(new BigDecimal(i)));
			material.setIntItem(Materiales.size()+1);
			
			
			Materiales.add(material);
	
			sesion.setAttribute("Materiales", Materiales);
			return mapping.findForward("exito");
		}
	}
	
}
