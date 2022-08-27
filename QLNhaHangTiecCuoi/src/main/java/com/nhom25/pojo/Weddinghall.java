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
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "weddinghall")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Weddinghall.findAll", query = "SELECT w FROM Weddinghall w"),
    @NamedQuery(name = "Weddinghall.findByWeddinghallId", query = "SELECT w FROM Weddinghall w WHERE w.weddinghallId = :weddinghallId"),
    @NamedQuery(name = "Weddinghall.findByName", query = "SELECT w FROM Weddinghall w WHERE w.name = :name"),
    @NamedQuery(name = "Weddinghall.findByActive", query = "SELECT w FROM Weddinghall w WHERE w.active = :active"),
    @NamedQuery(name = "Weddinghall.findByMaxTable", query = "SELECT w FROM Weddinghall w WHERE w.maxTable = :maxTable"),
    @NamedQuery(name = "Weddinghall.findByPrice", query = "SELECT w FROM Weddinghall w WHERE w.price = :price"),
    @NamedQuery(name = "Weddinghall.findByImage", query = "SELECT w FROM Weddinghall w WHERE w.image = :image")})
public class Weddinghall implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "weddinghall_id")
    private Integer weddinghallId;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100, message = "{hall.name.sizeMsg}")
    @Column(name = "name")
    private String name;
    
    @Column(name = "active")
    private Boolean active;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "max_table")
    @Min(value = 5, message = "{hall.maxTable.minError}")
    @Max(value = 100, message = "{hall.maxTable.maxError}")
    private int maxTable;
    
    @Column(name = "price")
    @Min(value = 1000000, message = "{hall.prices.minError}")
    @Max(value = 100000000, message = "{hall.prices.maxError}")
    private Long price;
    
    @Lob
    @Size(max = 16777215)
    @Column(name = "description")
    private String description;
    
    @Size(max = 200)
    @Column(name = "image")
    private String image;
    
    @JsonIgnore
    @Transient
    private MultipartFile img;
    
    @JsonIgnore
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "weddinghallId")
    private Set<Wedding> weddingSet;

    public Weddinghall() {
    }

    public Weddinghall(Integer weddinghallId) {
        this.weddinghallId = weddinghallId;
    }

    public Weddinghall(Integer weddinghallId, String name, int maxTable) {
        this.weddinghallId = weddinghallId;
        this.name = name;
        this.maxTable = maxTable;
    }

    public Integer getWeddinghallId() {
        return weddinghallId;
    }

    public void setWeddinghallId(Integer weddinghallId) {
        this.weddinghallId = weddinghallId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public int getMaxTable() {
        return maxTable;
    }

    public void setMaxTable(int maxTable) {
        this.maxTable = maxTable;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
        hash += (weddinghallId != null ? weddinghallId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Weddinghall)) {
            return false;
        }
        Weddinghall other = (Weddinghall) object;
        if ((this.weddinghallId == null && other.weddinghallId != null) || (this.weddinghallId != null && !this.weddinghallId.equals(other.weddinghallId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.Weddinghall[ weddinghallId=" + weddinghallId + " ]";
    }

    /**
     * @return the img
     */
    public MultipartFile getImg() {
        return img;
    }

    /**
     * @param img the img to set
     */
    public void setImg(MultipartFile img) {
        this.img = img;
    }
    
}
