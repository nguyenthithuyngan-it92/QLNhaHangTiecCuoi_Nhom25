/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Feedback;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Weddinghall;
import com.nhom25.repository.WeddingCusRepository;
import com.nhom25.services.WeddingCusService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class WeddingCusServiceImpl implements WeddingCusService {
    @Autowired
    private WeddingCusRepository weddingCusRepository;
    
    @Override
    public List<Weddinghall> getList(Map<String, String> params, int page) {
        return this.weddingCusRepository.getList(params, page);
    }

    @Override
    public int countWedding() {
        return this.weddingCusRepository.countWedding();
    }

    @Override
    public Weddinghall getWeddingHallById(int weddinghallId) {
        return this.weddingCusRepository.getWeddingHallById(weddinghallId);
    }

    @Override
    public List<Feedback> getFeedbacks(int weddinghallId) {
        return this.weddingCusRepository.getFeedbacks(weddinghallId);
    }

    @Override
    public Feedback addFeedback(String content, int weddinghallId, User user) {
        return this.weddingCusRepository.addFeedback(content, weddinghallId, user);
    }

    @Override
    public int feedbackCounter(int wdhallId) {
        return this.weddingCusRepository.feedbackCounter(wdhallId);
    }
}
