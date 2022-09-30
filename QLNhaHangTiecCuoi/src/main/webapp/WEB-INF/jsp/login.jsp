<%-- 
    Document   : login
    Created on : 6 thg 8, 2022, 10:30:36
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container login">
    <c:url value="/login" var="action" />
    <h1 class="text-center text-success text-uppercase">
        <spring:message code="user.login" />
    </h1>


    <c:if test="${param.error != null}">
        <div class="alert alert-danger">
            <spring:message code="user.login.error1" />
        </div>
    </c:if>
    <c:if test="${param.accessDenied != null}">
        <div class="alert alert-danger">
            <spring:message code="user.login.error2" />
        </div>
    </c:if>
    <form:form action="${action}" modelAttribute="account" method="POST" >
        <div class="form-group">
            <label for="username">
                <spring:message code="user.username" />
            </label>
            <form:input path="username" type="username" cssClass="form-control" id="username" 
                        placeholder="Nhập tên tài khoản..."/>
            <form:errors path="username" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label for="password">
                <spring:message code="user.password" />
            </label>
            <form:input path="password" type="password" cssClass="form-control" id="password" 
                        placeholder="Nhập mật khẩu..."/>
            <form:errors path="password" cssClass="text-danger" />
        </div>
        <form:button type="submit" class="btn btn-success mt-2 btnlogin">Đăng nhập</form:button>
    </form:form>
</div>