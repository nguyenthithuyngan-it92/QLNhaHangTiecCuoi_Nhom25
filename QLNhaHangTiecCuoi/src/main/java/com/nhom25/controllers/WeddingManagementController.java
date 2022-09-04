/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Food;
import com.nhom25.pojo.Wedding;
import com.nhom25.pojo.Weddinghall;
import com.nhom25.pojo.Weddingservices;
import com.nhom25.services.CategoryService;
import com.nhom25.services.FoodService;
import com.nhom25.services.PaymentmethodsService;
import com.nhom25.services.WeddingHallService;
import com.nhom25.services.WeddingService;
import com.nhom25.services.WeddingServicesService;
import java.util.Map;
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
public class WeddingManagementController {
    @Autowired
    private WeddingService weddingService;

    @Autowired
    private WeddingHallService weddingHallService;

    @Autowired
    private WeddingServicesService weddingServicesService;
    
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private FoodService foodService;
    
    @Autowired
    private PaymentmethodsService paymentmethodsService;
    
    @ModelAttribute
    public void commontAttribute(Model model){
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("paymentmethod", this.paymentmethodsService.getListPaymentmethods());
        model.addAttribute("services", this.weddingServicesService.getWeddingServices(""));
        model.addAttribute("wdhall", this.weddingHallService.getWeddingHalls(""));
    }

    @GetMapping("/food-management")
    public String listFood(Model model, @RequestParam(required = false) Map<String, String> params) {
        model.addAttribute("foods", this.foodService.getListFoods(params));

        model.addAttribute("food", new Food());
        return "foodManagement";
    }
    
//THÊM MÓN ĂN
    @PostMapping("/food-management")
    public String addFood(Model model, @ModelAttribute(value = "food") @Valid Food food,
                                            BindingResult result) {
        //Thêm món ăn
        String errMsg = "";
        String successMsg = "";
        if (!result.hasErrors()) {
            if (this.foodService.addFood(food)) {
                successMsg = "Thao tác thành công!";
                model.addAttribute("successMsg", successMsg);

                return "redirect:/admin/food-management";
            } else {
                errMsg = "Đã có lỗi xảy ra khi thao tác!!!";
            }
        } else {
            errMsg = "Đã có lỗi xảy ra!! Vui lòng thử lại sau!!!";
        }
        model.addAttribute("errMsg", errMsg);

        return "foodManagement";
    }
    
    @GetMapping("/wedding-management")
    public String listWeddings(Model model, @RequestParam(required = false) Map<String, String> params) {
        String kw = params.getOrDefault("kw", null);
        model.addAttribute("weddings", this.weddingService.getWeddings(kw));
        
        model.addAttribute("wedding", new Wedding());

        return "weddingManagement";
    }
    
    //THÊM TIỆC CƯỚI
    @PostMapping("/wedding-management")
    public String addWedding(Model model, @Valid @ModelAttribute(value = "wedding") Wedding wedding,
                                            BindingResult result) {
        //Thêm tiệc cưới
        String errMsg = "";
        String successMsg = "";
        if (!result.hasErrors()) {
            if (this.weddingService.addOrUpdateWedding(wedding)) {
                successMsg = "Thao tác thành công!";
                model.addAttribute("successMsg", successMsg);

                return "redirect:/admin/wedding-management";
            } else {
                errMsg = "Đã có lỗi xảy ra khi thao tác!!!";
            }
        } else {
            errMsg = "Đã có lỗi xảy ra!! Vui lòng thử lại sau!!!";
        }

        model.addAttribute("errMsg", errMsg);

        return "weddingManagement";
    }

    @GetMapping("/weddingHall-management")
    public String listWeddingHall(Model model, @RequestParam(required = false) Map<String, String> params) {
        String name = params.getOrDefault("name", null);
        model.addAttribute("weddinghalls", this.weddingHallService.getWeddingHalls(name));
        
        model.addAttribute("weddinghall", new Weddinghall());

        return "weddingHallManagement";
    }
    
//THÊM SẢNH CƯỚI
    @PostMapping("/weddingHall-management")
    public String addWeddingHall(Model model, @ModelAttribute(value = "weddinghall") @Valid Weddinghall weddinghall,
                                            BindingResult result, @RequestParam(required = false) Map<String, String> params) {
        //Thêm sảnh cưới
        String errMsg = "";
        String successMsg = "";
        
        if (!result.hasErrors()) {
            if (this.weddingHallService.addOrUpdateWeddingHall(weddinghall)) {
                successMsg = "Thao tác thành công!";
                model.addAttribute("successMsg", successMsg);
                
//                model.addAttribute("weddinghalls", this.weddingHallService.getWeddingHalls(""));
                return "redirect:/admin/weddingHall-management";
            } else {
                errMsg = "Đã có lỗi xảy ra khi thao tác!!!";
            }
        } else {
            errMsg = "Đã có lỗi xảy ra!! Vui lòng thử lại sau!!!";
        }
        model.addAttribute("errMsg", errMsg);

        return "weddingHallManagement";
    }

    @GetMapping("/weddingService-management")
    public String listWeddingService(Model model, @RequestParam(required = false) Map<String, String> params) {
        //Tìm kiếm dịch vụ theo tên
        String name = params.getOrDefault("name", null);
        model.addAttribute("wdservices", this.weddingServicesService.getWeddingServices(name));
        
        model.addAttribute("weddingservices", new Weddingservices());

        return "weddingServicesManagement";
    }
 
//THÊM DỊCH VỤ 
    @PostMapping("/weddingService-management")
    public String addWeddingService(Model model, @ModelAttribute(value = "weddingservices") @Valid Weddingservices ws,
                                            BindingResult result) {
        //Thêm dịch vụ
        String errMsg = "";
        String successMsg = "";
        if (!result.hasErrors()) {
            if (this.weddingServicesService.addOrUpdateWeddingService(ws) == true) {
                successMsg = "Thao tác thành công!";
                model.addAttribute("successMsg", successMsg);
//                model.addAttribute("wdservices", this.weddingServicesService.getWeddingServices(name));

                return "redirect:/admin/weddingService-management";
            } else {
                errMsg = "Đã có lỗi xảy ra khi thao tác!!!";
            }
        } else {
            errMsg = "Đã có lỗi xảy ra!! Vui lòng thử lại sau!!!";
        }
        model.addAttribute("errMsg", errMsg);

        return "weddingServicesManagement";
    }
    
    //THỐNG KÊ BÁO CÁO
    @GetMapping("/stats")
    public String stats(Model model, 
            @RequestParam(value = "quarter", defaultValue = "1") int quarter,
            @RequestParam(value = "year", defaultValue = "2022") int year,
            @RequestParam(value = "month", defaultValue = "1") int month) {
        model.addAttribute("densityStats", this.weddingService.densityStats(year));
        model.addAttribute("monthStats", this.weddingService.monthStats(month, year));
        model.addAttribute("revenueStats", this.weddingService.revenueStats(quarter, year));
        model.addAttribute("yearStats", this.weddingService.yearStats(year));
        
        return "stats";
    }
}
