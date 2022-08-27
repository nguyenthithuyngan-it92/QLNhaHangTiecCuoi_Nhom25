/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Orders;
import com.nhom25.repository.OrdersRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
            
            String createdDate = params.get("createdDate");
            if (createdDate != null && !createdDate.isEmpty()) {
                Predicate p = b.like(root.get("createdDate").as(String.class), String.format("yyyy-MM-dd", createdDate));
                predicates.add(p);
            }

            String partyDate = params.get("partyDate");
            if (partyDate != null && !partyDate.isEmpty()) {
                Predicate p = b.like(root.get("partyDate").as(String.class), String.format("yyyy-MM-dd", partyDate));
                predicates.add(p);
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
    
}
