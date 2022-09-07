/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.configs.handlers;

import com.nhom25.pojo.Account;
import com.nhom25.services.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 *
 * @author LENOVO
 */
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService userDetailsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication a)
            throws IOException, ServletException {
        Account acc = this.userDetailsService.getAccounts(a.getName()).get(0);
        request.getSession().setAttribute("currentUser", acc);
        
        response.sendRedirect("/QLNhaHangTiecCuoi");
    }

}
