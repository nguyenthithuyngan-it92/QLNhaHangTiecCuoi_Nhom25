<%-- 
    Document   : employee_management
    Created on : 17 thg 8, 2022, 12:00:20
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
            <i class="fa-solid fa-user-plus"></i>  Thêm nhân viên
        </button>
    </sec:authorize>
    <form action="<c:url value="/admin/employee-management"/>" class="form-search">
        <input type="text" placeholder="Nhập họ tên để tìm..." name="name">
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
        <h2 class="text-uppercase text-center text-info">DANH SÁCH NHÂN VIÊN</h2>
    </div>
    <div class="user-table">
        <table class="table">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="name">Họ tên</th>
                    <th>Tên tài khoản</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>CMND/CCCD</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Chức vụ</th>
                    <th>Vai trò</th>
                    <th>Trạng thái</th>
                    <sec:authorize access="hasAuthority('ADMIN')">
                        <th>Hành động</th>
                    </sec:authorize>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user">
                    <c:if test="${user.userRole == 'ADMIN' || user.userRole == 'EMPLOYEE'}">
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
                            <td>${user.position}</td>
                            <td>${user.userRole}</td>
                            <td> 
                                <c:if test="${user.account.userId == user.userId && user.account.active == true}">
                                    <i class="fa-solid fa-user-large text-success"></i>
                                </c:if>
                                <c:if test="${user.account.userId != user.userId || user.account.active == false}">
                                    <i class="fa-solid fa-user-large-slash text-danger"></i>
                                </c:if>
                            </td>

                            <sec:authorize access="hasAuthority('ADMIN')">
                                <td class="d-flex">
                                    <c:if test="${user.account.userId != user.userId}">
                                        <a class="user-edit" href="javascript:;" 
                                           onclick="getUserId(${user.userId})" 
                                           data-bs-toggle="modal" data-bs-target="#myModalAccount">
                                            <i class="fa-solid fa-user-check text-success" 
                                               data-bs-toggle="tooltip" title="Tạo tài khoản"></i>
                                        </a>
                                    </c:if>

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

<!-- The Modal THÊM NHÂN VIÊN -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content employee">
            <c:url value="/admin/employee-management" var="action" />
            <form:form action="${action}" modelAttribute="emp" 
                       method="post" enctype="multipart/form-data">
                <!--Modal Header--> 
                <div class="modal-header">
                    <h2 class="modal-title text-primary">
                        <i class="fa-solid fa-user-plus"></i>
                        Thêm nhân viên
                    </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!--Modal body--> 
                <div class="modal-body user-employee">
                    
                    <div class="left">
                        <div class="form-group">
                            <label for="nameId">
                                <spring:message code="user.name" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <form:input path="name" id="nameId" 
                                        cssClass="form-control" placeholder="Nhập họ và tên..."/>
                            <form:errors path="name" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label for="identityCardId">
                                <spring:message code="user.identityCard" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <form:input type="number" path="identityCard" id="identityCardId" 
                                        cssClass="form-control" placeholder="Nhập CMND/CCCD..."/>
                            <form:errors path="identityCard" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label for="dateOfBirthId">
                                <spring:message code="user.dateOfBirth" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <form:input type="date" path="dateOfBirth" id="dateOfBirthId" cssClass="form-control" />
                        </div>

                        <div class="form-group select">
                            <label for="sexId">
                                <spring:message code="user.sex" />
                            </label>
                            <div class="selected">
                                <form:select class="form-select" path="sex" id="sexId">
                                    <option value="NAM">NAM</option>
                                    <option value="NỮ">NỮ</option>
                                </form:select>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="form-group">
                            <label for="emailId">
                                <spring:message code="user.email" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <form:input type="email" path="email" id="emailId" 
                                        cssClass="form-control" placeholder="Nhập địa chỉ email..."/>
                            <form:errors path="email" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label for="phoneId">
                                <spring:message code="user.phone" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <form:input type="number" path="phone" id="phoneId" 
                                        cssClass="form-control" placeholder="Nhập số điện thoại..."/>
                            <form:errors path="phone" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label for="positionId">
                                <spring:message code="user.position" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <form:input path="position" id="positionId" 
                                        cssClass="form-control" placeholder="Nhập chức vụ..."/>
                            <%--<form:errors path="position" cssClass="text-danger" />--%>
                        </div>

                        <div class="form-group select">
                            <label for="userRoleId">
                                <spring:message code="user.userRole" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <div class="selected">
                                <form:select class="form-select" path="userRole" id="userRoleId">
                                    <option value="ADMIN">ADMIN</option>
                                    <option value="EMPLOYEE">EMPLOYEE</option>
                                </form:select>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Modal footer--> 
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Thêm</button>
                    <button type="reset" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- The Modal TẠO TÀI KHOẢN-->
<div class="modal" id="myModalAccount">
    <div class="modal-dialog">
        <div class="modal-content">
            <c:url value="/admin/employee-management" var="actionAccount" />
            <form:form action="${actionAccount}" modelAttribute="accountEmp" 
                       method="post" enctype="multipart/form-data">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title text-primary">
                        <i class="fa-solid fa-user-plus"></i>
                        Thêm tài khoản
                    </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>



                <!-- Modal body -->
                <div class="modal-body wedding">
                    <div class="form-group">
                        <label for="userId">Mã</label>
                        <form:input id="userId" path="userId" readonly="true" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="username">
                            <spring:message code="user.username" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input path="username" name="username" id="username" 
                                    cssClass="form-control" placeholder="Nhập tên tài khoản..."/>
                    </div>

                    <div class="form-group">
                        <label for="password">
                            <spring:message code="user.password" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input path="password" type="password" name="password" id="password" 
                                    cssClass="form-control" placeholder="Nhập mật khẩu..."/>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">
                            <spring:message code="user.confirmPassword" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input path="confirmPassword" name="confirmPassword" type="password"
                                    id="confirmPassword" cssClass="form-control" 
                                    placeholder="Nhập mật khẩu xác nhận..."
                                    data-bs-toggle="tooltip" data-bs-placement="right" title="Bạn phải nhập mật khẩu xác nhận!"/>
                    </div>
                    <div class="form-group">
                        <label for="avt">
                            <spring:message code="user.avatar" />
                            <span class="text-danger">(*)</span>
                        </label>
                        <form:input path="avt" class="form-control" type="file" id="upload_avatar"/>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" style="width: 150px;">Tạo tài khoản</button>
                    <button type="reset" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
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