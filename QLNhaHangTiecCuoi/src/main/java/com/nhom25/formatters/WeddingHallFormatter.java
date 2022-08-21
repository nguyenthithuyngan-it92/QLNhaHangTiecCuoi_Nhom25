/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Weddinghall;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class WeddingHallFormatter implements Formatter<Weddinghall>{

    @Override
    public String print(Weddinghall object, Locale locale) {
        return String.valueOf(object.getWeddinghallId());
    }

    @Override
    public Weddinghall parse(String hallId, Locale locale) throws ParseException {
        Weddinghall h = new Weddinghall();
        h.setWeddinghallId(Integer.parseInt(hallId));
        return h;
    }
    
}
