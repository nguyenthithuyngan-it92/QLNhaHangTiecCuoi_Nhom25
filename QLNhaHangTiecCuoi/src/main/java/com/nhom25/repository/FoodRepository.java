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
 * @author LENOVO
 */
public interface FoodRepository {
    List<Food> getListFoods(Map<String, String> params);
    Food getFoodById(int foodId);
    boolean addFood(Food f);
    boolean deleteFood(int id);
}
