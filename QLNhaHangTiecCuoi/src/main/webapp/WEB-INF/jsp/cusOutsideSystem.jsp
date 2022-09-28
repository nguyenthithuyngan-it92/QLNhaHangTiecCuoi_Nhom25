<%-- 
    Document   : cusInSystem
    Created on : 28 thg 9, 2022, 20:48:41
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="search">
    <form action="<c:url value="/admin/employee-management"/>" class="form-search">
        <input type="text" placeholder="Nhập họ tên để tìm..." name="name">
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>


<!--TABLE-->
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-info">DANH SÁCH KHÁCH HÀNG NGOÀI HỆ THỐNG</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="name">Họ tên</th>
                    <th>CMND/CCCD</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <sec:authorize access="hasAuthority('ADMIN')">
                        <th>Hành động</th>
                    </sec:authorize>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${usersOutsideSystem}" var="user">
                    <c:if test="${user.userRole == 'CUSTOMER' && user.account.userId == null}">
                        <tr>
                            <td>${user.name}</td>
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

                            <sec:authorize access="hasAuthority('ADMIN')">
                                <td class="d-flex">
                                    <a class="user-edit" href="javascript:;" onclick="">
                                        <i class="fas fa-user-edit text-info" 
                                           data-bs-toggle="tooltip" title="Chỉnh sửa"></i>
                                    </a>
                                    <%--<c:if test="${user.orders.isEmpty()}">--%>
                                    <a class="user-delete" href="javascript:;" onclick="">
                                        <i class="fa-solid fa-user-xmark text-warning"
                                           data-bs-toggle="tooltip" title="Xóa"></i>
                                    </a>
                                    <%--</c:if>--%>
                                </td>
                            </sec:authorize>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>

<script src="<c:url value="/js/management.js"/>"></script>
