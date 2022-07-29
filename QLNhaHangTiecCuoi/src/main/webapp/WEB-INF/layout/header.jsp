<%-- 
    Document   : header
    Created on : 28 thg 7, 2022, 11:05:29
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="javascript:void(0)">Nhà hàng tiệc cưới</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/" />">&#xF424; Trang chủ</a>
                </li>
                
            </ul>
            <form method="get" class="d-flex">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa để tìm...">
                <button type="submit" class="btn btn-primary" type="button">Tìm kiếm</button>
            </form>
        </div>
    </div>
</nav>
