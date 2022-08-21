/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.User;
import com.nhom25.services.CategoryService;
import com.nhom25.services.UserService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 * @author LENOVO
 */
@Controller
@ControllerAdvice
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private UserService userService;
   
    
    @GetMapping("/")
    public String admin(Model model, @RequestParam(required = false) Map<String, String> params, HttpSession session){
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        
        String name = params.getOrDefault("name", null);
        model.addAttribute("user", this.userService.getUsers(name));
        
        return "admin";
    }
    
    @GetMapping("/employee-management")
    public String listEmployee(Model model, @RequestParam(required = false) Map<String, String> params){
        String name = params.getOrDefault("name", null);
        model.addAttribute("users", this.userService.getUsers(name));
        
        model.addAttribute("emp", new User());
        
        return "employeeManagement";
    }
    
//THÊM NHÂN VIÊN
    @PostMapping("/employee-management")
    public String addEmployee(Model model, @ModelAttribute(value = "emp") @Valid User emp,
                                            BindingResult result) {
        //Thêm tiệc cưới
        String errMsg = "";
        String successMsg = "";
        if (!result.hasErrors()) {
            if (this.userService.addEmployee(emp) == true) {
                successMsg = "Thêm thành công!";
                model.addAttribute("successMsg", successMsg);

                return "redirect:/admin/employee-management";
            } else {
                errMsg = "Đã có lỗi xảy ra khi thêm!!!";
            }
        } else {
            errMsg = "Đã có lỗi xảy ra!! Vui lòng thử lại sau!!!";
        }
        model.addAttribute("errMsg", errMsg);

        return "employeeManagement";
    }
}
