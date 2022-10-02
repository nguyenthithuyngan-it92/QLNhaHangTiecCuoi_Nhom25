/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Feedback;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Weddinghall;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface WeddingCusRepository {
    List<Weddinghall> getList(Map<String, String> params, int page);
    int countWedding();
    Weddinghall getWeddingHallById(int weddinghallId);
    List<Feedback> getFeedbacks(int weddinghallId);
    Feedback addFeedback(String content, int weddinghallId, User user);
    int feedbackCounter(int wdhallId);
}
