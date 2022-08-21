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
        <input name="name" type="text" placeholder="Nhập họ tên để tìm..." />
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-info">DANH SÁCH KHÁCH HÀNG</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-primary">
                <tr class="text-uppercase text-center">
                    <th class="name">Họ tên</th>
                    <th>Tên tài khoản</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>CMND/CCCD</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${user}" var="user">
                    <c:if test="${user.userRole == 'CUSTOMER'}">
                        <tr>
                            <td>${user.name}</td>
                            <td>
                                <c:if test="${user.account.userId == user.userId}">
                                    <p>${user.account.username}</p>
                                </c:if>
                                <c:if test="${user.account.userId != user.userId}">
                                    <i>Không có tài khoản</i>
                                </c:if>
                            </td>
                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${user.dateOfBirth}"/></td>
                            <td>${user.sex}</td>
                            <td>${user.identityCard}</td>
                            <td>${user.phone}</td>

                            <td>
                                <c:if test="${user.email != null}">
                                    <p>${user.email}</p>
                                </c:if>
                                <c:if test="${user.email == '' || user.email == null}">
                                    <i>Không có dữ liệu</i>
                                </c:if>
                            </td>
                            <!--active-->
                            <td> 
                                <c:if test="${user.account.userId == user.userId && user.account.active == true}">
                                    <i class="fa-solid fa-user-large text-success"></i>
                                </c:if>
                                <c:if test="${user.account.userId != user.userId || user.account.active == false}">
                                    <i class="fa-solid fa-user-large-slash text-danger"></i>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
