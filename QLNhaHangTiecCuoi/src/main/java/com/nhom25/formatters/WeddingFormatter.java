/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Wedding;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class WeddingFormatter implements Formatter<Wedding>{

    @Override
    public String print(Wedding object, Locale locale) {
        return String.valueOf(object.getWeddingId());
    }

    @Override
    public Wedding parse(String id, Locale locale) throws ParseException {
        Wedding w = new Wedding();
        w.setWeddingId(Integer.parseInt(id));
        return w;
    }
    
}
