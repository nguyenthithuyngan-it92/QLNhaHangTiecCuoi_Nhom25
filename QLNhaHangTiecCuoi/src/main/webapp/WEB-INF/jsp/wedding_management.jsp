<%-- 
    Document   : wedding_management
    Created on : 19 thg 8, 2022, 14:34:07
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
            <i class="fa-solid fa-circle-plus"></i>  Thêm tiệc cưới
        </button>
    </sec:authorize>
    <form action="<c:url value="/admin/wedding-management"/>" class="form-search">
        <input type="text" placeholder="Nhập tên để tìm..." name="name">
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-info">DANH SÁCH TIỆC CƯỚI</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="name">Tên tiệc cưới</th>
                    <th>Hệ số theo thời điểm</th>
                    <th>Mô tả</th>
                    <th>Sảnh cưới</th>
                    <th>Dịch vụ</th>
                        <sec:authorize access="hasAuthority('ADMIN')">
                        <th>Hành động</th>
                        </sec:authorize>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${weddings}" var="wd">
                    <tr>
                        <td>${wd.name}</td>
                        <td>${wd.coefficient}</td>
                        <td>${wd.description}</td>
                        <td>${wd.weddinghallId.name}</td>
                        <td>${wd.weddingservicesId.name}</td>

                        <sec:authorize access="hasAuthority('ADMIN')">
                            <td class="d-flex">
                                <a class="user-edit" href="javascript:;" onclick="">
                                    <i class="fa-solid fa-pen-to-square text-primary" 
                                       data-bs-toggle="tooltip" title="Chỉnh sửa"></i>
                                </a>
                                <%--<c:if test="${user.orders.isEmpty()}">--%>
                                <a class="user-delete" href="javascript:;" onclick="">
                                    <i class="fa-solid fa-trash-can text-warning"
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
            <c:url value="/admin/wedding-management" var="action" />
            <form:form action="${action}" modelAttribute="wedding" 
                       method="post" enctype="multipart/form-data">
                <!--Modal Header--> 
                <div class="modal-header">
                    <h2 class="modal-title text-primary">
                        <i class="fa-solid fa-circle-plus"></i>
                        Thêm tiệc cưới
                    </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!--Modal body--> 
                <div class="modal-body wedding">

                    <form:errors path="*" cssClass="alert alert-danger" element="div" />

                    <div class="form-group">
                        <label for="name">
                            <spring:message code="wd.name" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="name" path="name" id="name" 
                                    cssClass="form-control" placeholder="Nhập tên tiệc cưới..."/>
                        <form:errors path="name" cssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="coefficient">
                            <spring:message code="wd.coefficient" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="coefficient" path="coefficient" id="coefficient" 
                                    cssClass="form-control" placeholder="Nhập hệ số theo thời điểm..."/>
                        <%--<form:errors path="coefficient" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group">
                        <label for="description">
                            <spring:message code="wd.description" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:textarea name="description" path="description" id="description" 
                                       cssClass="form-control" placeholder="Nhập mô tả..."/>
                        <%--<form:errors path="dateOfBirth" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group select">
                        <label for="sel1" class="form-label">
                            <spring:message code="wd.wdhall" />
                        </label>
                        <div class="selected">
                            <form:select path="weddinghallId" name="weddinghallId" class="form-select">
                                <c:forEach items="${wdhall}" var="h">
                                    <option value="${h.weddinghallId}">${h.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group select">
                        <label for="sel2" class="form-label">
                            <spring:message code="wd.wdservice" />
                        </label>
                        <div class="selected">
                            <form:select path="weddingservicesId" name="weddingservicesId" class="form-select">
                                <c:forEach items="${services}" var="s">
                                    <option value="${s.weddingservicesId}">${s.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>

                </div>

                <!--Modal footer--> 
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Thêm</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<!-- The Modal-->
<!--<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            Modal Header 
            <div class="modal-header">
                <h4 class="modal-title">Thông báo</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            Modal body 
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

Modal footer 
<div class="modal-footer">
<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
</div>

</div>
</div>
</div>-->
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>
