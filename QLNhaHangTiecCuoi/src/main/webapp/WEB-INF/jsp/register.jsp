<%-- 
    Document   : register
    Created on : 5 thg 8, 2022, 21:02:31
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container register">
    <h1 class="text-center text-uppercase text-primary">
        <spring:message code="user.register" />
    </h1>
    <p id="error-message" class="text-danger text-uppercase text-center my-3"></p>
    <form id="submitFormAccount" >
        <div class="left">
           
            <div class="form-group">
                <label for="name"><spring:message code="user.name" /><span class="book-required text-danger">(*)</span></label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Nhập họ và tên..."/>
                <%--<form:errors path="name" cssClass="text-danger" />--%>
            </div>
            <div class="form-group">
                <label for="identityCard">
                    <spring:message code="user.identityCard" />
                </label>
                <input name="identityCard" id="identityCard" class="form-control" placeholder="Nhập số CMND/CCCD..."/>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">
                    <spring:message code="user.dateOfBirth" />
                </label>
                <input type="date" name="dateOfBirth" id="dateOfBirth" class="form-control" />
            </div>
            <div class="form-group select">
                <label for="sex">
                    <spring:message code="user.sex" />
                </label>
                <div class="selected">
                    <select class="form-select" name="sex" id="sex">
                        <option value="NAM">NAM</option>
                        <option value="NỮ">NỮ</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="email">
                    <spring:message code="user.email" />
                </label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Nhập địa chỉ mail..."/>
            </div>
        </div>
        <div class="right">
            <div class="form-group">
                <label for="phone">
                    <spring:message code="user.phone" />
                </label>
                <input name="phone" type="number" id="phone" class="form-control" placeholder="Nhập số điện thoại..."/>
            </div>

            <div class="form-group">
                <label for="username">
                    <spring:message code="user.username" />
                </label>
                <input name="username" id="username" class="form-control" placeholder="Nhập tên tài khoản..."/>
            </div>

            <div class="form-group">
                <label for="password">
                    <spring:message code="user.password" />
                </label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Nhập mật khẩu..."/>
            </div>

            <div class="form-group">
                <label for="confirmPassword">
                    <spring:message code="user.confirmPassword" />
                </label>
                <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Nhập mật khẩu xác nhận..."/>
            </div>
            <div class="form-group">
                <label for="avt">
                    <spring:message code="user.avatar" />
                </label>
                 <input class="form-control" type="file" id="upload_avatar">
            </div>
        </div>

        <div class="form-group mt-3 btnregister">
            <button class="btn btn-primary " type="submit">ĐĂNG KÝ</button>
        </div>
    </form>
</div>
