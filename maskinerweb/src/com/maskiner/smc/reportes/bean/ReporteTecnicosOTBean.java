package com.maskiner.smc.reportes.bean;

import java.sql.Time;
import java.util.Date;

public class ReporteTecnicosOTBean {
	
	private String numOrdenTrabajo;
	private String direccionCliente;
	private String razonSocialCliente;
	private Date   fechaOrdenTrabajo;
	private String codTecnico;
	private String nombreTecnico;
	private Time   horaInicio;
	private Time   horaFin;
	
	public String getNumOrdenTrabajo() {
		return numOrdenTrabajo;
	}
	public void setNumOrdenTrabajo(String numOrdenTrabajo) {
		this.numOrdenTrabajo = numOrdenTrabajo;
	}
	public String getDireccionCliente() {
		return direccionCliente;
	}
	public void setDireccionCliente(String direccionCliente) {
		this.direccionCliente = direccionCliente;
	}
	public String getRazonSocialCliente() {
		return razonSocialCliente;
	}
	public void setRazonSocialCliente(String razonSocialCliente) {
		this.razonSocialCliente = razonSocialCliente;
	}
	public Date getFechaOrdenTrabajo() {
		return fechaOrdenTrabajo;
	}
	public void setFechaOrdenTrabajo(Date fechaOrdenTrabajo) {
		this.fechaOrdenTrabajo = fechaOrdenTrabajo;
	}
	public String getCodTecnico() {
		return codTecnico;
	}
	public void setCodTecnico(String codTecnico) {
		this.codTecnico = codTecnico;
	}
	public String getNombreTecnico() {
		return nombreTecnico;
	}
	public void setNombreTecnico(String nombreTecnico) {
		this.nombreTecnico = nombreTecnico;
	}
	public Time getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(Time horaInicio) {
		this.horaInicio = horaInicio;
	}
	public Time getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(Time horaFin) {
		this.horaFin = horaFin;
	}
	
	

}
