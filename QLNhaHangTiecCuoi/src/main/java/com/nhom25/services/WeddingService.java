/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services;

import com.nhom25.pojo.Wedding;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface WeddingService {
    List<Wedding> getWeddings(String kw);
    Wedding getWeddingById(int id);
    boolean addOrUpdateWedding(Wedding wedding);
    boolean deleteWedding(int weddingId);
    List<Object[]> densityStats(int year);
    List<Object[]> monthStats(int month, int year);
    List<Object[]> quarterStats(int quarter, int year);
    List<Object[]> yearStats(int year);
}
