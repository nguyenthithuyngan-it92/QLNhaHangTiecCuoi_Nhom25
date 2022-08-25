/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Feedback;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Wedding;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface WeddingCusRepository {
    List<Wedding> getList(Map<String, String> params, int page);
    int countWedding();
    Wedding getWeddingById(int weddingId);
//    List<Feedback> getFeedbacks(int weddingId);
//    Feedback addFeedback(String content, int weddingId, User user);
//    int feedbackCounter();
}
