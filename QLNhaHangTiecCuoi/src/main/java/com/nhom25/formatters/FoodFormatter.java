/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Food;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class FoodFormatter implements Formatter<Food> {

    @Override
    public String print(Food t, Locale locale) {
        return String.valueOf(t.getFoodId());
    }

    @Override
    public Food parse(String foodId, Locale locale) throws ParseException {
        Food c = new Food();
        c.setFoodId(Integer.parseInt(foodId));
        return c;
    }

}
