/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Weddingservices;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface WeddingServicesRepository {
    List<Weddingservices> getWeddingServices(String name);
    Weddingservices getWeddingServiceById(int id);
    boolean addOrUpdateWeddingService(Weddingservices ws);
}
