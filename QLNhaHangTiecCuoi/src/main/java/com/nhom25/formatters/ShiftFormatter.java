/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Shift;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class ShiftFormatter implements Formatter<Shift>{

    @Override
    public String print(Shift object, Locale locale) {
        return String.valueOf(object.getShiftId());
    }

    @Override
    public Shift parse(String shiftId, Locale locale) throws ParseException {
        Shift s = new Shift();
        s.setShiftId(Integer.parseInt(shiftId));
        return s;
    }
    
}
