/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Food;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface FoodCusRepository {
    List<Food> getFoods(Map<String, String> params, int page);
    int countFoods();
    Food getFoodById(int foodId);
}
