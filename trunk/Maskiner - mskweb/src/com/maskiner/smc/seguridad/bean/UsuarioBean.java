package com.maskiner.smc.seguridad.bean;

import java.util.ArrayList;

public class UsuarioBean {
	private String codigoUsuario;
	private String dniUsuario;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private String nombres;
	private String domicilio;
	private String telefono;
	private String cargo;
	private String username;
	private String password;
	private Integer estadoUsuario;
	private String estadoUsuarioDescripcion;
	private ArrayList<RolUsuarioBean> roles;
	
	
	public UsuarioBean() {
		roles = new ArrayList<RolUsuarioBean>();
	}
	
	
	public ArrayList<RolUsuarioBean> getRoles() {
		return roles;
	}
	public String getCodigoUsuario() {
		return codigoUsuario;
	}
	public void setCodigoUsuario(String codigoUsuario) {
		this.codigoUsuario = codigoUsuario;
	}
	public String getDniUsuario() {
		return dniUsuario;
	}
	public void setDniUsuario(String dniUsuario) {
		this.dniUsuario = dniUsuario;
	}
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}
	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getEstadoUsuario() {
		return estadoUsuario;
	}
	public void setEstadoUsuario(Integer estadoUsuario) {
		this.estadoUsuario = estadoUsuario;
	}
	public String getEstadoUsuarioDescripcion() {
		return estadoUsuarioDescripcion;
	}
	public void setEstadoUsuarioDescripcion(String estadoUsuarioDescripcion) {
		this.estadoUsuarioDescripcion = estadoUsuarioDescripcion;
	}
	
	public boolean tieneRol(String codigoRol){
		for(RolUsuarioBean rol:roles){
			if(rol.getCodigoRol().equals(codigoRol)){
				return true;
			}
		}
		return false;
	}
	
}
