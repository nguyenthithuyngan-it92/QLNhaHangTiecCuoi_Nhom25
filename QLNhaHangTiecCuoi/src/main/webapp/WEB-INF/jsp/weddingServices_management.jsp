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
</div>

<div class="msg">
    <c:choose>
        <c:when test="${errMsg != null}">
            <div class="form-group">
                <span class="alert alert-danger">
                    ${errMsg}
                </span>
            </div>
        </c:when>
        <c:when test="${successMsg != null}">
            <div class="form-group">
                <span class="alert alert-success">
                    ${successMsg}
                </span>
            </div>
        </c:when>
    </c:choose>
</div>

<!--TABLE-->
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-info">DANH SÁCH DỊCH VỤ</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="id">Mã</th>
                    <th class="name">Tên dịch vụ</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                    <th>Trạng thái</th>
                        <sec:authorize access="hasAuthority('ADMIN')">
                        <th>Hành động</th>
                        </sec:authorize>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${wdservices}" var="services">
                    <tr>
                        <td>${services.weddingservicesId}</td>
                        <td id="name${services.weddingservicesId}">${services.name}</td>
                        <td id="price${services.weddingservicesId}">
                            <fmt:formatNumber type="number" maxFractionDigits="3" 
                                              value="${services.price}" />  VNĐ
                        </td>
                        <td id="description${services.weddingservicesId}">${services.description}</td>
                        <td id="active${services.weddingservicesId}" hidden="true">${services.active}</td>
                        <td>
                            <c:choose>
                                <c:when test="${services.active == true}">
                                    <i class="fa-solid fa-circle-check text-success"></i>
                                </c:when>
                                <c:when test="${services.active == false || services.active == null}">
                                    <i class="fa-solid fa-circle-xmark text-danger"></i>
                                </c:when>
                            </c:choose>
                        </td>
                        
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <td class="d-flex">
                                <a class="user-edit" href="javascript:;" 
                                   onclick="getWdServiceInfo(${services.weddingservicesId})" 
                                   data-bs-toggle="modal" data-bs-target="#myModal">
                                    <i class="fa-solid fa-pen-to-square text-primary"
                                       data-bs-toggle="tooltip" title="Chỉnh sửa"></i>
                                </a>
                                   
                                <c:choose>
                                    <c:when test="${services.ordersSet.isEmpty() || services.ordersSet == null}">
                                        <a class="user-delete" href="javascript:;" onclick="deleteWdService(${services.weddingservicesId})">
                                            <i class="fa-solid fa-trash-can text-danger"
                                               data-bs-toggle="tooltip" title="Xóa"></i>
                                        </a>
                                    </c:when>
                                    <c:when test="${!services.ordersSet.isEmpty() || services.ordersSet != null}">
                                        <a class="user-delete disabled" href="javascript:;" onclick="" disabled>
                                            <i class="fa-solid fa-trash-can text-danger" 
                                               data-bs-toggle="tooltip" title="Không thể xóa!"></i>
                                        </a>
                                    </c:when>
                                </c:choose>
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
                    <h2 class="modal-title text-primary" id="title">
                        <i class="fa-solid fa-circle-plus"></i>
                        Thêm dịch vụ
                    </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!--Modal body--> 
                <div class="modal-body wedding">

                    <div class="form-group">
                        <label for="inputName">
                            <spring:message code="service.name" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="name" path="name" id="inputName" 
                                    cssClass="form-control" placeholder="Nhập tên dịch vụ..."/>
                        <form:errors path="name" cssClass="text-danger" />
                    </div>

                    <div class="form-group">
                        <label for="inputPrice">
                            <spring:message code="service.price" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="price" type="number" path="price" id="inputPrice" 
                                    cssClass="form-control" placeholder="Nhập giá dịch vụ..."/>
                        <form:errors path="price" cssClass="text-danger" />
                    </div>

                    <div class="form-group">
                        <label for="inputDescription">
                            <spring:message code="service.description" />
                        </label>
                        <form:textarea name="description" path="description" id="inputDescription" 
                                       cssClass="form-control" placeholder="Nhập mô tả..."/>
                    </div>
                    
                    <div class="form-check">
                        <input class="form-check-input" name="active" type="checkbox" id="activeCheck" checked="true">
                        <label class="form-check-label" for="activeCheck">
                            Trạng thái
                        </label>
                    </div>
                    
                    <form:input path="weddingservicesId" name="weddingservicesId" hidden="true" id="inputWdServicesId" value="0" />
                </div>

                <!--Modal footer--> 
                <div class="modal-footer">
                    <button type="submit" id="button" class="btn btn-success">Thêm</button>
                    
                    <button type="reset" onclick="setButtonService()" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                </div>
            </form:form>
        </div>
    </div>
</div>


<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>

<script src="<c:url value="/js/management.js"/>"></script>