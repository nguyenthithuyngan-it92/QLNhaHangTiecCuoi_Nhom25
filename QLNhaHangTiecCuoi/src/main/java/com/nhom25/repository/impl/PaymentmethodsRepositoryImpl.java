/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Category;
import com.nhom25.pojo.Paymentmethods;
import com.nhom25.repository.PaymentmethodsRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
public class PaymentmethodsRepositoryImpl implements PaymentmethodsRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Paymentmethods> getListPaymentmethods() {
        List<Paymentmethods> payment;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Paymentmethods> cr = builder.createQuery(Paymentmethods.class);
        Root<Paymentmethods> root = cr.from(Paymentmethods.class);

        CriteriaQuery query = cr.select(root);

        payment = session.createQuery(query).getResultList();        
        return payment;
    }

    @Override
    public Paymentmethods getPaymentmethodsById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Paymentmethods.class, id);
    }
    
}
