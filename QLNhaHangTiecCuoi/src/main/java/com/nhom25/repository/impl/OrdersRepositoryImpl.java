/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Orders;
import com.nhom25.repository.OrdersRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class OrdersRepositoryImpl implements OrdersRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Orders> getListOrders(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Orders> q = b.createQuery(Orders.class);
        Root root = q.from(Orders.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String createdDate = params.get("createdDate");
            if (createdDate != null && !createdDate.isEmpty()) {
                try {
                    Predicate p = b.equal(root.get("createdDate").as(Date.class), formatter.parse(createdDate));
                    predicates.add(p);
                } catch (ParseException ex) {
                    Logger.getLogger(OrdersRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            String partyDate = params.get("partyDate");
            if (partyDate != null && !partyDate.isEmpty()) {
                try {
                    Predicate p = b.equal(root.get("partyDate").as(Date.class), formatter.parse(partyDate));
                    predicates.add(p);
                } catch (ParseException ex) {
                    Logger.getLogger(OrdersRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            q.where(predicates.toArray(new Predicate[] {}));

        }

        Query query = session.createQuery(q);

        return query.getResultList();
    }

    @Override
    public Orders getOrdersById(int orderId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Orders.class, orderId);
    }

    @Override
    public Orders addOrders(Orders od) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(od);
//            session.flush();
            return od;
        } catch (HibernateException e) {
            session.clear();
            System.err.println("==Add orders error==" + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Orders saveOrders(Orders ord) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(ord);
//            session.flush();
            return ord;
        } catch (HibernateException e) {
            System.err.println("==Add orders error==" + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean confirmBooking(Orders order) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(order);
//            session.flush();
            return true;
        } catch (HibernateException e) {
            System.err.println("==Add orders error==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

}
