/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Food;
import com.nhom25.repository.FoodRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
public class FoodRepositoryImpl implements FoodRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Food> getListFoods(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Food> q = b.createQuery(Food.class);
        Root root = q.from(Food.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String cateId = params.get("cateId");
            if (cateId != null) {
                Predicate p = b.equal(root.get("categoryId"), Integer.parseInt(cateId));
                predicates.add(p);
            }
            q.where(predicates.toArray(new Predicate[] {}));

        }

        Query query = session.createQuery(q);

        return query.getResultList();
    }
    
    @Override
    public Food getFoodById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Food.class, id);
    }

    @Override
    public boolean addFood(Food f) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            if(f.getFoodId() == 0){
                session.save(f);
            } else {
                session.update(f);
            }
            return true;
        } catch (HibernateException e) {
            System.err.println("==Có lỗi xảy ra! Cập nhật thao tác thất bại==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteFood(int foodId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Food f = session.get(Food.class, foodId);
            session.delete(f);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    
    
}
