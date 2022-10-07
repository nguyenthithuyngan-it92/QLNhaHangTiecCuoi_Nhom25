/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Orders;
import com.nhom25.pojo.Shift;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LENOVO
 */
public interface OrdersRepository {
    List<Orders> getListOrders(Map<String, String> params);
    Orders getOrdersById(int orderId);
    List<Orders> getListOrderByUserId(int userId);
    
    //Booking
    Orders addOrders(Orders od);
    Orders saveOrders(Orders ord);
    boolean confirmBooking(Orders orderId);
    
    Shift getShiftById(int shiftId);
    List<Shift> getShifts();
}
