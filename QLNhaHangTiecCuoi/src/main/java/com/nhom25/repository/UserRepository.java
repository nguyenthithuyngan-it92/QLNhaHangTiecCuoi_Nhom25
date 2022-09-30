/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.repository;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.User;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface UserRepository {
    User getUserById(int id);
    User getUserByName(String name);
    Account addAccount(Account act);
    User addUser(User user);
    List<Account> getAccounts(String username);
    List<User> getUsers(String name);
    
    //Management
    boolean addEmployee(User emp);
    Account getAccountById(int id);
    boolean addAccountEmp(Account accEmp);
    boolean deleteEmployee(int userId);
}
