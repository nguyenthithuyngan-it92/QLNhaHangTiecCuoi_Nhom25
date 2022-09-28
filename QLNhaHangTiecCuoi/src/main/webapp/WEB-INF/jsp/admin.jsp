<%-- 
    Document   : admin
    Created on : 14 thg 8, 2022, 13:29:50
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="search">
    <form action="<c:url value="/admin/"/>" class="form-search">
        <input name="username" type="text" placeholder="Nhập tên tài khoản để tìm..." />
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-info">DANH SÁCH TÀI KHOẢN HỆ THỐNG</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-primary">
                <tr class="text-uppercase text-center">
                    <th></th>
                    <th class="name">Họ tên</th>
                    <th>Tên tài khoản</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${accounts}" var="acc">
                    <tr>
                        <td>
                            <div class="avtar">
                                <div class="avtar-img">
                                    <c:if test="${acc.avatar != null}">
                                        <img src="${acc.avatar}" />
                                    </c:if>
                                    <c:if test="${acc.avatar == null}">
                                        <img src="<c:url value="/img/avt.png"/>" />
                                    </c:if>
                                </div>
                            </div>
                        </td>

                        <td>${acc.user.name}</td>
                        <td>${acc.username}</td>
                        <td>${acc.user.phone}</td>

                        <td>
                            <c:if test="${acc.user.email != null || acc.user.email == ''}">
                                <p>${acc.user.email}</p>
                            </c:if>
                            <c:if test="${acc.user.email == '' || acc.user.email == null}">
                                <i>Không có dữ liệu</i>
                            </c:if>
                        </td>
                        <!--active-->
                        <td> 
                            <c:if test="${acc.active == true}">
                                <i class="fa-solid fa-user-large text-success"></i>
                            </c:if>
                            <c:if test="${acc.active == false}">
                                <i class="fa-solid fa-user-large-slash text-danger"></i>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
