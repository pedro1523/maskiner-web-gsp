package com.maskiner.smc.mylib;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.SimpleTimeZone;
import java.util.regex.*;

import java.util.Date;
import java.sql.Time;
import java.text.*;

public class FormatoFecha {
	
	public static boolean isFecha(String fecha){
		if(fecha == null) return false;
		if(fecha.length()!=10) return false;
		
		/* comprobar que fecha tenga el formato dd/MM/yyyy */
		Pattern p = Pattern.compile("^(([0-2][1-9])|(3[01])|([12]0))\\/((0[1-9])|(1[0-2]))\\/\\d{4}$");	

		Matcher m = p.matcher(fecha);
		boolean b = m.matches();
		
		if(b){
			/*fecha tiene el formato indicado, pero hay que hacer
			  una comparación componente con componente */
			int dia = Integer.parseInt(fecha.substring(0, 2));
			int mes = Integer.parseInt(fecha.substring(3, 5));
			int anio = Integer.parseInt(fecha.substring(6, 10));
			
			//obteniendo la fecha parseada
			Date f = getFechaDe(fecha);
			
			if(f == null) return false;
			else {
				//obtener un calendar
				Calendar c = Calendar.getInstance();
				c.setTime(f);
				int dia_comp = c.get(Calendar.DAY_OF_MONTH);
				int mes_comp = c.get(Calendar.MONTH)+1;
				int anio_comp = c.get(Calendar.YEAR);
				
				if(dia==dia_comp && mes==mes_comp && anio==anio_comp){
					//fecha coincide componente a componente
					return true;
				}else{
					return false;
				}
			}
		}else{
			/*fecha no tiene el formato indicado */
			return false;
		}
	}
	
	public static String getFechaActual(){
		Date fecha = new Date(Calendar.getInstance().getTimeInMillis());
		DateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); 
		return formateador.format(fecha);
	}
//	public static String getFechaActual(String formato){
//		Date fecha = new Date(Calendar.getInstance().getTimeInMillis());
//		DateFormat formateador = new SimpleDateFormat(formato); 
//		return formateador.format(fecha);
//	}
	
	public static String getFechaDe(Date fecha){
		DateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); 
		return formateador.format(fecha);
	}
	
	public static Date getFechaDe(String fecha){
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date d;
		try{
			d = new Date(df.parse(fecha).getTime());
		}catch(ParseException ex){
			return null;
		}
		return d;
	}
	
	public static Time getHoraDe(String hora){
		SimpleDateFormat df = new SimpleDateFormat("HH:mm");

		Time t;
		try{
			t = new Time(df.parse(hora).getTime());
		}catch(ParseException ex){
			return null;
		}
		return t;
	}
	
	
	public static int getDiffFechas(Date f1, Date f2){
		 // create a Pacific Standard Time time zone
		SimpleTimeZone pdt = new SimpleTimeZone(-5 * 60 * 60 * 1000, "America/Lima");
		
		 // create a GregorianCalendar with the Pacific Daylight time zone
		Calendar calendar1 = new GregorianCalendar(pdt);
		Calendar calendar2 = new GregorianCalendar(pdt);
		
		calendar1.setTime(f1);
		calendar2.setTime(f2);
		
		long mlls1 = calendar1.getTimeInMillis();
		long mlls2 = calendar2.getTimeInMillis();

		return (int)((mlls2-mlls1)/ (1000 * 60 * 60 * 24));
	}
	
	public static int getDiffHoras(Time h1, Time h2) {
		
		long mlls1 = h1.getTime();
		long mlls2 = h2.getTime();
		
		return (int)((mlls2-mlls1)/ (1000 * 60 * 60));
	}
	
	public static Date getComponenteFecha(Date fecha) {
		
		GregorianCalendar c = (GregorianCalendar) Calendar.getInstance();
		
		c.setTime(fecha);
		
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		c.set(Calendar.AM_PM, 0);
		
		return c.getTime();
		
	}

	public static Date agregarHoraAFecha(Date fecha, String hora) {
		
		GregorianCalendar c = (GregorianCalendar) Calendar.getInstance();
		
		c.setTime(fecha);
		
		//recupera la hora que esta en firmato HH:MM
		
		String[] horaMinuto = hora.split(":");
		
		c.add(Calendar.HOUR, Integer.parseInt(horaMinuto[0]));
		c.add(Calendar.MINUTE, Integer.parseInt(horaMinuto[1]));
		
		// TODO Auto-generated method stub
		return c.getTime();
	}
	
	public static String formatearFecha(Date fecha, String formato) {
		SimpleDateFormat sdf = (SimpleDateFormat) DateFormat.getInstance();
		sdf.applyPattern(formato);
		return sdf.format(fecha);
	}

	
	/**
	 * Detecta si dos rangos de hora a y b se intersectan.<br>
	 * Rango a = (a0, a1).<br>
	 * Rango b = (b0, b1).<br>
	 * donde a0 < a1 y b0 < b1
	 * @param a0 : Límite inferior del rango a.
	 * @param a1 : Límite superior del rango a.
	 * @param b0 : Límite inferior del rango b.
	 * @param b1 : Límite superior del rango b.
	 * @return true, si hay colisión, false en caso contrario.
	 */
	public static boolean detectarColisionHoras(Time a0, Time a1, Time b0, Time b1){
		boolean resultado = false;
		
		//creamos un calendar iterador calIterator y otro calendar que representa el límite
		//superior de a
		GregorianCalendar calIterator = (GregorianCalendar) Calendar.getInstance();
		GregorianCalendar calLimitSupA = (GregorianCalendar) Calendar.getInstance();
		calIterator.setTimeInMillis(a0.getTime());
		calLimitSupA.setTimeInMillis(a1.getTime());
		
		//creamos calendar para el intervalo b
		GregorianCalendar calLimitInfB = (GregorianCalendar) Calendar.getInstance();
		GregorianCalendar calLimitSupB = (GregorianCalendar) Calendar.getInstance();
		calLimitInfB.setTimeInMillis(b0.getTime());
		calLimitSupB.setTimeInMillis(b1.getTime());
		
		while(calIterator.before(calLimitSupA) || calIterator.equals(calLimitSupA)){
			if(calIterator.after(calLimitInfB) && calIterator.before(calLimitSupB)){
				resultado = true;
				break;
			}
			calIterator.add(Calendar.MINUTE, 30);
		}
		
		return resultado;
	}
	
	
}
