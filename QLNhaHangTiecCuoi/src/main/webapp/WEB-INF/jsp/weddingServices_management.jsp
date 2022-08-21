<%-- 
    Document   : weddingServices_management
    Created on : 17 thg 8, 2022, 21:17:46
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="search">
    <sec:authorize access="hasAuthority('ADMIN')">
        <!-- Button to Open the Modal -->
        <button type="button" class="btn btn-primary btnModal" data-bs-toggle="modal" data-bs-target="#myModal">
            <i class="fa-solid fa-circle-plus"></i>  Thêm dịch vụ
        </button>
    </sec:authorize>
    <form action="<c:url value="/admin/weddingService-management"/>" class="form-search">
        <input type="text" placeholder="Nhập tên để tìm..." name="name">
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
    <!--    <div class="result alert-danger">
    <c:if test="${errMsg != null}">
        <div class="form-group">
            <span class="form-message-login error">
        ${errMsg}
    </span>
</div>
    </c:if>
    <c:if test="${successMsg != null}">
        <div class="form-group">
            <span class="form-message-login success">
        ${successMsg}
    </span>
</div>
    </c:if>
</div>-->
</div>

<c:if test="${errMsg != null}">
    <div class="form-group">
        <span class="form-message-login error">
            ${errMsg}
        </span>
    </div>
</c:if>
<c:if test="${successMsg != null}">
    <div class="form-group">
        <span class="form-message-login success">
            ${successMsg}
        </span>
    </div>
</c:if>
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-info">DANH SÁCH DỊCH VỤ</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="name">Tên dịch vụ</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                        <sec:authorize access="hasAuthority('ADMIN')">
                        <th>Hành động</th>
                        </sec:authorize>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${wdservices}" var="services">
                    <tr>
                        <td>${services.name}</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" 
                                          value="${services.price}" />  VNĐ
                        </td>
                        <td>${services.description}</td>

                        <sec:authorize access="hasAuthority('ADMIN')">
                            <td class="d-flex">
                                <a class="user-edit" href="javascript:;" onclick="">
                                    <i class="fa-solid fa-pen-to-square text-primary"
                                       data-bs-toggle="tooltip" title="Chỉnh sửa"></i>
                                </a>
                                <%--<c:if test="${user.orders.isEmpty()}">--%>
                                <a class="user-delete" href="javascript:;" onclick="">
                                    <i class="fa-solid fa-trash-can text-danger"
                                       data-bs-toggle="tooltip" title="Xóa"></i>
                                </a>
                                <%--</c:if>--%>
                            </td>
                        </sec:authorize>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>



<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <c:url value="/admin/weddingService-management" var="action" />
            <form:form action="${action}" modelAttribute="weddingservices" 
                       method="post" enctype="multipart/form-data">
                <!--Modal Header--> 
                <div class="modal-header">
                    <h2 class="modal-title text-primary">
                        <i class="fa-solid fa-circle-plus"></i>
                        Thêm dịch vụ
                    </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!--Modal body--> 
                <div class="modal-body wedding">

                    <%--<form:errors path="*" cssClass="alert alert-danger" element="div" />--%>

                    <div class="form-group">
                        <label for="name">
                            <spring:message code="service.name" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="name" path="name" id="name" 
                                    cssClass="form-control" placeholder="Nhập tên dịch vụ..."/>
                        <%--<form:errors path="name" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group">
                        <label for="price">
                            <spring:message code="service.price" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="price" type="number" path="price" id="price" 
                                    cssClass="form-control" placeholder="Nhập giá dịch vụ..."/>
                        <%--<form:errors path="identityCard" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group">
                        <label for="description">
                            <spring:message code="service.description" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:textarea name="description" path="description" id="description" 
                                       cssClass="form-control" placeholder="Nhập mô tả..."/>
                        <%--<form:errors path="dateOfBirth" cssClass="text-danger" />--%>
                    </div>
                </div>

                <!--Modal footer--> 
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Thêm</button>
                    <button class="btn btn-success" type="button" disabled>
                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        Đang thêm...
                    </button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- The Modal-->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!--Modal Header--> 
            <div class="modal-header">
                <h4 class="modal-title">Thông báo</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!--Modal body--> 
            <div class="modal-body">
                <c:if test="${errMsg != null}">
                    <div class="form-group">
                        <span class="form-message-login error">
                            ${errMsg}
                        </span>
                    </div>
                </c:if>
                <c:if test="${successMsg != null}">
                    <div class="form-group">
                        <span class="form-message-login success">
                            ${successMsg}
                        </span>
                    </div>
                </c:if>
            </div>

            <!--Modal footer--> 
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
            </div>

        </div>
    </div>
</div>

<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>