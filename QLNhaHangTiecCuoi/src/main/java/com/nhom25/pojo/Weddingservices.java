/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "weddingservices")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Weddingservices.findAll", query = "SELECT w FROM Weddingservices w"),
    @NamedQuery(name = "Weddingservices.findByWeddingservicesId", query = "SELECT w FROM Weddingservices w WHERE w.weddingservicesId = :weddingservicesId"),
    @NamedQuery(name = "Weddingservices.findByName", query = "SELECT w FROM Weddingservices w WHERE w.name = :name"),
    @NamedQuery(name = "Weddingservices.findByPrice", query = "SELECT w FROM Weddingservices w WHERE w.price = :price")})
public class Weddingservices implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "weddingservices_id")
    private Integer weddingservicesId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100, message = "{services.name.sizeMsg}")
    @Column(name = "name")
    private String name;
    
    @Column(name = "price")
    @NotNull(message = "{services.price.notNullMsg}")
    @Max(value = 100000000, message = "{services.maxPrices.error}")
    private Long price;
    @Lob
    @Size(max = 16777215)
    @Column(name = "description")
    private String description;
    
    @JsonIgnore
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "weddingservicesId")
    private Set<Wedding> weddingSet;

    public Weddingservices() {
    }

    public Weddingservices(Integer weddingservicesId) {
        this.weddingservicesId = weddingservicesId;
    }

    public Weddingservices(Integer weddingservicesId, String name) {
        this.weddingservicesId = weddingservicesId;
        this.name = name;
    }

    public Integer getWeddingservicesId() {
        return weddingservicesId;
    }

    public void setWeddingservicesId(Integer weddingservicesId) {
        this.weddingservicesId = weddingservicesId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Set<Wedding> getWeddingSet() {
        return weddingSet;
    }

    public void setWeddingSet(Set<Wedding> weddingSet) {
        this.weddingSet = weddingSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (weddingservicesId != null ? weddingservicesId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Weddingservices)) {
            return false;
        }
        Weddingservices other = (Weddingservices) object;
        if ((this.weddingservicesId == null && other.weddingservicesId != null) || (this.weddingservicesId != null && !this.weddingservicesId.equals(other.weddingservicesId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.Weddingservices[ weddingservicesId=" + weddingservicesId + " ]";
    }
    
}
