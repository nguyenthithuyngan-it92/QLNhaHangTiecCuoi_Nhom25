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
    <div class="side-bar hide">
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
                <h5>${currentUser.user.userRole}</h5>
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
                        <span><i class="fas fa-solid fa-house-user"></i></span>
                        <span class="nav-link">Trang chủ</span>
                    </a>
                </li>

                <div class="accordion" id="accordionPanelsStayOpenExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingCus">
                            <a class="accordion-button link-wrapper" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseCus"
                               aria-expanded="true" aria-controls="panelsStayOpen-collapseCus"/>
                            <span><i class="fa-solid fa-users-between-lines"></i></span>
                            <span class="nav-link">Quản lý khách hàng</span>
                            </a>
                        </h2>
                        <div id="panelsStayOpen-collapseCus" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingCus">
                            <div class="accordion-body">
                                <div class="accordion-item-custom">
                                    <a href="<c:url value="/admin/customer-in-system"/>">
                                        <i class="fas fa-plus mr-2"></i>
                                        <span class="hide-nav">Khách hàng trong hệ thống</span>
                                    </a> 
                                </div>
                                <div class="accordion-item-custom">
                                    <a href="<c:url value="/admin/customer-outside-system"/>">
                                        <i class="fas fa-plus mr-2"></i>
                                        <span class="hide-nav">Khách hàng ngoài hệ thống</span>
                                    </a>
                                </div>               
                            </div>
                        </div>
                    </div>           
                </div>
                <sec:authorize access="hasAuthority('ADMIN')">                        
                    <li>
                        <a href="<c:url value="/admin/employee-management" />" class="link-wrapper">
                            <span><i class="fas fa-users"></i></span>
                            <span class="nav-link">Quản lý nhân viên</span>
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('EMPLOYEE')">
                    <li>
                        <a href="<c:url value="/admin/pay" />" class="link-wrapper">
                            <span><i class="fa-solid fa-wallet"></i></span>
                            <span class="nav-link">Thanh toán</span>
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('ADMIN')">
                    <div class="accordion" id="accordionPanelsStayStatsExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingStats">
                                <a class="accordion-button link-wrapper" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseStats" 
                                   aria-expanded="true" aria-controls="panelsStayOpen-collapseOne" 
                                   href="<c:url value="/admin/stats" />">
                                    <span class="wrap-icon"><i class="fas fa-solid fa-chart-bar"></i></span>
                                    <span class="nav-link">Thống kê</span>
                                </a>
                            </h2>
                            <div id="panelsStayOpen-collapseStats" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingStats">
                                <div class="accordion-body">
                                    <div class="accordion-item-custom">
                                        <a href="<c:url value="/admin/stats"/>">
                                            <i class="fas fa-plus mr-2"></i>
                                            <span class="hide-nav">Mật độ tiệc cưới</span>
                                        </a> 
                                    </div>
                                    <div class="accordion-item-custom">
                                        <a href="<c:url value="/admin/monthStats"/>">
                                            <i class="fas fa-plus mr-2"></i>
                                            <span class="hide-nav">Doanh thu theo tháng</span>
                                        </a> 
                                    </div>
                                    <div class="accordion-item-custom">
                                        <a href="<c:url value="/admin/quarterStats"/>">
                                            <i class="fas fa-plus mr-2"></i>
                                            <span class="hide-nav">Doanh thu theo quý</span>
                                        </a>
                                    </div>
                                    <div class="accordion-item-custom">
                                        <a href="<c:url value="/admin/yearStats"/>">
                                            <i class="fas fa-plus mr-2"></i>
                                            <span class="hide-nav">Doanh thu theo năm</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>           
                    </div>
                </sec:authorize>
                <div class="accordion" id="accordionPanelsStayOpenExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                            <a class="accordion-button link-wrapper" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" 
                               aria-expanded="true" aria-controls="panelsStayOpen-collapseOne" 
                               href="<c:url value="/admin/wedding-management" />">
                                <span><img src="<c:url value="/img/iconring.png"/>" alt="ring" width="25px"/></span>
                                <span class="nav-link">Quản lý tiệc cưới</span>
                            </a>
                        </h2>
                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                            <div class="accordion-body">
                                <div class="accordion-item-custom">
                                    <a href="<c:url value="/admin/weddingHall-management"/>">
                                        <i class="fas fa-plus mr-2"></i>
                                        <span class="hide-nav">Sảnh cưới</span>
                                    </a> 
                                </div>
                                <div class="accordion-item-custom">
                                    <a href="<c:url value="/admin/weddingService-management"/>">
                                        <i class="fas fa-plus mr-2"></i>
                                        <span class="hide-nav">Dịch vụ</span>
                                    </a>
                                </div>               
                            </div>
                        </div>
                    </div>           
                </div>

                <div class="accordion" id="manage-02">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                            <a class="accordion-button link-wrapper" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" 
                               aria-expanded="true" aria-controls="panelsStayOpen-collapseOne" 
                               href="<c:url value="/admin/food-management" />">
                                <span class="wrap-icon"><i class="fas fa-solid fa-utensils"></i></span>
                                <span class="nav-link">Quản lý thực đơn</span>
                            </a>
                        </h2>
                        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
                            <div class="accordion-body">
                                <div class="accordion-item-custom">
                                    <a href="<c:url value="/admin/food-management"/>">
                                        <i class="fa-solid fa-list" style="margin: 5px;"></i>
                                        <span class="hide-nav">Danh sách món ăn</span>
                                    </a> 
                                </div>
                                <c:forEach items="${categories}" var="category">
                                    <div class="accordion-item-custom">
                                        <c:url value="/admin/food-management/" var="cUrl">
                                            <c:param name="cateId" value="${category.categoryId}" />
                                        </c:url>
                                        <a href="${cUrl}">
                                            <i class="fas fa-plus mr-2"></i>
                                            <span class="hide-nav">${category.name}</span>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>           
                </div>

                <li> 
                    <a href="<c:url value="/logout" />" class="link-wrapper">
                        <span><i class="fas fa-sign-out-alt"></i></span>
                        <span class="nav-link">Đăng xuất</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Side bar end -->


    <!-- Header start -->
    <header class="fixed-top slide-left">
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
                        <span class="bar"><i class="fas fa-bars"></i></span>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!-- Header end -->
