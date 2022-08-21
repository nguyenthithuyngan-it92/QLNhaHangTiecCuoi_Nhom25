/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nhom25.pojo.Food;
import com.nhom25.repository.FoodRepository;
import com.nhom25.services.FoodService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class FoodServiceImpl implements FoodService{
    @Autowired
    private FoodRepository foodRepository;
    
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Food> getListFoods(Map<String, String> params) {
        return this.foodRepository.getListFoods(params);
    }
    
    @Override
    public Food getFoodById(int id) {
        return this.foodRepository.getFoodById(id);
    }

    @Override
    public boolean addFood(Food food) {
        try {
            if(!food.getImg().isEmpty() && food.getImg() != null){
                Map r = this.cloudinary.uploader().upload(food.getImg().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                food.setImage((String) r.get("secure_url"));
            }
            else
                food.setImage(this.foodRepository.getFoodById(food.getFoodId()).getImage());
            return this.foodRepository.addFood(food);
        } catch (IOException ex) {
            System.err.println("===ADD===" + ex.getMessage());
            ex.printStackTrace();
        }  

        return false;
    }

    @Override
    public boolean deleteFood(int id) {
        return this.foodRepository.deleteFood(id);
    }

    
    
}
