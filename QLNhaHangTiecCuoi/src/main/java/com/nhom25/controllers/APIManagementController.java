/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.services.FoodService;
import com.nhom25.services.WeddingHallService;
import com.nhom25.services.WeddingService;
import com.nhom25.services.WeddingServicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LENOVO
 */
@RestController
public class APIManagementController {
    @Autowired
    private FoodService foodService;
    
    @Autowired
    private WeddingService weddingService;
    
    @Autowired
    private WeddingHallService weddingHallService;
    
    @Autowired
    private WeddingServicesService weddingServicesService;

    @DeleteMapping("/api/admin/food-management/{foodId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteFood(@PathVariable(name = "foodId") int foodId) {
        this.foodService.deleteFood(foodId);
    }
    
    @DeleteMapping("/api/admin/wedding-management/{weddingId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteWedding(@PathVariable(name = "weddingId") int weddingId) {
        this.weddingService.deleteWedding(weddingId);
    }
    
    @DeleteMapping("/api/admin/weddingHall-management/{weddinghallId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteWdHall(@PathVariable(name = "weddinghallId") int weddinghallId) {
        this.weddingHallService.deleteWdHall(weddinghallId);
    }
    
    @DeleteMapping("/api/admin/weddingService-management/{weddingservicesId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteWdService(@PathVariable(name = "weddingservicesId") int weddingservicesId) {
        this.weddingServicesService.deleteWdService(weddingservicesId);
    }
}
