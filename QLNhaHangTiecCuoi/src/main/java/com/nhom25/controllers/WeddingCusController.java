/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.services.WeddingCusService;
import com.nhom25.services.WeddingServicesService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/")
public class WeddingCusController {
    @Autowired
    private WeddingCusService weddingCusService;
    
    @Autowired
    private WeddingServicesService weddingServicesService;
    
    @GetMapping("/weddings")
    public String listWeddingHall(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("weddinghall", this.weddingCusService.getList(params, page));
        model.addAttribute("weddingCounter", this.weddingCusService.countWedding());
        
        return "weddings";
    }
    
    @GetMapping("/combo-services")
    public String listWeddingServices(Model model, @RequestParam Map<String, String> params) {
//        model.addAttribute("weddinghall", this.weddingCusService.getList(params, page));
        model.addAttribute("countServiceTop", this.weddingServicesService.countService());
        return "servicesWedding";
    }
    
    @GetMapping("/wedding/{weddinghallId}")
    public String weddingHallDetails(Model model ,@PathVariable(value="weddinghallId") int id){
        model.addAttribute("weddinghall", this.weddingCusService.getWeddingHallById(id));
        model.addAttribute("countFeedback", this.weddingCusService.feedbackCounter(id));
        return "detailWedding";
    }
}
