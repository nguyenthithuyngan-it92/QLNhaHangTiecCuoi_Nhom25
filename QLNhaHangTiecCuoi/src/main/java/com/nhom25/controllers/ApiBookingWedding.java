/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Food;
import com.nhom25.pojo.ListFood;
import com.nhom25.pojo.Orders;
import com.nhom25.pojo.Paymentmethods;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Weddinghall;
import com.nhom25.services.CategoryService;
import com.nhom25.services.OrdersService;
import com.nhom25.services.PaymentmethodsService;
import com.nhom25.services.UserService;
import com.nhom25.services.WeddingHallService;
//import com.nhom25.services.WeddingService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LENOVO
 */
@RestController
public class ApiBookingWedding {
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private OrdersService ordersService;
    
    @Autowired
    private WeddingHallService weddingHallService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private PaymentmethodsService paymentmethodsService;
    
    @PostMapping(path = "/api/get-food-by-cateId", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Food>> getFoodByCateId(@RequestBody Map<String, String> params) {
        try {
            String cateId = params.get("cateId");
            
           
            List<Food> listFoods = this.categoryService.getFoodsByCategory(Integer.parseInt(cateId));

            return new ResponseEntity<>(listFoods, HttpStatus.OK);

        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/order-wedding", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Orders> bookingWedding(@RequestBody Map<String, String> params) {
        try {
            String userId = params.get("userId");
            String paymentId = params.get("paymentId");
            String weddinghallId = params.get("weddinghallId");
            String totalPrice = params.get("totalPrice");
            String quantityTable = params.get("quantityTable");
            String partyDate = params.get("partyDate");
            
            Date partyDateTransform = new SimpleDateFormat("yyyy-MM-dd").parse(partyDate);
            
            Weddinghall wd = this.weddingHallService.getWeddingHallById(Integer.parseInt(weddinghallId));
            User user = this.userService.getUserById(Integer.parseInt(userId));
            Paymentmethods payMt = this.paymentmethodsService
                    .getPaymentmethodsById(Integer.parseInt(paymentId));
            
            Orders orderTemp = new Orders();
            orderTemp.setTotalPrice(Long.parseLong(totalPrice));
            orderTemp.setWeddinghallId(wd);
            orderTemp.setUserId(user);
            orderTemp.setPaymentmethodsId(payMt);
            orderTemp.setPartyDate(partyDateTransform);
            orderTemp.setQuantityTable(Integer.parseInt(quantityTable));
           
            Orders order = this.ordersService.addOrders(orderTemp);

            return new ResponseEntity<>(order, HttpStatus.CREATED);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/order-food/{orderId}", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<?> bookingFood(@PathVariable(value="orderId") int orderId ,@RequestBody ListFood foods) {
        return new ResponseEntity<>(this.ordersService.saveOrders(foods, orderId), HttpStatus.CREATED);
    }
    
    @GetMapping(path = "/api/confirm-booking/{orderId}", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<?> confirmBooking(@PathVariable(value="orderId") int orderId) {
        return new ResponseEntity<>(this.ordersService.confirmBooking(orderId), HttpStatus.OK);
    }
}
