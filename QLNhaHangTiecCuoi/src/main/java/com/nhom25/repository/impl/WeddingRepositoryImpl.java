/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Orders;
import com.nhom25.pojo.Wedding;
import com.nhom25.repository.WeddingRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LENOVO
 */
@Repository
@Transactional
public class WeddingRepositoryImpl implements WeddingRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Wedding> getWeddings(String kw) {
        List<Wedding> foods;
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Wedding> cr = builder.createQuery(Wedding.class);
        Root<Wedding> root = cr.from(Wedding.class);

        CriteriaQuery<Wedding> query = cr.select(root);
        if (kw != null) {
            String pattern = String.format("%%%s%%", kw);
            Predicate p1 = builder.like(root.get("name").as(String.class), pattern);
            Predicate p2 = builder.like(root.get("description").as(String.class), pattern);

            query = query.where(builder.or(p1, p2));
        }

        foods = session.createQuery(query).getResultList();

        return foods;
    }

    @Override
    public Wedding getWeddingById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Wedding.class, id);
    }

    @Override
    public boolean addOrUpdateWedding(Wedding wedding) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            if(wedding.getWeddingId() == 0){
                session.save(wedding);
            } else {
                session.update(wedding);
            }
            return true;
        } catch (HibernateException e) {
            System.err.println("==Có lỗi xảy ra! Cập nhật thao tác thất bại==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteWedding(int weddingId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Wedding w = session.get(Wedding.class, weddingId);
            session.delete(w);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Object[]> densityStats(int year) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> cr = builder.createQuery(Object[].class);
        
        Root rW = cr.from(Wedding.class);
        Root rO = cr.from(Orders.class);
        
        cr.where(builder.equal(rO.get("weddingId"), rW.get("weddingId")),
                builder.equal(builder.function("YEAR", Integer.class, rO.get("partyDate")), year));
        
        cr.multiselect(rW.get("weddingId"), rW.get("name"), builder.count(rO.get("weddingId")));
        cr.groupBy(rW.get("weddingId"));
        
        Query query = session.createQuery(cr);
        return query.getResultList();
    }
    
    @Override
    public List<Object[]> revenueStats(int quarter, int year) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> cr = builder.createQuery(Object[].class);
        
        Root rW = cr.from(Wedding.class);
        Root rO = cr.from(Orders.class);
        
        
        cr.where(builder.equal(rO.get("weddingId"), rW.get("weddingId")),
                builder.equal(rO.get("status"), 0),
                builder.equal(builder.function("QUARTER", Integer.class, rO.get("partyDate")), quarter),
                builder.equal(builder.function("YEAR", Integer.class, rO.get("partyDate")), year));
        
        cr.multiselect(rW.get("weddingId"), rW.get("name"), builder.sum(rO.get("totalPrice")));
        cr.groupBy(rW.get("weddingId"));
        
        Query query = session.createQuery(cr);
        return query.getResultList();
    }

    @Override
    public List<Object[]> monthStats(int m, int y) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> cr = builder.createQuery(Object[].class);
        
        Root rW = cr.from(Wedding.class);
        Root rO = cr.from(Orders.class);
        
        cr.where(builder.equal(rO.get("weddingId"), rW.get("weddingId")),
                builder.equal(rO.get("status"), 0),
                builder.equal(builder.function("MONTH", Integer.class, rO.get("partyDate")), m),
                builder.equal(builder.function("YEAR", Integer.class, rO.get("partyDate")), y));
        
        cr.multiselect(rW.get("weddingId"), rW.get("name"), builder.sum(rO.get("totalPrice")));
        cr.groupBy(rW.get("weddingId"));
        
        Query query = session.createQuery(cr);
        return query.getResultList();
    }

    @Override
    public List<Object[]> yearStats(int y) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> cr = builder.createQuery(Object[].class);
        
        Root rW = cr.from(Wedding.class);
        Root rO = cr.from(Orders.class);
        
        cr.where(builder.equal(rO.get("weddingId"), rW.get("weddingId")),
                builder.equal(rO.get("status"), 0),
                builder.equal(builder.function("YEAR", Integer.class, rO.get("partyDate")), y));
        
        cr.multiselect(rW.get("weddingId"), rW.get("name"), builder.sum(rO.get("totalPrice")));
        cr.groupBy(rW.get("weddingId"));
        
        Query query = session.createQuery(cr);
        return query.getResultList();
    }
}
