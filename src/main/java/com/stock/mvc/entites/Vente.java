package com.stock.mvc.entites;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Vente implements Serializable{

	@Id
	@GeneratedValue
	private Long idVente;
	
	private String code;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateVente;
	
	@OneToMany(mappedBy = "vente")
	private List<LigneVente> ligneVentes;

	public Long getIdVente() {
		return idVente;
	}

	public void setIdVente(Long id) {
		this.idVente = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getDateVente() {
		return dateVente;
	}

	public void setDateVente(Date dateVente) {
		this.dateVente = dateVente;
	}

	public List<LigneVente> getLigneVentes() {
		return ligneVentes;
	}

	public void setLigneVentes(List<LigneVente> ligneVentes) {
		this.ligneVentes = ligneVentes;
	}
	
	
	
}
