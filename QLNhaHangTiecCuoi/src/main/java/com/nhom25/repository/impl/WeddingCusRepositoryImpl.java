/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository.impl;

import com.nhom25.pojo.Feedback;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Weddinghall;
import com.nhom25.repository.WeddingCusRepository;
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
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ASUS
 */
@Repository
@PropertySource("classpath:databases.properties")
@Transactional
public class WeddingCusRepositoryImpl implements WeddingCusRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<Weddinghall> getList(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Weddinghall> query = builder.createQuery(Weddinghall.class);
        Root root = query.from(Weddinghall.class);
        query = query.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = builder.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fp = params.get("fromPrice");
            if (fp != null) {
                Predicate p = builder.greaterThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(fp));
                predicates.add(p);
            }

            String tp = params.get("toPrice");
            if (tp != null) {
                Predicate p = builder.lessThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(tp));
                predicates.add(p);
            }
            query.where(predicates.toArray(new Predicate[]{}));
        }
        Query q = session.createQuery(query);
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);
        }
        return q.getResultList();
    }

    @Override
    public int countWedding() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("SELECT COUNT(*) FROM Weddinghall");

        return Integer.parseInt(query.getSingleResult().toString());
    }

    @Override
    public Weddinghall getWeddingHallById(int weddinghallId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Weddinghall.class, weddinghallId);
    }

    @Override
    public int feedbackCounter(int wdhallId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Weddinghall h = this.getWeddingHallById(wdhallId);
        Query query = session.createQuery("SELECT COUNT(*) FROM Feedback WHERE weddinghallId=:wdhallId");
        query.setParameter("wdhallId", h);
        return Integer.parseInt(query.getSingleResult().toString());
    }

    @Override
    public List<Feedback> getFeedbacks(int weddinghallId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Feedback> query = builder.createQuery(Feedback.class);
        Root root = query.from(Feedback.class);
        query = query.select(root);

        query.where(builder.equal(root.get("weddinghallId"), weddinghallId));

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Feedback addFeedback(String content, int weddinghallId, User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Feedback f = new Feedback();
        try {
            f.setContent(content);
            f.setWeddinghallId(this.getWeddingHallById(weddinghallId));
            f.setUserId(user);
            session.save(f);
            
            return f;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return null;
    }
}
