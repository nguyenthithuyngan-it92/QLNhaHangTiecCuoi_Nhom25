/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.formatters;

import com.nhom25.pojo.Paymentmethods;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LENOVO
 */
public class PaymentmethodsFormatter implements Formatter<Paymentmethods>{

    @Override
    public String print(Paymentmethods object, Locale locale) {
        return String.valueOf(object.getPaymentmethodsId());
    }

    @Override
    public Paymentmethods parse(String paymentmethodsId, Locale locale) throws ParseException {
        Paymentmethods p = new Paymentmethods();
        p.setPaymentmethodsId(Integer.parseInt(paymentmethodsId));
        return p;
    }
    
}
