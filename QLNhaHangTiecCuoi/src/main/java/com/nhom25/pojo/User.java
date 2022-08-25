/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findByUserId", query = "SELECT u FROM User u WHERE u.userId = :userId"),
    @NamedQuery(name = "User.findByName", query = "SELECT u FROM User u WHERE u.name = :name"),
    @NamedQuery(name = "User.findByIdentityCard", query = "SELECT u FROM User u WHERE u.identityCard = :identityCard"),
    @NamedQuery(name = "User.findByDateOfBirth", query = "SELECT u FROM User u WHERE u.dateOfBirth = :dateOfBirth"),
    @NamedQuery(name = "User.findByPhone", query = "SELECT u FROM User u WHERE u.phone = :phone"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
    @NamedQuery(name = "User.findBySex", query = "SELECT u FROM User u WHERE u.sex = :sex"),
    @NamedQuery(name = "User.findByPosition", query = "SELECT u FROM User u WHERE u.position = :position"),
    @NamedQuery(name = "User.findByUserRole", query = "SELECT u FROM User u WHERE u.userRole = :userRole")})
public class User implements Serializable {
    public static final String EMPLOYEE = "EMPLOYEE";
    public static final String ADMIN = "ADMIN";
    public static final String CUSTOMER = "CUSTOMER";
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_id")
    @JsonIgnore
    private Integer userId;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100, message = "{user.name.error.sizeMsg}")
    @Column(name = "name")
    private String name;
    
    @Pattern(regexp = "\\d{12}", message = "{user.identityCard.error.invalidMsg}")
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "identity_card")
    @JsonIgnore
    private String identityCard;
    
    @Column(name = "date_of_birth")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonIgnore
    private Date dateOfBirth;
    
    @Pattern(regexp = "\\d{10}", message = "{user.phone.error.invalidMsg}")
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 11)
    @Column(name = "phone")
    @JsonIgnore
    private String phone;
    
    @Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "{user.email.error.invalidMsg}")
    @Size(max = 100)
    @Column(name = "email")
    @JsonIgnore
    private String email;
    
    @Size(max = 3)
    @Column(name = "sex")
    @JsonIgnore
    private String sex;
    
    @Size(max = 50)
    @Column(name = "position")
    @JsonIgnore
    private String position;
    
    @Size(max = 8)
    @Column(name = "user_role")
    @JsonIgnore
    private String userRole;
    
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Set<Feedback> feedbackSet;
    
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Set<Orders> ordersSet;
    
    @JsonIgnore
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    private Account account;

    public User() {
    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(Integer userId, String name, String identityCard, String phone) {
        this.userId = userId;
        this.name = name;
        this.identityCard = identityCard;
        this.phone = phone;
    }
    
    public User(String name, String identityCard, String phone, String userRole, String sex, String email) {
        this.name = name;
        this.identityCard = identityCard;
        this.phone = phone;
        this.userRole = userRole;
        this.sex = sex;
        this.email = email;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
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

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom25.pojo.User[ userId=" + userId + " ]";
    }
    
}
