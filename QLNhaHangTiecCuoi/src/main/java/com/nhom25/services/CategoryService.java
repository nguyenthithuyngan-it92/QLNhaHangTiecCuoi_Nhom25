/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services;

import com.nhom25.pojo.Category;
import com.nhom25.pojo.Food;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface CategoryService {
    List<Category> getCategories();
    Category getCategoryById(int cateId);
    List<Food> getFoodsByCategory(int cateId);
}
