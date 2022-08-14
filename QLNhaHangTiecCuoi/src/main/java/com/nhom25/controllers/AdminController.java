/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Food;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author LENOVO
 */
@Controller
@ControllerAdvice
@RequestMapping("/admin")
public class AdminController {
    @GetMapping("/")
    public String admin(Model model, HttpSession session){
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        return "admin";
    }
   
    @GetMapping("/foods")
    public String listFood(Model model){
        model.addAttribute("food", new Food());
        return "foods";
    }
}
