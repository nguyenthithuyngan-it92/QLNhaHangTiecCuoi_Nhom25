<%-- 
    Document   : booking_wedding
    Created on : 27 thg 8, 2022, 15:06:19
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
    <sec:authorize access="!isAuthenticated()">
        <strong class="text-danger">Bạn vui lòng <a href="<c:url value="/login" />">đăng nhập</a> để thực hiện đặt tiệc!!!</strong>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <div class="booking">
            <h1 class="text-primary text-center text-uppercase">ĐẶT TIỆC</h1>
            <c:choose>
                <c:when test="${currentUser.user.userRole == 'CUSTOMER'}">
                    <div class="option">
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bookingOnline" name="optradio" value="online" checked>Khách hàng đặt trực tuyến
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bookingOffline" name="optradio" value="offline" disabled="true">Nhân viên đặt hộ khách hàng
                        </div>
                    </div>
                    <div class="info-user needs-validation" data-userId="${currentUser.user.userId}" id="${currentUser.user.userRole == 'CUSTOMER' ? 'has-user-info' : ''}" novalidate>
                        <h6>1. Thông tin khách hàng</h6>
                        <div class="left">
                            <div class="form-group">
                                <label for="name">
                                    <spring:message code="user.nameBooking" />
                                </label>
                                <input type="text" name="name" class="form-control" id="name" 
                                       value="${currentUser.user.name}" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label for="identityCard">
                                    <spring:message code="user.identityCard" />
                                </label>
                                <input type="number" name="identityCard" id="identityCard" class="form-control" 
                                       value="${currentUser.user.identityCard}" readonly="true"/>
                                <div  id="invalid-feedback-cmnd" class="invalid-feedback">
                                    <spring:message code="notNullMsg" />
                                </div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="form-group">
                                <label for="phone">
                                    <spring:message code="user.phone" />
                                </label>
                                <input name="phone" required type="number" id="phone" class="form-control" 
                                       value="${currentUser.user.phone}" readonly="true"/>
                                <div id="invalid-feedback-phone" class="invalid-feedback">
                                    <spring:message code="notNullMsg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    <spring:message code="user.email" />
                                </label>
                                <input type="email" name="email" id="email" class="form-control" 
                                       value="${currentUser.user.email}" readonly="true"/>
                                <div id="invalid-feedback-mail" class="invalid-feedback">
                                    <spring:message code="notNullMsg" />
                                </div>
                            </div>                        
                        </div>
                    </div>

                    <hr>   
                    <div class="info-wedding" data-weddinghallId="${weddinghall.weddinghallId}">
                        <h6>2. Thông tin tiệc cưới</h6>
                        <!--THÔNG TIN-->
                        <div class="left">
                            <div class="form-group">
                                <label for="wdhall">
                                    <spring:message code="wdhall.name" />
                                </label>
                                <input type="text" name="weddinghallId" id="weddinghallId" class="form-control" 
                                       value="${weddinghall.name}" readonly="true"/>
                            </div>

                            <div class="form-group">
                                <label for="wdservices">
                                    <spring:message code="service.name" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <div class="selected">
                                    <select class="form-select" name="weddingservicesId" id="weddingservicesId" aria-label="Default select example">
                                        <option data-price="0" selected>Chọn gói dịch vụ</option>
                                        <c:forEach items="${services}" var="s">
                                            <c:if test="${s.active == true}">
                                                <option id="service${s.weddingservicesId}" 
                                                        value="${s.weddingservicesId}" data-price="${s.price}">
                                                    ${s.name} - <fmt:formatNumber type="number" maxFractionDigits="3" 
                                                                                  value="${s.price}" />  VNĐ 
                                                </option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="wdservices">Ca tổ chức tiệc
                                    <span class="text-danger">(*)</span>
                                </label>
                                <div class="selected">
                                    <select class="form-select" name="shiftId" id="shiftId" aria-label="Default select example">
                                        <option data-shift="0" selected>Chọn ca tổ chức tiệc</option>
                                        <c:forEach items="${shifts}" var="sh">
                                            <option id="service${sh.shiftId}" data-shift="${sh.coefficient}" value="${sh.shiftId}"> ${sh.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <!--GIÁ TIỀN-->
                        <div class="right">
                            <div class="form-group">
                                <label for="wdhall">
                                    <spring:message code="wdhall.price" />
                                </label>
                                <input type="text" name="weddinghallPrice" class="form-control" 
                                       value="<fmt:formatNumber type="number" maxFractionDigits="3" 
                                                         value="${weddinghall.price}" /> VNĐ" readonly="true"/>
                                <input type="text" name="weddinghallPrice" id="weddinghallPrice" class="form-control" 
                                       value="${weddinghall.price}" hidden="true"/>
                            </div>

                            <div class="form-group">
                                <label for="wdservices">
                                    <spring:message code="service.price" />
                                </label>
                                <input type="text" id="weddingservicesPricePreview" class="form-control" readonly="true"/>
                                <input type="text" name="weddingservicesPrice" id="weddingservicesPrice" class="form-control" 
                                       value="" hidden="true"/>
                            </div>

                            <div class="form-group">
                                <label for="shiftId">Hệ số theo ca
                                </label>
                                <input type="text" id="shiftPreviewData" class="form-control" readonly="true"/>

                            </div> 
                        </div>
                    </div>

                    <div class="formOrders">
                        <input name="weddinghallId" class="form-control" id="weddinghallId" 
                               value="${weddinghall.weddinghallId}" hidden="true"/>
                        <div class="d-flex">
                            <div class="form-group">
                                <label for="partyDateId">
                                    <spring:message code="od.partyDate" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="date" required path="partyDate" id="partyDateId" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label for="quantityTable">
                                    <spring:message code="od.quantityTable" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="number" required name="quantityTable" 
                                       data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Số bàn tối đa không vượt quá ${weddinghall.maxTable}!" 
                                       max="${weddinghall.maxTable}" id="quantityTableId" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group payments">
                            <label for="paymentmethodsId" class="form-label">
                                <spring:message code="od.paymentMethod" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <div class="option">
                                <c:forEach items="${paymentmethod}" var="p">
                                    <div class="form-check">
                                        <input type="radio" name="paymentmethodsId" class="form-check-input paymentmethodsId" 
                                               id="paymentmethodsId" data-discount="${p.discount}" value="${p.paymentmethodsId}"/>
                                        <label class="form-check-label">${p.payments} - Hệ số ${p.discount}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <hr>  

                    <div class="info-wedding" data-weddinghallId="${weddinghall.weddinghallId}">
                        <h6>3. Chọn món ăn theo danh mục</h6>
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered tbFoodOd">
                                <thead>
                                    <tr class="headerCate">
                                        <c:forEach items="${categories}" var="c">
                                            <th>${c.name}   (Chọn tối đa ${c.countFood})</th>
                                            </c:forEach>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <c:forEach items="${categories}" var="c">
                                            <td>
                                                <div class="wrapper-foods wrapper-foods-${c.categoryId}"
                                                     idCate="${c.categoryId}" name-data="${c.name}" maxcheckfood="${c.countFood}">
                                                    <div class="d-flex justify-content-center spinner-food" style="margin-top: 10px;">
                                                        <div class="spinner-border text-info" role="status">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            </div>
                                        </c:forEach>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="form-group mt-3">
                            <span class="ml-auto">Tổng tiền: <strong class="text-primary" style="font-size: 20px;" id="total-price-wedding">0</strong></span>
                        </div>
                    </div>
                    <div class="form-group mt-3 ">
                        <button id="submit-form-wd-user" class="btn btn-primary bg-primary btnBooking" type="button">
                            <span class="spinner-wd-user spinner-border spinner-border-sm visually-hidden" role="status" aria-hidden="true"></span>
                            XÁC NHẬN ĐẶT TIỆC
                        </button>
                        <button type="reset" class="btn btn-danger"><a href="<c:url value="/weddings" />" style="text-decoration: none; color: white;">THOÁT</a></button>
                    </div>
                </c:when>

                <c:when test="${currentUser.user.userRole == 'EMPLOYEE'}">
                    <div class="option">
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bookingOnline2" name="optradio" value="online" disabled="true">Khách hàng đặt trực tuyến
                            <label class="form-check-label" for="bookingOnline2"></label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="bookingOffline2" name="optradio" value="offline" checked>Nhân viên đặt hộ khách hàng
                            <label class="form-check-label" for="bookingOffline2"></label>
                        </div>
                    </div>

                    <div class="info-user">
                        <h6>1. Thông tin khách hàng</h6>
                        <div class="left">
                            <div class="form-group">
                                <label for="name">
                                    <spring:message code="user.nameBooking" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="text" name="name" class="form-control" id="name" placeholder="Nhập họ và tên..."/>
                            </div>
                            <div class="form-group">
                                <label for="identityCard">
                                    <spring:message code="user.identityCard" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="number" name="identityCard" id="identityCard" class="form-control" placeholder="Nhập số CMND/CCCD..."/>
                                <div  id="invalid-feedback-cmnd" class="invalid-feedback">
                                    <spring:message code="notNullMsg" />
                                </div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="form-group">
                                <label for="phone">
                                    <spring:message code="user.phone" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input name="phone" required type="number" id="phone" class="form-control" placeholder="Nhập số điện thoại..."/>
                                <div id="invalid-feedback-phone" class="invalid-feedback">
                                    <spring:message code="notNullMsg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    <spring:message code="user.email" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="email" name="email" id="email" class="form-control" placeholder="Nhập địa chỉ mail..."/>
                                <div id="invalid-feedback-mail" class="invalid-feedback">
                                    <spring:message code="notNullMsg" />
                                </div>
                            </div>           
                        </div>
                    </div>

                    <hr>   
                    <div class="info-wedding" data-weddinghallId="${weddinghall.weddinghallId}">
                        <h6>2. Thông tin tiệc cưới</h6>
                        <!--THÔNG TIN-->
                        <div class="left">
                            <div class="form-group">
                                <label for="wdhall">
                                    <spring:message code="wdhall.name" />
                                </label>
                                <input type="text" name="weddinghallId" id="weddinghallId" class="form-control" 
                                       value="${weddinghall.name}" readonly="true"/>
                            </div>

                            <div class="form-group">
                                <label for="wdservices">
                                    <spring:message code="service.name" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <div class="selected">
                                    <select class="form-select" name="weddingservicesId" id="weddingservicesId" aria-label="Default select example">
                                        <option data-price="0" selected>Chọn gói dịch vụ</option>
                                        <c:forEach items="${services}" var="s">
                                            <c:if test="${s.active == true}">
                                                <option id="service${s.weddingservicesId}" 
                                                        value="${s.weddingservicesId}" data-price="${s.price}">
                                                    ${s.name} - <fmt:formatNumber type="number" maxFractionDigits="3" 
                                                                                  value="${s.price}" />  VNĐ 
                                                </option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="wdservices">Ca tổ chức tiệc
                                    <span class="text-danger">(*)</span>
                                </label>
                                <div class="selected">
                                    <select class="form-select" name="shiftId" id="shiftId" aria-label="Default select example">
                                        <option data-shift="0" selected>Chọn ca tổ chức tiệc</option>
                                        <c:forEach items="${shifts}" var="sh">
                                            <option id="service${sh.shiftId}" data-shift="${sh.coefficient}" value="${sh.shiftId}"> ${sh.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <!--GIÁ TIỀN-->
                        <div class="right">
                            <div class="form-group">
                                <label for="wdhall">
                                    <spring:message code="wdhall.price" />
                                </label>
                                <input type="text" name="weddinghallPrice" class="form-control" 
                                       value="<fmt:formatNumber type="number" maxFractionDigits="3" 
                                                         value="${weddinghall.price}" /> VNĐ" readonly="true"/>
                                <input type="text" name="weddinghallPrice" id="weddinghallPrice" class="form-control" 
                                       value="${weddinghall.price}" hidden="true"/>
                            </div>

                            <div class="form-group">
                                <label for="wdservices">
                                    <spring:message code="service.price" />
                                </label>
                                <input type="text" id="weddingservicesPricePreview" class="form-control" readonly="true"/>
                                <input type="text" name="weddingservicesPrice" id="weddingservicesPrice" class="form-control" 
                                       value="" hidden="true"/>
                            </div>

                            <div class="form-group">
                                <label for="shiftId">Hệ số theo ca
                                </label>
                                <input type="text" id="shiftPreviewData" class="form-control" readonly="true"/>
                            </div> 
                        </div>
                    </div>

                    <div class="formOrders">
                        <input name="weddinghallId" class="form-control" id="weddinghallId" 
                               value="${weddinghall.weddinghallId}" hidden="true"/>
                        <div class="d-flex">
                            <div class="form-group">
                                <label for="partyDateId">
                                    <spring:message code="od.partyDate" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="date" required path="partyDate" id="partyDateId" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label for="quantityTable">
                                    <spring:message code="od.quantityTable" />
                                    <span class="text-danger">(*)</span>
                                </label>
                                <input type="number" required name="quantityTable" 
                                       data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Số bàn tối đa không vượt quá ${weddinghall.maxTable}!" 
                                       max="${weddinghall.maxTable}" id="quantityTableId" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group payments">
                            <label for="paymentmethodsId" class="form-label">
                                <spring:message code="od.paymentMethod" />
                                <span class="text-danger">(*)</span>
                            </label>
                            <div class="option">
                                <c:forEach items="${paymentmethod}" var="p">
                                    <div class="form-check">
                                        <input type="radio" name="paymentmethodsId" class="form-check-input paymentmethodsId" 
                                               id="paymentmethodsId" data-discount="${p.discount}" value="${p.paymentmethodsId}"/>
                                        <label class="form-check-label">${p.payments} - Hệ số ${p.discount}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <hr>  

                    <div class="info-wedding" data-weddinghallId="${weddinghall.weddinghallId}">
                        <h6>3. Chọn món ăn theo danh mục</h6>
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered tbFoodOd">
                                <thead>
                                    <tr class="headerCate">
                                        <c:forEach items="${categories}" var="c">
                                            <th>${c.name}   (Chọn tối đa ${c.countFood})</th>
                                            </c:forEach>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <c:forEach items="${categories}" var="c">
                                            <td>
                                                <div class="wrapper-foods wrapper-foods-${c.categoryId}"
                                                     idCate="${c.categoryId}" name-data="${c.name}" maxcheckfood="${c.countFood}">
                                                    <div class="d-flex justify-content-center spinner-food" style="margin-top: 10px;">
                                                        <div class="spinner-border text-info" role="status">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            </div>
                                        </c:forEach>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="form-group mt-3">
                            <span class="ml-auto">Tổng tiền: <strong class="text-primary" style="font-size: 20px;" id="total-price-wedding">0</strong></span>
                        </div>
                    </div>
                    <div class="form-group mt-3 ">
                        <button id="submit-form-wd-user" class="btn btn-primary bg-primary btnBooking" type="button">
                            <span class="spinner-wd-user spinner-border spinner-border-sm visually-hidden" role="status" aria-hidden="true"></span>
                            XÁC NHẬN ĐẶT TIỆC
                        </button>
                    </div>
                </c:when>
                <c:when test="${currentUser.user.userRole == 'ADMIN'}">
                    <strong class="text-danger text-center">Bạn vui lòng đăng nhập với tài khoản nhân viên để thực hiện đặt tiệc!!! <a href="<c:url value="/logout" />">Đăng xuất tại đây!!</a></strong>
                </c:when>
            </c:choose>

        </div>
    </sec:authorize>
</div>
<script src="<c:url value="/js/booking.js"/>"></script>

<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>