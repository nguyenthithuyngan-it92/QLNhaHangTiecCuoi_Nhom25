/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Category;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class CategoryFormatter implements Formatter<Category>{

    @Override
    public String print(Category object, Locale locale) {
        return String.valueOf(object.getCategoryId());
    }

    @Override
    public Category parse(String cateId, Locale locale) throws ParseException {
        Category c = new Category();
        c.setCategoryId(Integer.parseInt(cateId));
        return c;
    }
    
}
