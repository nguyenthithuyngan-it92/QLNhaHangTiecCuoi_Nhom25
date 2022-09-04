/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LENOVO
 */
public class ListFood {
    private List<Map<String, String>> foods = new ArrayList<>();

    /**
     * @return the foods
     */
    public List<Map<String, String>> getFoods() {
        return foods;
    }

    /**
     * @param foods the foods to set
     */
    public void setFoods(List<Map<String, String>> foods) {
        this.foods = foods;
    }

}
