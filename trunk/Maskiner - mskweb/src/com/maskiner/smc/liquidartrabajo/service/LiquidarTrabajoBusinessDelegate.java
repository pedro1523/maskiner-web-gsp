package com.maskiner.smc.liquidartrabajo.service;

public class LiquidarTrabajoBusinessDelegate {
	
	public static LiquidacionServiceI getLiquidacionService(){
		return new LiquidacionServiceImpl();
	}

}
