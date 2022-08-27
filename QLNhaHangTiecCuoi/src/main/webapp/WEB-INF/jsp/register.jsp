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
    <p id="error-message" class="text-danger text-uppercase text-center my-3 alert-danger"></p>
    <form id="submitFormAccount" class="needs-validation" novalidate >
        <div class="left">

            <div class="form-group">
                <label for="name">
                    <spring:message code="user.name" />
                    <span class="text-danger">(*)</span>
                </label>
                <input type="text" name="name" class="form-control" required id="name" placeholder="Nhập họ và tên..."/>
                <div class="invalid-feedback">
                    <spring:message code="notNullMsg" />
                </div>
            </div>
            <div class="form-group">
                <label for="identityCard">
                    <spring:message code="user.identityCard" />
                    <span class="text-danger">(*)</span>
                </label>
                <input type="number" required name="identityCard" id="identityCard" class="form-control" placeholder="Nhập số CMND/CCCD..."/>
                <div  id="invalid-feedback-cmnd" class="invalid-feedback">
                    <spring:message code="notNullMsg" />
                </div>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">
                    <spring:message code="user.dateOfBirth" />
                    <span class="text-danger">(*)</span>
                </label>
                <input type="date" required name="dateOfBirth" id="dateOfBirth" value="" max="" class="form-control" />
                <div class="invalid-feedback">
                    <spring:message code="notNullMsg" />
                </div>
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
                    <span class="text-danger">(*)</span>
                </label>
                <input name="phone" required type="number" id="phone" class="form-control" placeholder="Nhập số điện thoại..."/>
                <div id="invalid-feedback-phone" class="invalid-feedback">
                    <spring:message code="notNullMsg" />
                </div>
            </div>

            <div class="form-group">
                <label for="username">
                    <spring:message code="user.username" />
                    <span class="text-danger">(*)</span>
                </label>
                <input name="username" required id="username" class="form-control" placeholder="Nhập tên tài khoản..."/>
                <div class="invalid-feedback">
                    <spring:message code="notNullMsg" />
                </div>
            </div>

            <div class="form-group">
                <label for="password">
                    <spring:message code="user.password" />
                    <span class="text-danger">(*)</span>
                </label>
                <input type="password" required name="password" id="password" class="form-control" placeholder="Nhập mật khẩu..."/>
                <div id="invalid-feedback-password" class="invalid-feedback">
                    <spring:message code="notNullMsg" />
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">
                    <spring:message code="user.confirmPassword" />
                    <span class="text-danger">(*)</span>
                </label>
                <input type="password" required name="confirmPassword" 
                       id="confirmPassword" class="form-control" 
                       placeholder="Nhập mật khẩu xác nhận..."
                       data-bs-toggle="tooltip" data-bs-placement="right" title="Bạn phải nhập mật khẩu xác nhận!"/>
                <div class="invalid-feedback" id="invalid-feedback-cfpassword">
                    <spring:message code="notNullMsg" />
                </div>
            </div>
            <div class="form-group">
                <label for="avt">
                    <spring:message code="user.avatar" />
                    <span class="text-danger">(*)</span>
                </label>
                <input class="form-control" required type="file" id="upload_avatar">
                <div class="invalid-feedback">
                    Bạn phải chọn ảnh đại diện!
                </div>
            </div>
        </div>

        <div class="form-group mt-3 btnregister">
            <button class="btn btn-primary float-md-end bg-primary" type="submit">ĐĂNG KÝ</button>
        </div>
    </form>
</div>


<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>
<script src="<c:url value="/js/main.js"/>"></script>