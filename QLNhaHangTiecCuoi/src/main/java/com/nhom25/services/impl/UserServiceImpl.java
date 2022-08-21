/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.services.impl;

import com.nhom25.pojo.Account;
import com.nhom25.pojo.User;
import com.nhom25.repository.UserRepository;
import com.nhom25.services.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    public BCryptPasswordEncoder passwordEncoder;
    
    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public User addUser(User user) {
        user.setUserRole(User.CUSTOMER);
        return this.userRepository.addUser(user);
    }
    
    @Override
    public Account addAccount(Account acnt) {
        String pass = acnt.getPassword();
        acnt.setPassword(this.passwordEncoder.encode(pass));
        acnt.setActive(Boolean.TRUE);
        
        return this.userRepository.addAccount(acnt);
    }

    @Override
    public List<User> getUsers(String name) {
        return this.userRepository.getUsers(name);
    }
    
    @Override
    public List<Account> getAccounts(String username) {
        return this.userRepository.getAccounts(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<Account> acnts = this.getAccounts(username);
        
        if (acnts.isEmpty())
            throw new UsernameNotFoundException("Người dùng không tồn tại!!!");
        
        Account acnt = acnts.get(0);
        User user = this.userRepository.getUserById(acnt.getUserId());
        
        Set<GrantedAuthority> authorities = new HashSet<>();
        
        authorities.add(new SimpleGrantedAuthority(user.getUserRole()));
        
        UserDetails userDetail = new org.springframework.security
                .core
                .userdetails
                .User(acnt.getUsername(), acnt.getPassword(), authorities);
        return userDetail;
    }

    @Override
    public User getUserByName(String name) {
        return this.userRepository.getUserByName(name);
    }

    @Override
    public boolean addEmployee(User user) {
        return this.userRepository.addEmployee(user);
    }
}
