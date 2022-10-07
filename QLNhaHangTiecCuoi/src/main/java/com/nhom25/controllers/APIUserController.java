/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.Orders;
import com.nhom25.pojo.User;
import com.nhom25.services.OrdersService;
import com.nhom25.services.UserService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LENOVO
 */
@RestController
public class APIUserController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private OrdersService ordersService;

    @PostMapping(path = "/api/add-user", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<User> addUser(@RequestBody Map<String, String> params) {
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            String name = params.get("name");
            String identityCard = params.get("identityCard");
            String dateOfBirth = params.get("dateOfBirth");
            String email = params.get("email");
            String phone = params.get("phone");
            String sex = params.get("sex");
            
            User newUser = new User();
            
            if(!dateOfBirth.isEmpty()) {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirth);
                newUser.setDateOfBirth(date);
            }
            newUser.setEmail(email);
            newUser.setName(name);
            newUser.setPhone(phone);
            newUser.setIdentityCard(identityCard);
            newUser.setSex(sex);
            
            User u = this.userService.addUser(newUser);

            return new ResponseEntity<>(u, HttpStatus.CREATED);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/api/add-account", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Account> addAccount(@RequestBody Map<String, String> params) {
        try {
            String username = params.get("username");
            String password = params.get("password");
            String confirmPassword = params.get("confirmPassword");
            String userId = params.get("userId");
            String avtUrl = params.get("avt");

            Account acnt = new Account();
            acnt.setUsername(username);
            acnt.setPassword(password);
            acnt.setAvatar(avtUrl);
            acnt.setUserId(Integer.parseInt(userId));

            Account newAct = this.userService.addAccount(acnt);
            if (password.equals(confirmPassword)) {
                return new ResponseEntity<>(newAct, HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/get-notifications", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Orders>> getListOrderByUserId(@RequestBody Map<String, String> params) {
        try {
            String userId = params.get("userId");

            List<Orders> listFoods = this.ordersService.getListOrderByUserId(Integer.parseInt(userId));

            return new ResponseEntity<>(listFoods, HttpStatus.OK);

        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
