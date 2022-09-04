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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "paymentmethods")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Paymentmethods.findAll", query = "SELECT p FROM Paymentmethods p"),
    @NamedQuery(name = "Paymentmethods.findByPaymentmethodsId", query = "SELECT p FROM Paymentmethods p WHERE p.paymentmethodsId = :paymentmethodsId"),
    @NamedQuery(name = "Paymentmethods.findByPayments", query = "SELECT p FROM Paymentmethods p WHERE p.payments = :payments"),
    @NamedQuery(name = "Paymentmethods.findByDiscount", query = "SELECT p FROM Paymentmethods p WHERE p.discount = :discount")})
public class Paymentmethods implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "paymentmethods_id")
    private Integer paymentmethodsId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "payments")
    private String payments;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "discount")
    private Float discount;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "paymentmethodsId")
    private Set<Orders> ordersSet;

    public Paymentmethods() {
    }

    public Paymentmethods(Integer paymentmethodsId) {
        this.paymentmethodsId = paymentmethodsId;
    }

    public Paymentmethods(Integer paymentmethodsId, String payments) {
        this.paymentmethodsId = paymentmethodsId;
        this.payments = payments;
    }

    public Integer getPaymentmethodsId() {
        return paymentmethodsId;
    }

    public void setPaymentmethodsId(Integer paymentmethodsId) {
        this.paymentmethodsId = paymentmethodsId;
    }

    public String getPayments() {
        return payments;
    }

    public void setPayments(String payments) {
        this.payments = payments;
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    @XmlTransient
    public Set<Orders> getOrdersSet() {
        return ordersSet;
    }

    public void setOrdersSet(Set<Orders> ordersSet) {
        this.ordersSet = ordersSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentmethodsId != null ? paymentmethodsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Paymentmethods)) {
            return false;
        }
        Paymentmethods other = (Paymentmethods) object;
        if ((this.paymentmethodsId == null && other.paymentmethodsId != null) || (this.paymentmethodsId != null && !this.paymentmethodsId.equals(other.paymentmethodsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.Paymentmethods[ paymentmethodsId=" + paymentmethodsId + " ]";
    }
    
}