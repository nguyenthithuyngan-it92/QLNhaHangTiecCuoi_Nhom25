/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services;

import com.nhom25.pojo.Weddinghall;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface WeddingHallService {
    List<Weddinghall> getWeddingHalls(String name);
    Weddinghall getWeddingHallById(int hallID);
    boolean addOrUpdateWeddingHall(Weddinghall weddinghall);
    boolean deleteWdHall(int weddinghallId);
    
    //Thống kê
    List<Object[]> densityStats(int year);
    List<Object[]> monthStats(int month, int year);
    List<Object[]> quarterStats(int quarter, int year);
    List<Object[]> yearStats(int year);
}
