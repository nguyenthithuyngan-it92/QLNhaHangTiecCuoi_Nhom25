/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Food;
import com.nhom25.repository.FoodCusRepository;
import com.nhom25.services.FoodCusService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class FoodCusServiceImpl implements FoodCusService {
    @Autowired
    private FoodCusRepository foodCusRepository;

    @Override
    public List<Food> getFoods(Map<String, String> params, int page) {
        return this.foodCusRepository.getFoods(params, page);
    }

    @Override
    public int countFoods() {
        return this.foodCusRepository.countFoods();
    }

    @Override
    public Food getFoodById(int foodId) {
        return this.foodCusRepository.getFoodById(foodId);
    }
}
