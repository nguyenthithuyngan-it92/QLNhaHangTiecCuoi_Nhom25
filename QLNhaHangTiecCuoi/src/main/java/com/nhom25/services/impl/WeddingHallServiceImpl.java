/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nhom25.pojo.Weddinghall;
import com.nhom25.repository.WeddingHallRepository;
import com.nhom25.services.WeddingHallService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class WeddingHallServiceImpl implements WeddingHallService{
    @Autowired
    private WeddingHallRepository weddingHallRepository;
    
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Weddinghall> getWeddingHalls(String name) {
        return this.weddingHallRepository.getWeddingHalls(name);
    }

    @Override
    public Weddinghall getWeddingHallById(int hallID) {
        return this.weddingHallRepository.getWeddingHallById(hallID);
    }

    @Override
    public boolean addOrUpdateWeddingHall(Weddinghall weddinghall) {
        try {
            if(!weddinghall.getImg().isEmpty() && weddinghall.getImg() != null){
                Map r = this.cloudinary.uploader().upload(weddinghall.getImg().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                weddinghall.setImage((String) r.get("secure_url"));
            }
            else
                weddinghall.setImage(this.weddingHallRepository.getWeddingHallById(weddinghall.getWeddinghallId()).getImage());
            return this.weddingHallRepository.addOrUpdateWeddingHall(weddinghall);
        } catch (IOException ex) {
            System.err.println("===ADD===" + ex.getMessage());
            ex.printStackTrace();
        }  

        return false;
    }

    @Override
    public boolean deleteWdHall(int weddinghallId) {
        return this.weddingHallRepository.deleteWdHall(weddinghallId);
    }
    
    @Override
    public List<Object[]> densityStats(int year) {
        return this.weddingHallRepository.densityStats(year);
    }
    
    @Override
    public List<Object[]> quarterStats(int quarter, int year) {
        return this.weddingHallRepository.quarterStats(quarter, year);
    }

    @Override
    public List<Object[]> monthStats(int m, int y) {
        return this.weddingHallRepository.monthStats(m, y);
    }

    @Override
    public List<Object[]> yearStats(int y) {
        return this.weddingHallRepository.yearStats(y);
    }
}
