/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Paymentmethods;
import com.nhom25.repository.PaymentmethodsRepository;
import com.nhom25.services.PaymentmethodsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class PaymentmethodsServiceImpl implements PaymentmethodsService{
    @Autowired
    private PaymentmethodsRepository paymentmethodsRepository;

    @Override
    public List<Paymentmethods> getListPaymentmethods() {
        return this.paymentmethodsRepository.getListPaymentmethods();
    }

    @Override
    public Paymentmethods getPaymentmethodsById(int id) {
        return this.paymentmethodsRepository.getPaymentmethodsById(id);
    }
    
}
