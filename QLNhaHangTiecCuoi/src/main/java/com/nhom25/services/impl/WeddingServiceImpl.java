/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Wedding;
import com.nhom25.repository.WeddingRepository;
import com.nhom25.services.WeddingService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class WeddingServiceImpl implements WeddingService{
    @Autowired
    private WeddingRepository weddingRepository;

    @Override
    public List<Wedding> getWeddings(String kw) {
        return this.weddingRepository.getWeddings(kw);
    }

    @Override
    public Wedding getWeddingById(int id) {
        return this.weddingRepository.getWeddingById(id);
    }

    @Override
    public boolean addOrUpdateWedding(Wedding wedding) {
        return this.weddingRepository.addOrUpdateWedding(wedding);
    }
    
}