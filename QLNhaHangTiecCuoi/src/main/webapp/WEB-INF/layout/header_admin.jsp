<%--
    Document   : header_admin
    Created on : 14 thg 8, 2022, 14:15:28
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="main">
    <!-- Side bar start -->
    <div class="side-bar">
        <div class="logo" style="margin-top: 15px;">
            <a href="#"><img src="<c:url value="/img/logo.png"/>" /></a>
        </div>

        <div class="avtar">
            <div class="avtar-img">
                <c:if test="${currentUser.avatar != null}">
                    <img src="${currentUser.avatar}" />
                </c:if>
                <c:if test="${currentUser.avatar == null}">
                    <img src="<c:url value="/img/avt.png"/>" />
                </c:if>
            </div>
            <div class="name-pos">
                <h3>${currentUser.user.name}</h3>
            </div>
        </div>
        <div class="side-bar-nav">
            <ul>
                <li>
                    <a href="<c:url value="/admin/" />" class="link-wrapper active">
                        <span><i class="fas fa-home"></i></span>
                        <span class="nav-link">Bảng điều khiển</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/" />" class="link-wrapper">
                        <span><i class="fas fa-home"></i></span>
                        <span class="nav-link">Trang chủ</span>
                    </a>
                </li>
                <li>
                    <a href="./user-management.html" class="link-wrapper">
                        <span><i class="fas fa-users"></i></span>
                        <span class="nav-link">Quản lý người dùng</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/statistical" />" class="link-wrapper">
                        <span><i class="fas fa-chart-bar"></i></span>
                        <span class="nav-link">Thống kê</span>
                    </a>
                </li>
                <li>
                    <div class="link-wrapper">
                        <span><i class="fas fa-route"></i></span>
                        <span class="nav-link">
                            Quản lý tiệc cưới
                        </span>
                        <span class="ml-5"><i class="fas fa-angle-down"></i></span>
                    </div>
                    <ul class="side-bar-subnav">
                        <li>
                            <a href="./addTour.html">
                                <i class="fas fa-plus mr-2"></i>
                                <span class="hide-nav">Sảnh cưới</span>
                            </a>
                        </li>
                        <li>
                            <a href="./addTour-detail.html"><i class="fas fa-plus mr-2"></i>
                                <span class="hide-nav">Dịch vụ</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="./addBlog.html" class="link-wrapper">
                        <span><i class="fas fa-newspaper"></i></span>
                        <span class="nav-link">Quản lý tin tức</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Side bar end -->


    <!-- Header start -->
    <header>
        <div class="head_inner">
            <div class="left-part" style="margin-left: auto;">
                <ul>
                    <li>
                        <div class="profile">
                            <div class="avtar-img">
                                <c:if test="${currentUser.avatar != null}">
                                    <img src="${currentUser.avatar}"/>
                                </c:if>
                                <c:if test="${currentUser.avatar == null}">
                                    <img src="<c:url value="/img/avt.png"/>"/>
                                </c:if>
                            </div>
                            <div class="avtar-name">
                                <h3>${currentUser.user.name}</h3>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span class="d-flex">
                            <a href="<c:url value="/logout" />"></a>
                            <h3 class="mr-2">Đăng xuất</h3>
                            <i class="fas fa-sign-out-alt"></i>
                        </span>
                    </li>

                    <li>
                        <span class="bar"><i class="fas fa-bars"></i></span>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!-- Header end -->
