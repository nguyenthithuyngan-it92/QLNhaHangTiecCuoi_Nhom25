/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
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
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "food")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Food.findAll", query = "SELECT f FROM Food f"),
    @NamedQuery(name = "Food.findByFoodId", query = "SELECT f FROM Food f WHERE f.foodId = :foodId"),
    @NamedQuery(name = "Food.findByName", query = "SELECT f FROM Food f WHERE f.name = :name"),
    @NamedQuery(name = "Food.findByPrice", query = "SELECT f FROM Food f WHERE f.price = :price"),
    @NamedQuery(name = "Food.findByImage", query = "SELECT f FROM Food f WHERE f.image = :image")})
public class Food implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "food_id")
    private Integer foodId;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255, message="{food.name.notNullMsg}")
    @Column(name = "name")
    private String name;
    
    @NotNull(message="{food.price.notNullMsg}")
    @Min(value = 100000, message = "{food.price.minError}")
    @Column(name = "price")
    private Long price;
    
    @Size(max = 255)
    @Column(name = "image")
    private String image;

    @Transient
    private MultipartFile img;

    @Lob
    @Size(max = 16777215)
    @Column(name = "description")
    private String description;
    
    @JoinTable(name = "orderdetails", 
        joinColumns = @JoinColumn(name = "food_id"), 
        inverseJoinColumns = @JoinColumn(name = "order_id"))
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<Orders> orders = new HashSet<>();
    
    @JsonIgnore
    @JoinColumn(name = "category_id")
    @ManyToOne(fetch = FetchType.EAGER)
    @NotNull(message="{food.cate.notNullMsg}")
    private Category categoryId;

    public Food() {
    }

    public Food(Integer foodId) {
        this.foodId = foodId;
    }

    public Food(Integer foodId, String name) {
        this.foodId = foodId;
        this.name = name;
    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (foodId != null ? foodId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Food)) {
            return false;
        }
        Food other = (Food) object;
        if ((this.foodId == null && other.foodId != null) || (this.foodId != null && !this.foodId.equals(other.foodId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.Food[ foodId=" + foodId + " ]";
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

    /**
     * @return the orders
     */
    public Set<Orders> getOrders() {
        return orders;
    }

    /**
     * @param orders the orders to set
     */
    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }
   
}
