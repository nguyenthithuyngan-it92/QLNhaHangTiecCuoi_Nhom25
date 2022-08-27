<%-- 
    Document   : products
    Created on : 9 thg 8, 2022, 19:58:02
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
            <i class="fa-solid fa-user-plus"></i>  Thêm món ăn
        </button>
    </sec:authorize>
    <form action="<c:url value="/admin/food-management"/>" class="form-search">
        <input type="text" placeholder="Nhập từ khóa để tìm..." name="kw">
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
        <h2 class="text-uppercase text-center text-info">DANH SÁCH MÓN ĂN</h2>
    </div>
    <div class="user-table food">
        <!--        <div class="spinner-grow text-danger" id="myLoading"></div>-->
        <table class="table">
            <thead class="table-success food">
                <tr class="text-uppercase text-center">
                    <th class="id">Mã</th>
                    <th>Ảnh</th>
                    <th class="name">Tên món ăn</th>
                    <th hidden="true">Mã danh mục</th>
                    <th class="name">Danh mục món</th>
                    <th>Giá</th>
                    <th class="description">Mô tả</th>
                    
                        <sec:authorize access="hasAuthority('ADMIN')">
                        <th>Hành động</th>
                        </sec:authorize>
                </tr>
            </thead>
            <tbody class="food">
                <c:forEach items="${foods}" var="food">
                    <tr>
                        <td>${food.foodId}</td>
                        
                         <td id="image${food.foodId}">
                             <img src="${food.image}" alt="${food.name}" class="imageMana"/>
                         </td>
                         
                        <td id="name${food.foodId}">${food.name}</td>

                        <td id="cate${food.foodId}" hidden="true">${food.categoryId.categoryId}</td>
                        <td>${food.categoryId.name}</td>

                        <td id="price${food.foodId}">
                            <fmt:formatNumber type="number" maxFractionDigits="3" 
                                              value="${food.price}" />  VNĐ
                        </td>
                        <td id="description${food.foodId}">${food.description}</td>

                        <sec:authorize access="hasAuthority('ADMIN')">
                            <td class="d-flex" style="padding-top: 50px; padding-bottom: 50px;">
                                <a class="user-edit" href="javascript:;" 
                                   onclick="getFoodInfo(${food.foodId})" 
                                   data-bs-toggle="modal" data-bs-target="#myModal">
                                    <i class="fa-solid fa-pen-to-square text-primary" 
                                       data-bs-toggle="tooltip" title="Chỉnh sửa"></i>
                                </a>

                                <!--XÓA-->
                                <c:choose>
                                    <c:when test="${food.ordersSet.isEmpty() || food.ordersSet == null}">
                                        <a class="user-delete" href="javascript:;" 
                                           onclick="deleteFood(${food.foodId})">
                                            <i class="fa-solid fa-trash-can text-danger"
                                               data-bs-toggle="tooltip" title="Xóa"></i>
                                        </a>
                                    </c:when>
                                    <c:when test="${!food.ordersSet.isEmpty() || food.ordersSet != null}">
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
            <c:url value="/admin/food-management" var="action" />
            <form:form action="${action}" modelAttribute="food" 
                       method="post" enctype="multipart/form-data">
                <!--Modal Header--> 
                <div class="modal-header">
                    <h2 class="modal-title text-primary" value="Thêm món ăn" id="title" >
                        <i class="fa-solid fa-circle-plus"></i>
                        Thêm món ăn
                    </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!--Modal body--> 
                <div class="modal-body wedding">

                    <form:errors path="*" cssClass="alert alert-danger" element="div" />

                    <div class="form-group">
                        <label for="inputName">
                            <spring:message code="food.name" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="name" path="name" id="inputName" 
                                    cssClass="form-control" placeholder="Nhập tên món ăn..."/>
                        <%--<form:errors path="name" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group select">
                        <label for="inputCate" class="form-label">
                            <spring:message code="food.cate" />
                        </label>
                        <div class="selected">
                            <form:select path="categoryId" id="inputCate" cssClass="form-select">
                                <c:forEach items="${categories}" var="c">
                                    <option id="categories${c.categoryId}" value="${c.categoryId}">${c.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPrice">
                            <spring:message code="food.price" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="price" type="number" path="price" id="inputPrice" 
                                    cssClass="form-control" placeholder="Nhập giá..."/>
                        <%--<form:errors path="identityCard" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group">
                        <label for="inputDescription">
                            <spring:message code="food.description" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:textarea name="description" path="description" id="inputDescription" 
                                       cssClass="form-control" placeholder="Nhập mô tả..."/>
                        <%--<form:errors path="dateOfBirth" cssClass="text-danger" />--%>
                    </div>

                    <div class="form-group">
                        <label for="inputImage">
                            <spring:message code="food.img" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input name="img" path="img" cssClass="form-control" type="file" id="inputImage" />
                    </div>

                    <form:input path="foodId" name="foodId" id="inputFoodId" hidden="true" value="0" />
                </div>

                <!--Modal footer--> 
                <div class="modal-footer">
                    <button type="submit" id="button" class="btn btn-success">Thêm</button>
                    <button type="reset" onclick="setButtonFood()" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
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

<script src="<c:url value="/js/management.js" />"></script>
