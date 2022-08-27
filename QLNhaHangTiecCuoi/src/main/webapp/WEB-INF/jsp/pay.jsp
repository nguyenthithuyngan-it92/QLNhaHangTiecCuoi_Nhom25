<%-- 
    Document   : pay
    Created on : 24 thg 8, 2022, 19:46:32
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="searchPay">
    <form action="<c:url value="/admin/pay"/>" class="form-search d-flex">
        <div>
            <label>Ngày tạo hóa đơn</label>
            <input class="date" type="date" name="createdDate" value="null" id="createdDate">
        </div>
        <div>
            <label>Ngày tổ chức tiệc</label>
            <input class="date" type="date" name="partyDate" value="null">
        </div>

        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>

<!--TABLE ORDERS CHƯA THANH TOÁN-->
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-warning">DANH SÁCH HÓA ĐƠN CHƯA THANH TOÁN</h2>
    </div>
    <div class="user-table">
        <table class="table orders">
            <thead class="table-warning">
                <tr class="text-uppercase text-center">
                    <th class="min">Mã HĐ</th>
                    <th class="name">Tên KH</th>
                    <th>Tiệc cưới</th>
                    <th>Ngày tạo</th>
                    <th>Ngày tổ chức tiệc cưới</th>
                    <th class="min">Số bàn</th>
                    <th>Tổng tiền</th>
                    <th>Phương thức thanh toán</th>
                    <th class="min">Trạng thái</th>
                    <th style="min-width: 200px;"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orders}" var="o">
                    <c:if test="${o.status == 'true'}">
                        <tr>
                            <td>${o.orderId}</td>
                            <td>${o.userId.name}</td>
                            <td>${o.weddingId.name}</td>

                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.createdDate}"/></td>
                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.partyDate}"/></td>

                            <td>${o.quantityTable}</td>

                            <td><fmt:formatNumber type="number" maxFractionDigits="3" 
                                              value="${o.totalPrice}" />  VNĐ
                            </td>
                            <td>${o.paymentmethodsId.payments}</td>
                            <!--status-->
                            <td> 
                                <!--chưa thanh toán-->
                                <c:if test="${o.status == true}">
                                    <i class="fa-solid fa-circle-xmark text-danger"></i>
                                </c:if>
                                <!--đã thanh toán-->
                                <c:if test="${o.status == false}">
                                    <i class="fa-solid fa-circle-check text-success"></i>
                                </c:if>
                            </td>
                            <td>
                                <button type="button" class="btn btn-success">
                                    <a class="button-pay" href="javascript:;" onclick="">Xác nhận thanh toán</a>
                                </button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!--TABLE ORDERS ĐÃ THANH TOÁN-->
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-success">DANH SÁCH HÓA ĐƠN ĐÃ THANH TOÁN</h2>
    </div>
    <div class="user-table">
        <table class="table orders">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="min">Mã HĐ</th>
                    <th class="name">Tên KH</th>
                    <th>Tiệc cưới</th>
                    <th>Ngày tạo</th>
                    <th>Ngày tổ chức tiệc cưới</th>
                    <th class="min">Số bàn</th>
                    <th>Tổng tiền</th>
                    <th>Phương thức thanh toán</th>
                    <th class="min">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${orders}" var="o">
                    <c:if test="${o.status == 'false'}">
                        <tr>
                            <td>${o.orderId}</td>
                            <td>${o.userId.name}</td>
                            <td>${o.weddingId.name}</td>

                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.createdDate}"/></td>
                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.partyDate}"/></td>

                            <td>${o.quantityTable}</td>

                            <td><fmt:formatNumber type="number" maxFractionDigits="3" 
                                              value="${o.totalPrice}" />  VNĐ
                            </td>
                            <td>${o.paymentmethodsId.payments}</td>
                            <!--status-->
                            <td> 
                                <!--chưa thanh toán-->
                                <c:if test="${o.status == true}">
                                    <i class="fa-solid fa-circle-xmark text-danger"></i>
                                </c:if>
                                <!--đã thanh toán-->
                                <c:if test="${o.status == false}">
                                    <i class="fa-solid fa-circle-check text-success"></i>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
