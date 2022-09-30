/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author LENOVO
 */
@Controller
@ControllerAdvice
public class UserController {
    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("account", new Account());
        
        return "login";
    }

    @GetMapping(value = "/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("account", new Account());

        return "register";
    }

}
