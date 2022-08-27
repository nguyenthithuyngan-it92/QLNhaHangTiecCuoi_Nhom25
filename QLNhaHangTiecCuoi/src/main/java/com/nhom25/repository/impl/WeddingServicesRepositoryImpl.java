/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Weddingservices;
import com.nhom25.repository.WeddingServicesRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LENOVO
 */
@Repository
@PropertySource("classpath:databases.properties")
@Transactional
public class WeddingServicesRepositoryImpl implements WeddingServicesRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Weddingservices> getWeddingServices(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Weddingservices> query = builder.createQuery(Weddingservices.class);
        Root root = query.from(Weddingservices.class);
        query.select(root);
        
        if(name != null){
            Predicate p = builder.like(root.get("name").as(String.class), String.format("%%%s%%", name));
            query = query.where(p); 
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Weddingservices getWeddingServiceById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Weddingservices.class, id);
    }

    @Override
    public boolean addOrUpdateWeddingService(Weddingservices ws) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            if(ws.getWeddingservicesId() == 0){
                session.save(ws);
            } else {
                session.update(ws);
            }
            return true;
        } catch (HibernateException e) {
            System.err.println("==Có lỗi xảy ra! Cập nhật thao tác thất bại==" + e.getMessage());
            e.printStackTrace();
            return false;
        }
        
    }

    @Override
    public boolean deleteWdService(int weddingservicesId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Weddingservices ws = session.get(Weddingservices.class, weddingservicesId);
            session.delete(ws);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
    
}
