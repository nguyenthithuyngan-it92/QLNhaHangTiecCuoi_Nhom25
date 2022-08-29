/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Category;
import com.nhom25.pojo.Food;
import com.nhom25.repository.CategoryRepository;
import com.nhom25.services.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<Category> getCategories() {
        return this.categoryRepository.getCategories();
    }

    @Override
    public Category getCategoryById(int cateId) {
        return this.categoryRepository.getCategoryById(cateId);
    }

    @Override
    public List<Food> getFoodsByCategory(int cateId) {
        return this.categoryRepository.getFoodsByCategory(cateId);
    }
    
}
