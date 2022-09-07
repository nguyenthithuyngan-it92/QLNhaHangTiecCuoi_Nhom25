/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.services.CategoryService;
import com.nhom25.services.FoodCusService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/")
public class FoodCusController {
    @Autowired
    private FoodCusService foodCusService;
    @Autowired
    private CategoryService categoryService;
    
    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
    }
    
    @GetMapping("/foods")
    public String listFood(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("food", this.foodCusService.getFoods(params, page));
        model.addAttribute("foodCounter", this.foodCusService.countFoods());
        
        return "foods";
    }
    
    @GetMapping("/food/{foodId}")
    public String foodDetails(Model model, @PathVariable(value="foodId") int id){
        model.addAttribute("food", this.foodCusService.getFoodById(id));
        return "detailFood";
    }
}
