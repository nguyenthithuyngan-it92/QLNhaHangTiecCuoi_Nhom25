/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services;

import com.nhom25.pojo.Paymentmethods;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LENOVO
 */
public interface PaymentmethodsService {
    List<Paymentmethods> getListPaymentmethods();
    Paymentmethods getPaymentmethodsById(int id);
}
