/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Weddinghall;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface WeddingHallRepository {
    List<Weddinghall> getWeddingHalls(String name);
    Weddinghall getWeddingHallById(int hallID);
    boolean addOrUpdateWeddingHall(Weddinghall weddinghall);
}
