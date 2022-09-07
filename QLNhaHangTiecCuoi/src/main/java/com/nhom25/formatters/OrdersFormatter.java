/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Orders;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class OrdersFormatter implements Formatter<Orders>{

    @Override
    public String print(Orders t, Locale locale) {
        return String.valueOf(t.getOrderId());
    }

    @Override
    public Orders parse(String ordersId, Locale locale) throws ParseException {
        Orders c = new Orders();
        c.setOrderId(Integer.parseInt(ordersId));
        return c;
    }
    
}
