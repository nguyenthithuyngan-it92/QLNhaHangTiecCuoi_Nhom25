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
        <c:if test="${!orders.isEmpty() || orders != null}">
            <table class="table orders">
                <thead class="table-warning">
                    <tr class="text-uppercase text-center">
                        <th class="min">Mã HĐ</th>
                        <th class="name">Tên KH</th>
                        <th class="name">Tiệc cưới</th>
                        <th>Ngày tạo</th>
                        <th>Ngày tổ chức tiệc cưới</th>
                        <th class="min">Số bàn</th>
                        <th>Tổng tiền</th>
                        <th>Phương thức thanh toán</th>
                        <th hidden="true">Trạng thái</th>
                        <th class="min">Trạng thái</th>
                        <th style="min-width: 200px;"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orders}" var="o">
                        <c:if test="${o.status == 'false'}">
                            <tr>
                                <td id="orderId">${o.orderId}</td>
                                <td>${o.userId.name}</td>
                                <td>${o.weddingId.name}</td>

                                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.createdDate}"/></td>
                                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.partyDate}"/></td>

                                <td>${o.quantityTable}</td>

                                <td id="totalPrice${o.orderId}"><fmt:formatNumber type="number" maxFractionDigits="3" 
                                                  value="${o.totalPrice}" />  VNĐ
                                </td>
                                <td>${o.paymentmethodsId.payments}</td>
                                <td id="status${o.orderId}" hidden="true">${o.status}</td>
                                <!--status-->
                                <td> 
                                    <!--đã thanh toán-->
                                    <c:if test="${o.status == true}">
                                        <i class="fa-solid fa-circle-xmark text-danger"></i>
                                    </c:if>
                                    <!--chưa thanh toán-->
                                    <c:if test="${o.status == false}">
                                        <i class="fa-solid fa-circle-check text-success"></i>
                                    </c:if>
                                </td>
                                <td>
                                    <button type="button" onclick="confirmPay(${o.orderId})" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                                        <a class="button-pay" href="javascript:;" >Xác nhận thanh toán</a>
                                    </button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${orders.isEmpty() || orders == null}">
            <h1 class="text-danger">Chưa có tiệc cưới nào chưa thanh toán.</h1>
        </c:if>
    </div>
</div>

<!--TABLE ORDERS ĐÃ THANH TOÁN-->
<div class="main-table">
    <div class="main-title">
        <h2 class="text-uppercase text-center text-success">DANH SÁCH HÓA ĐƠN ĐÃ THANH TOÁN</h2>
    </div>
    <div class="user-table">
        <c:if test="${!orders.isEmpty() || orders != null}">
        <table class="table orders">
            <thead class="table-success">
                <tr class="text-uppercase text-center">
                    <th class="min">Mã HĐ</th>
                    <th class="name">Tên KH</th>
                    <th class="name">Tiệc cưới</th>
                    <th>Ngày tạo</th>
                    <th>Ngày thanh toán</th>
                    <th>Ngày tổ chức tiệc cưới</th>
                    <th class="min">Số bàn</th>
                    <th>Tổng tiền</th>
                    <th>Phương thức thanh toán</th>
                    <th class="min">Trạng thái</th>
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
                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.paymentDate}"/></td>
                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.partyDate}"/></td>

                            <td>${o.quantityTable}</td>

                            <td><fmt:formatNumber type="number" maxFractionDigits="3" 
                                              value="${o.totalPrice}" />  VNĐ
                            </td>
                            <td>${o.paymentmethodsId.payments}</td>
                            <!--status-->
                            <td> 
                                <!--đã thanh toán-->
                                <c:if test="${o.status == true}">
                                    <i class="fa-solid fa-circle-xmark text-danger"></i>
                                </c:if>
                                <!--chưa thanh toán-->
                                <c:if test="${o.status == false}">
                                    <i class="fa-solid fa-circle-check text-success"></i>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
        <c:if test="${orders.isEmpty() || orders == null }">
            <h1 class="text-danger">Chưa có tiệc cưới nào đã thanh toán.</h1>
        </c:if>
    </div>
</div>
<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h2 class="modal-title text-primary"><i class="fa-solid fa-money-check"></i> XÁC NHẬN THANH TOÁN</h2>
                <button type="button" class="btn-close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="font-size: 15px;">
                Bạn xác nhận thanh toán cho tiệc cưới có mã hóa đơn <strong id="inputOrderId"></strong> đã thanh toán với tổng số tiền là <strong class="text-info" style="font-size: 20px" id="inputTotalPrice"></strong>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button id="payWedding" class="btn btn-primary" type="button" style="width:250px; height: 40px; font-size:16px;">
                    <span class="spinner-confirm-wd spinner-border spinner-border-sm visually-hidden" role="status" aria-hidden="true"></span>
                        XÁC NHẬN THANH TOÁN
                </button>
                <button type="reset" class="btn btn-danger" data-dismiss="modal" style="height: 40px; font-size:16px;">ĐÓNG</button>
            </div>
        </div>
    </div>
</div>