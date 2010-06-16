package com.maskiner.smc.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MaskinerListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		ServletContext sc=arg0.getServletContext();
		
		//cargamos todas las listas
		List<ComboBean> lista= null;
		
		lista = getHoras();
		sc.setAttribute("l_hora",lista);
		
//		lista = getHerramientas();
//		sc.setAttribute("l_herramientas",lista);
//
//		lista = getHoras();
//		sc.setAttribute("l_hora",lista);

	}

	private List<ComboBean> getHoras() {
		
		//creamos la lista de horas
		ComboBean c1 = new ComboBean();
		c1.setCodigo("07:30");
		c1.setDescripcion("07:30");
		ComboBean c2 = new ComboBean();
		c2.setCodigo("08:00");
		c2.setDescripcion("08:00");
		ComboBean c3 = new ComboBean();
		c3.setCodigo("08:30");
		c3.setDescripcion("08:30");
		ComboBean c4 = new ComboBean();
		c4.setCodigo("09:00");
		c4.setDescripcion("09:00");
		ComboBean c5 = new ComboBean();
		c5.setCodigo("09:30");
		c5.setDescripcion("09:30");
		ComboBean c6 = new ComboBean();
		c6.setCodigo("10:00");
		c6.setDescripcion("10:00");
		ComboBean c7 = new ComboBean();
		c7.setCodigo("10:30");
		c7.setDescripcion("10:30");
		ComboBean c8 = new ComboBean();
		c8.setCodigo("11:00");
		c8.setDescripcion("11:00");
		ComboBean c9 = new ComboBean();
		c9.setCodigo("11:30");
		c9.setDescripcion("11:30");
		ComboBean c10 = new ComboBean();
		c10.setCodigo("12:00");
		c10.setDescripcion("12:00");
		ComboBean c11 = new ComboBean();
		c11.setCodigo("12:30");
		c11.setDescripcion("12:30");
		ComboBean c12 = new ComboBean();
		c12.setCodigo("13:00");
		c12.setDescripcion("13:00");
		ComboBean c13 = new ComboBean();
		c13.setCodigo("13:30");
		c13.setDescripcion("13:30");
		ComboBean c14 = new ComboBean();
		c14.setCodigo("14:00");
		c14.setDescripcion("14:00");
		ComboBean c15 = new ComboBean();
		c15.setCodigo("14:30");
		c15.setDescripcion("14:30");
		ComboBean c16 = new ComboBean();
		c16.setCodigo("15:00");
		c16.setDescripcion("15:00");
		ComboBean c17 = new ComboBean();
		c17.setCodigo("15:30");
		c17.setDescripcion("15:30");
		ComboBean c18 = new ComboBean();
		c18.setCodigo("16:00");
		c18.setDescripcion("16:00");
		ComboBean c19 = new ComboBean();
		c19.setCodigo("16:30");
		c19.setDescripcion("16:30");
		ComboBean c20 = new ComboBean();
		c20.setCodigo("17:00");
		c20.setDescripcion("17:00");
		ComboBean c21 = new ComboBean();
		c21.setCodigo("17:30");
		c21.setDescripcion("17:30");
		
		List<ComboBean> lista=new ArrayList<ComboBean>();
		lista.add(c1);
		lista.add(c2);
		lista.add(c3);
		lista.add(c4);
		lista.add(c5);
		lista.add(c6);
		lista.add(c7);
		lista.add(c8);
		lista.add(c9);
		lista.add(c10);
		lista.add(c11);
		lista.add(c12);
		lista.add(c13);
		lista.add(c14);
		lista.add(c15);
		lista.add(c16);
		lista.add(c17);
		lista.add(c18);
		lista.add(c19);
		lista.add(c20);
		lista.add(c21);
		
		return lista;
	}

}
