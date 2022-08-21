/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Wedding;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface WeddingRepository {
    List<Wedding> getWeddings(String kw);
    Wedding getWeddingById(int id);
    boolean addOrUpdateWedding(Wedding wedding);
}
