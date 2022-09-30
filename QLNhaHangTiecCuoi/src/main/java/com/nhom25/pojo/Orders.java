/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderId", query = "SELECT o FROM Orders o WHERE o.orderId = :orderId"),
    @NamedQuery(name = "Orders.findByCreatedDate", query = "SELECT o FROM Orders o WHERE o.createdDate = :createdDate"),
    @NamedQuery(name = "Orders.findByStatus", query = "SELECT o FROM Orders o WHERE o.status = :status"),
    @NamedQuery(name = "Orders.findByPartyDate", query = "SELECT o FROM Orders o WHERE o.partyDate = :partyDate"),
    @NamedQuery(name = "Orders.findByQuantityTable", query = "SELECT o FROM Orders o WHERE o.quantityTable = :quantityTable"),
    @NamedQuery(name = "Orders.findByTotalPrice", query = "SELECT o FROM Orders o WHERE o.totalPrice = :totalPrice"),
    @NamedQuery(name = "Orders.findByPaymentDate", query = "SELECT o FROM Orders o WHERE o.paymentDate = :paymentDate")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "order_id")
    private Integer orderId;
    @Column(name = "created_date")
    @Temporal(TemporalType.DATE)
    private Date createdDate;
    @Column(name = "status")
    private Boolean status;
    @Column(name = "party_date")
    @Temporal(TemporalType.DATE)
    private Date partyDate;
    @Column(name = "quantity_table")
    private Integer quantityTable;
    @Column(name = "total_price")
    private Long totalPrice;
    @Column(name = "payment_date")
    @Temporal(TemporalType.DATE)
    private Date paymentDate;
    
    @ManyToMany(mappedBy = "orders", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<Food> foods = new HashSet<>();
    
    @JoinColumn(name = "paymentmethods_id", referencedColumnName = "paymentmethods_id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Paymentmethods paymentmethodsId;
    
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private User userId;
    
    @JoinColumn(name = "shift_id", referencedColumnName = "shift_id")
    @ManyToOne(optional = false)
    private Shift shiftId;
    
    @JoinColumn(name = "weddinghall_id", referencedColumnName = "weddinghall_id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Weddinghall weddinghallId;
    
    @JoinColumn(name = "weddingservices_id", referencedColumnName = "weddingservices_id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Weddingservices weddingservicesId;

    public Orders() {
    }

    public Orders(Integer orderId) {
        this.orderId = orderId;
    }

    public Orders(Integer orderId, Date partyDate, int quantityTable) {
        this.orderId = orderId;
        this.partyDate = partyDate;
        this.quantityTable = quantityTable;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getPartyDate() {
        return partyDate;
    }

    public void setPartyDate(Date partyDate) {
        this.partyDate = partyDate;
    }

    public int getQuantityTable() {
        return quantityTable;
    }

    public void setQuantityTable(int quantityTable) {
        this.quantityTable = quantityTable;
    }

    public Long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    /**
     * @return the foods
     */
    public Set<Food> getFoods() {
        return foods;
    }

    /**
     * @param foods the foods to set
     */
    public void setFoods(Set<Food> foods) {
        this.foods = foods;
    }

    public Paymentmethods getPaymentmethodsId() {
        return paymentmethodsId;
    }

    public void setPaymentmethodsId(Paymentmethods paymentmethodsId) {
        this.paymentmethodsId = paymentmethodsId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Shift getShiftId() {
        return shiftId;
    }

    public void setShiftId(Shift shiftId) {
        this.shiftId = shiftId;
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
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.Orders[ orderId=" + orderId + " ]";
    }
    
}
