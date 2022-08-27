/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Orders;
import com.nhom25.repository.OrdersRepository;
import com.nhom25.services.OrdersService;
import java.util.List;
import java.util.Map;
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

    @Override
    public List<Orders> getListOrders(Map<String, String> params) {
        return this.ordersRepository.getListOrders(params);
    }

    @Override
    public Orders getOrdersById(int orderId) {
        return this.ordersRepository.getOrdersById(orderId);
    }
    
}
