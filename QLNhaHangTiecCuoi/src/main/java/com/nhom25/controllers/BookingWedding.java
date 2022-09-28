/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Orders;
import com.nhom25.services.WeddingCusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author LENOVO
 */
@Controller
@ControllerAdvice
@RequestMapping("/")
public class BookingWedding {
    @Autowired
    private WeddingCusService weddingCusService;
    
    @GetMapping(value = "/wedding/{weddinghallId}/booking-wedding")
    public String bookingWedding(Model model, @PathVariable(value="weddinghallId") int id) {
        model.addAttribute("weddinghall", this.weddingCusService.getWeddingHallById(id));
        
        model.addAttribute("bookingCustomer", new Orders());

        return "bookingWedding";
    }
}
