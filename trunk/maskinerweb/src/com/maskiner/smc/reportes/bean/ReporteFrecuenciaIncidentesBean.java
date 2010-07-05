package com.maskiner.smc.reportes.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.eclipse.persistence.annotations.NamedStoredProcedureQuery;
import org.eclipse.persistence.annotations.StoredProcedureParameter;

@Entity
@NamedStoredProcedureQuery(name = "pr_reporteFrecuenciaIncidentes",
		procedureName = "pr_reporteFrecuenciaIncidentes",
		parameters = {
			@StoredProcedureParameter(queryParameter="cod_cli", name="vcod_cli", type=String.class),
			@StoredProcedureParameter(queryParameter="annio", name="vanio", type=String.class)
		},
		returnsResultSet=true
/*		,
		resultClass=ReporteFrecuenciaIncidentesBean.class
*/
)
public class ReporteFrecuenciaIncidentesBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2967003664281209474L;

	@Id
	@Column(name="cod_cli")
	private String codCliente;
	
	@Column(name="raz_soc_cli")
	private String razonSocialCliente;
	
	@Column(name="annio")
	private String annio;

	@Column(name="num_tar")
	private String numeroTarjeta;
	
	@Column(name="desc_maq")
	private String descripMaquinaria;

	@Column(name="cant_hidrau")
	private Long cantidadHidraulicos;

	@Column(name="cant_mecan")
	private Long cantidadMecanicos;

	@Column(name="cant_elect")
	private Long cantidadElectricos;

	@Column(name="cant_neumat")
	private Long cantidadNeumaticos;

	@Column(name="cant_otro")
	private Long cantidadOtros;

	@Column(name="cant_total")
	private Long cantidadTotal;

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getRazonSocialCliente() {
		return razonSocialCliente;
	}

	public void setRazonSocialCliente(String razonSocialCliente) {
		this.razonSocialCliente = razonSocialCliente;
	}

	public String getAnnio() {
		return annio;
	}

	public void setAnnio(String annio) {
		this.annio = annio;
	}

	public String getNumeroTarjeta() {
		return numeroTarjeta;
	}

	public void setNumeroTarjeta(String numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}

	public String getDescripMaquinaria() {
		return descripMaquinaria;
	}

	public void setDescripMaquinaria(String descripMaquinaria) {
		this.descripMaquinaria = descripMaquinaria;
	}

	public Long getCantidadHidraulicos() {
		return cantidadHidraulicos;
	}

	public void setCantidadHidraulicos(Long cantidadHidraulicos) {
		this.cantidadHidraulicos = cantidadHidraulicos;
	}

	public Long getCantidadMecanicos() {
		return cantidadMecanicos;
	}

	public void setCantidadMecanicos(Long cantidadMecanicos) {
		this.cantidadMecanicos = cantidadMecanicos;
	}

	public Long getCantidadElectricos() {
		return cantidadElectricos;
	}

	public void setCantidadElectricos(Long cantidadElectricos) {
		this.cantidadElectricos = cantidadElectricos;
	}

	public Long getCantidadNeumaticos() {
		return cantidadNeumaticos;
	}

	public void setCantidadNeumaticos(Long cantidadNeumaticos) {
		this.cantidadNeumaticos = cantidadNeumaticos;
	}

	public Long getCantidadOtros() {
		return cantidadOtros;
	}

	public void setCantidadOtros(Long cantidadOtros) {
		this.cantidadOtros = cantidadOtros;
	}

	public Long getCantidadTotal() {
		return cantidadTotal;
	}

	public void setCantidadTotal(Long cantidadTotal) {
		this.cantidadTotal = cantidadTotal;
	}

	
}
