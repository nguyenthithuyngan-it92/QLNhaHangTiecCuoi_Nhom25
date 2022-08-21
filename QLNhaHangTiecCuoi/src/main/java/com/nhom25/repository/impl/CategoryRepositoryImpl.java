/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Category;
import com.nhom25.pojo.Food;
import com.nhom25.repository.CategoryRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Hibernate;
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
public class CategoryRepositoryImpl implements CategoryRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Category> getCategories() {
        List<Category> cates;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Category> cr = builder.createQuery(Category.class);
        Root<Category> root = cr.from(Category.class);

        CriteriaQuery query = cr.select(root);

        cates = session.createQuery(query).getResultList();        
        return cates;
    }

    @Override
    public Category getCategoryById(int cateId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Category.class, cateId);
    }

//    @Override
//    public List<Food> getFoodsByCategory(int id) {
//        List<Food> foods = null;
//        Session session = this.sessionFactory.getObject().getCurrentSession(); 
//        Category cate = session.get(Category.class, id);
//        if (cate != null) {
//            Hibernate.initialize(cate.getFoods());
//            foods = cate.getFoods();
//        }
//
//        return foods;
//    }
    
}
