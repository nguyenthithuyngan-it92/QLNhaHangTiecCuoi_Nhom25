/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author LENOVO
 */

public interface UserService extends UserDetailsService {
    User getUserById(int id);
    User getUserByName(String name);
    User addUser (User user);
    List<User> getUsers(String name);
    Account addAccount(Account acnt);
    List<Account> getAccounts(String username);
}
