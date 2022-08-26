/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Feedback;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Wedding;
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
    public List<Wedding> getList(Map<String, String> params, int page) {
        return this.weddingCusRepository.getList(params, page);
    }

    @Override
    public int countWedding() {
        return this.weddingCusRepository.countWedding();
    }

    @Override
    public Wedding getWeddingById(int weddingId) {
        return this.weddingCusRepository.getWeddingById(weddingId);
    }

//    @Override
//    public List<Feedback> getFeedbacks(int weddingId) {
//        return this.weddingCusRepository.getFeedbacks(weddingId);
//    }
//
//    @Override
//    public Feedback addFeedback(String content, int weddingId, User user) {
//        return this.weddingCusRepository.addFeedback(content, weddingId, user);
//    }
//
//    @Override
//    public int feedbackCounter() {
//        return this.weddingCusRepository.feedbackCounter();
//    }
    
}
