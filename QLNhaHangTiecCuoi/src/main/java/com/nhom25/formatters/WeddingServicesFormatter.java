/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Weddingservices;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class WeddingServicesFormatter implements Formatter<Weddingservices>{

    @Override
    public String print(Weddingservices object, Locale locale) {
        return String.valueOf(object.getWeddingservicesId());
    }

    @Override
    public Weddingservices parse(String id, Locale locale) throws ParseException {
        Weddingservices s = new Weddingservices();
        s.setWeddingservicesId(Integer.parseInt(id));
        return s;
    }
    
}
