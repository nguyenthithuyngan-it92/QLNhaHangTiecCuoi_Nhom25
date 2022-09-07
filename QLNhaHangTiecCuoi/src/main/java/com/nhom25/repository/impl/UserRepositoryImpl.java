/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.User;
import com.nhom25.repository.UserRepository;
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
public class UserRepositoryImpl implements  UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(User.class, id);
    }

    @Override
    public Account addAccount(Account acnt) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(acnt);

            return acnt;
        } catch(HibernateException ex) {
            ex.printStackTrace();
        }
        
        return null;
    }
    
    @Override
    public User addUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(user);

            return user;
        } catch(HibernateException ex) {
            ex.printStackTrace();
        }
        
        return null;
    }

    @Override
    public List<Account> getAccounts(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> query = builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query.select(root);
        if(!username.isEmpty()){
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p); 
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<User> getUsers(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query.select(root);
        
        if(name != null){
            Predicate p = builder.like(root.get("name").as(String.class), String.format("%%%s%%", name));
            query = query.where(p); 
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public User getUserByName(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query.select(root);
        if(!name.isEmpty()){
            Predicate p = builder.equal(root.get("name").as(String.class), name.trim());
            query = query.where(p); 
        }
        
        
        Query q = session.createQuery(query);
        return (User) q.getSingleResult();
    }

    @Override
    public boolean addEmployee(User emp) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(emp);
//            session.flush();
            return true;
        } catch (HibernateException e) {
            session.clear();
            System.err.println("==Có lỗi xảy ra! Cập nhật thao tác thất bại==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addAccountEmp(Account accEmp) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(accEmp);
//            session.flush();
            return true;
        } catch (HibernateException e) {
            session.clear();
            System.err.println("==Add employee error==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Account getAccountById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(Account.class, id);
    }

}
