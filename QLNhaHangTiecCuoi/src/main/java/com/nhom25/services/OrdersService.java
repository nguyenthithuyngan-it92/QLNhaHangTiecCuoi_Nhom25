/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services;

import com.nhom25.pojo.Orders;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LENOVO
 */
public interface OrdersService {
    List<Orders> getListOrders(Map<String, String> params);
    Orders getOrdersById(int orderId);
}
