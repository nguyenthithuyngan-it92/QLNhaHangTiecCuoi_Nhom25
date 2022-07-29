/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "wedding")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Wedding.findAll", query = "SELECT w FROM Wedding w"),
    @NamedQuery(name = "Wedding.findByWeddingId", query = "SELECT w FROM Wedding w WHERE w.weddingId = :weddingId"),
    @NamedQuery(name = "Wedding.findByCoefficient", query = "SELECT w FROM Wedding w WHERE w.coefficient = :coefficient")})
public class Wedding implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "wedding_id")
    private Integer weddingId;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16777215)
    @Column(name = "name")
    private String name;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "coefficient")
    private Float coefficient;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "weddingId")
    private Set<Feedback> feedbackSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "weddingId")
    private Set<Orders> ordersSet;
    @JoinColumn(name = "weddinghall_id", referencedColumnName = "weddinghall_id")
    @ManyToOne(optional = false)
    private Weddinghall weddinghallId;
    @JoinColumn(name = "weddingservices_id", referencedColumnName = "weddingservices_id")
    @ManyToOne(optional = false)
    private Weddingservices weddingservicesId;

    public Wedding() {
    }

    public Wedding(Integer weddingId) {
        this.weddingId = weddingId;
    }

    public Wedding(Integer weddingId, String name) {
        this.weddingId = weddingId;
        this.name = name;
    }

    public Integer getWeddingId() {
        return weddingId;
    }

    public void setWeddingId(Integer weddingId) {
        this.weddingId = weddingId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(Float coefficient) {
        this.coefficient = coefficient;
    }

    @XmlTransient
    public Set<Feedback> getFeedbackSet() {
        return feedbackSet;
    }

    public void setFeedbackSet(Set<Feedback> feedbackSet) {
        this.feedbackSet = feedbackSet;
    }

    @XmlTransient
    public Set<Orders> getOrdersSet() {
        return ordersSet;
    }

    public void setOrdersSet(Set<Orders> ordersSet) {
        this.ordersSet = ordersSet;
    }

    public Weddinghall getWeddinghallId() {
        return weddinghallId;
    }

    public void setWeddinghallId(Weddinghall weddinghallId) {
        this.weddinghallId = weddinghallId;
    }

    public Weddingservices getWeddingservicesId() {
        return weddingservicesId;
    }

    public void setWeddingservicesId(Weddingservices weddingservicesId) {
        this.weddingservicesId = weddingservicesId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (weddingId != null ? weddingId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Wedding)) {
            return false;
        }
        Wedding other = (Wedding) object;
        if ((this.weddingId == null && other.weddingId != null) || (this.weddingId != null && !this.weddingId.equals(other.weddingId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.Wedding[ weddingId=" + weddingId + " ]";
    }
    
}
