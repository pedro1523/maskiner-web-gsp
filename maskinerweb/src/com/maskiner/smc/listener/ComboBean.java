package com.maskiner.smc.listener;

import java.io.Serializable;



public class ComboBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1216846858496183336L;
	private String codigo;
	private String descripcion;
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
		

}
