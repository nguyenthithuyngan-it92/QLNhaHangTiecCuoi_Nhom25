/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.validator;

import com.nhom25.pojo.Account;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author LENOVO
 */
@Component
public class PassValidator implements Validator{

    @Override
    public boolean supports(Class<?> clazz) {
        return Account.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Account a = (Account) target;
        if (a.getUsername().contains(" "))
            errors.reject("username", "user.username.spaceErr");
        
        if (!a.getPassword().trim().equals(a.getConfirmPassword().trim()))
            errors.rejectValue("password", "account.password.error.notMatchMsg");
    }
    
}
