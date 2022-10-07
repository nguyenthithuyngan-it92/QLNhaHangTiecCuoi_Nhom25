/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Weddingservices;
import com.nhom25.repository.WeddingServicesRepository;
import com.nhom25.services.WeddingServicesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class WeddingServicesServiceImpl implements WeddingServicesService{
    @Autowired
    private WeddingServicesRepository weddingServicesRepository;


    @Override
    public List<Weddingservices> getWeddingServices(String name) {
        return this.weddingServicesRepository.getWeddingServices(name);
    }

    @Override
    public Weddingservices getWeddingServiceById(int id) {
        return this.weddingServicesRepository.getWeddingServiceById(id);
    }

    @Override
    public boolean addOrUpdateWeddingService(Weddingservices ws) {
        return this.weddingServicesRepository.addOrUpdateWeddingService(ws);
    }

    @Override
    public boolean deleteWdService(int weddingservicesId) {
        return this.weddingServicesRepository.deleteWdService(weddingservicesId);
    }

    @Override
    public List<Object[]> countService() {
        return this.weddingServicesRepository.countService();
    }
}
