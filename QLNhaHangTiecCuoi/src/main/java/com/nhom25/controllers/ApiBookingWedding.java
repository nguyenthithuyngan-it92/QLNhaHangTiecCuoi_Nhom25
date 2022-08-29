/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Food;
import com.nhom25.pojo.User;
import com.nhom25.services.CategoryService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LENOVO
 */
@RestController
public class ApiBookingWedding {
    
    @Autowired
    private CategoryService categoryService;
    
    @PostMapping(path = "/api/get-food-by-cateId", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Food>> getFoodByCateId(@RequestBody Map<String, String> params) {
        try {
            String cateId = params.get("cateId");
            
           
            List<Food> listFoods = this.categoryService.getFoodsByCategory(Integer.parseInt(cateId));

            return new ResponseEntity<>(listFoods, HttpStatus.OK);

        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
