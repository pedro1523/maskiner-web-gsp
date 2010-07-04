package com.maskiner.smc.reportes.service;

public class ReportesBusinessDelegate {
	public static ReportesServiceI getReporteService(){
		return new ReportesServiceImpl();
	}
}
