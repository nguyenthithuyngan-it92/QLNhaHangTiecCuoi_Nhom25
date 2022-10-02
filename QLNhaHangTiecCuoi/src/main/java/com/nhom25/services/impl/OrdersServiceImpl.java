/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Food;
import com.nhom25.pojo.ListFood;
import com.nhom25.pojo.Orders;
import com.nhom25.pojo.Shift;
import com.nhom25.repository.OrdersRepository;
import com.nhom25.services.FoodService;
import com.nhom25.services.OrdersService;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class OrdersServiceImpl implements OrdersService{
    @Autowired
    private OrdersRepository ordersRepository;

    @Autowired
    private FoodService foodService;
    
    @Autowired
    private OrdersService ordersService;
        
    @Override
    public List<Orders> getListOrders(Map<String, String> params) {
        return this.ordersRepository.getListOrders(params);
    }

    @Override
    public Orders getOrdersById(int orderId) {
        return this.ordersRepository.getOrdersById(orderId);
    }

    @Override
    public Orders addOrders(Orders od) {
        od.setStatus(Boolean.FALSE);
        od.setCreatedDate(new Date());
        
        return this.ordersRepository.addOrders(od);
    }

    @Override
    public Orders saveOrders(ListFood lf, int orderId) {
        Orders newOrder = this.ordersService.getOrdersById(orderId);
        Set<Food> setFoods = new HashSet<>();
        
        lf.getFoods().stream().map(food -> 
                this.foodService.getFoodById(Integer.parseInt(food.get("foodId"))))
                .map(f -> {
                    f.getOrders().add(newOrder);
                    return f;
                }).forEachOrdered(f -> {
                    setFoods.add(f);
                });
        newOrder.getFoods().addAll(setFoods);
        return this.ordersRepository.saveOrders(newOrder);
    }

    @Override
    public boolean confirmBooking(int orderId) {
        Orders ord = this.ordersService.getOrdersById(orderId);
        
        ord.setPaymentDate(new Date());
        ord.setStatus(Boolean.TRUE);
        
        return this.ordersRepository.confirmBooking(ord);
    }

    @Override
    public Shift getShiftById(int shiftId) {
        return this.ordersRepository.getShiftById(shiftId);
    }

    @Override
    public List<Shift> getShifts() {
        return this.ordersRepository.getShifts();
    }
    
}
