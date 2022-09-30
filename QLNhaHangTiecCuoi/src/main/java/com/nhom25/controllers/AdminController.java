/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.User;
import com.nhom25.services.OrdersService;
import com.nhom25.services.UserService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
    
    @Autowired
    private OrdersService ordersService;
   
    
    @GetMapping("/")
    public String admin(Model model, @RequestParam(required = false) Map<String, String> params, HttpSession session){
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        
        //Danh sách tài khoản 
        String username = params.getOrDefault("username", null);
        model.addAttribute("accounts", this.userService.getAccounts(username));
        
        return "admin";
    }
    
    @GetMapping("/customer-in-system")
    public String listCustomerInSystem(Model model, ModelMap map, @RequestParam(required = false) Map<String, String> params){
        //Danh sách khách hàng trong hệ thống
        String name = params.getOrDefault("name", null);
        model.addAttribute("usersInSystem", this.userService.getUsers(name));
        
        return "customerInSystem";
    }
    
    @GetMapping("/customer-outside-system")
    public String listCustomerOutsideSystem(Model model, ModelMap map, @RequestParam(required = false) Map<String, String> params){
        //Danh sách khách hàng trong hệ thống
        String name = params.getOrDefault("name", null);
        model.addAttribute("usersOutsideSystem", this.userService.getUsers(name));
        
        return "customerOutsideSystem";
    }
    
    @GetMapping("/employee-management")
    public String listEmployee(Model model, ModelMap map, @RequestParam(required = false) Map<String, String> params){
        //Danh sách nhân viên
        String name = params.getOrDefault("name", null);
        model.addAttribute("users", this.userService.getUsers(name));
        
        User user = new User();
        Account act = new Account();
        
        map.addAttribute("emp", user);
        map.addAttribute("accountEmp", act);
        
        return "employeeManagement";
    }
    
//THÊM NHÂN VIÊN
    @PostMapping("/employee-management")
    public String addEmployee(Model model, @ModelAttribute(value = "emp") @Valid User emp, BindingResult resultUser,
                                            @ModelAttribute(value = "accountEmp") @Valid Account accEmp,
                                            BindingResult resultAccount) {
        //Thêm nhân viên
        String errMsg = "";
        String successMsg = "";
        if (!resultUser.hasErrors()) {
            if (this.userService.addEmployee(emp) == true) {
                successMsg = "Thao tác thành công!";
                model.addAttribute("successMsg", successMsg);

                return "redirect:/admin/employee-management";
            } else {
                errMsg = "Đã có lỗi xảy ra khi thực hiện thao tác!!!";
            }
        } else {
            errMsg = "Đã có lỗi xảy ra!! Vui lòng thử lại sau!!!";
        }
        model.addAttribute("errMsg", errMsg);
        
        //Tạo tài khoản nhân viên
        if (!resultAccount.hasErrors()) {
            if (this.userService.addAccountEmp(accEmp) == true) {
                successMsg = "Tạo tài khoản thành công!";
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
    
    @GetMapping("/pay")
    public String listOrders(Model model, @RequestParam(required = false) Map<String, String> params){
        model.addAttribute("orders", this.ordersService.getListOrders(params));

        return "pay";
    }
}
