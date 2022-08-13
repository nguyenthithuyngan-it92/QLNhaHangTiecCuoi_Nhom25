<%-- 
    Document   : header
    Created on : 28 thg 7, 2022, 11:05:29
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="javascript:void(0)">Nhà hàng tiệc cưới</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/" />">
                        <i class="fa-solid fa-house" aria-hidden="true"></i> Trang chủ</a>
                </li>

                <sec:authorize access="hasAuthority('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link text-warning" href="<c:url value="/admin/foods" />">
                            <i class="fa-solid fa-address-book" aria-hidden="true"></i> Quản lý</a>
                    </li>
                </sec:authorize>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item">
                            <a class="nav-link text-primary" href="<c:url value="/register" />">
                                <i class="fa-solid fa-user-plus" aria-hidden="true"></i> Đăng ký</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="<c:url value="/login" />">
                                <i class="fa fa-user" aria-hidden="true"></i>  Đăng nhập</a>
                        </li>
                    </c:when>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link text-info" href="#">
                                <c:if test="${currentUser.avatar != null}">
                                    <img style="width:30px;" src="${currentUser.avatar}" class="rounded-circle" />
                                </c:if>
                                <c:if test="${currentUser.avatar == null}">
                                    <img src="<c:url value="/img/avt.png"/>" class="rounded-circle" style="width: 30px;"/>
                                </c:if> 
                                ${currentUser.user.name}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/logout" />">
                                <i class="fa-solid fa-user-minus" aria-hidden="true"></i>  Đăng xuất</a>
                        </li>
                    </c:when>
                </c:choose>

            </ul>

            <form method="get" class="d-flex">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa để tìm...">
                <button type="submit" class="btn btn-primary" type="button">Tìm kiếm</button>
            </form>
        </div>
    </div>
</nav>
