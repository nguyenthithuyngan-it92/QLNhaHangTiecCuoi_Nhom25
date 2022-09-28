/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.Feedback;
import com.nhom25.pojo.User;
import com.nhom25.services.WeddingCusService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
@RequestMapping("/api")
public class ApiFeedbackController {

    @Autowired
    private WeddingCusService weddingCusService;

    @GetMapping("/wedding/{weddinghallId}/feedbacks")
    public ResponseEntity<List<Feedback>> getFeedbacks(@PathVariable(value = "weddinghallId") int id) {
        return new ResponseEntity<>(this.weddingCusService.getFeedbacks(id), HttpStatus.OK);
    }

    @PostMapping(path = "/wedding/{weddinghallId}/feedbacks", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Feedback> addFeedback(@RequestBody Map<String, String> params, HttpSession session) {
        Account accountId = (Account) session.getAttribute("currentUser");
        User user = accountId.getUser();
        if (accountId != null && user != null) {
            try {
                String content = params.get("content");
                int wedddingId = Integer.parseInt(params.get("weddinghallId"));
                Feedback f = this.weddingCusService.addFeedback(content, wedddingId, user);
                
                return new ResponseEntity<>(f, HttpStatus.CREATED);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
