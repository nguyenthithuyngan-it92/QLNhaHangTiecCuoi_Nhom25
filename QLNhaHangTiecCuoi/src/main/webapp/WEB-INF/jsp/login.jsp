<%-- 
    Document   : login
    Created on : Aug 5, 2022, 10:55:16 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <c:if test="${param.error != null}">
        <div class="alert alert-danger">
            Username hoặc password không chính xác!!!
        </div>
    </c:if>
    <c:if test="${param.accessDenied != null}">
        <div class="alert alert-danger">
            KHÔNG có quyền truy cập chức năng này!!!
        </div>
    </c:if>
    <c:url value="/login" var="action" />
    <form method="post" action="${action}">
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">User:</label>
            <input type="text" name="username" class="form-control" id="email" placeholder="Enter username" name="email">
        </div>
        <div class="mb-3">
            <label for="pwd" class="form-label">Password:</label>
            <input type="password" name="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
        </div>
        <button type="submit" class="btn btn-primary">Đăng nhập</button>
    </form>
</div>
