/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Weddinghall;
import com.nhom25.repository.WeddingHallRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
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
public class WeddingHallRepositoryImpl implements WeddingHallRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Weddinghall> getWeddingHalls(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Weddinghall> query = builder.createQuery(Weddinghall.class);
        Root root = query.from(Weddinghall.class);
        query.select(root);
        
        if(name != null){
            Predicate p = builder.like(root.get("name").as(String.class), String.format("%%%s%%", name));
            query = query.where(p); 
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Weddinghall getWeddingHallById(int hallID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Weddinghall.class, hallID);
    }

    @Override
    public boolean addOrUpdateWeddingHall(Weddinghall weddinghall) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            session.saveOrUpdate(weddinghall);
            return true;
        } catch (HibernateException e) {
            System.err.println("==Có lỗi xảy ra! Cập nhật thao tác thất bại==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
}
