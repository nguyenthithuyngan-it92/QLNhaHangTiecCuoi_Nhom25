<%-- 
    Document   : detailWedding
    Created on : Aug 25, 2022, 2:13:23 PM
    Author     : ASUS
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <h2 class="section-title section-title-center">
        <b></b>
        <span class="section-title-main" style="font-size:200%;color:rgb(210, 80, 0);">
            CHI TIẾT SẢNH CƯỚI
        </span>
        <b></b>
    </h2>

    <div class="row">
        <div class="col-md-5 imgWedding">
            <img src="${weddinghall.image}" alt="${weddinghall.name}" class="img-thumbnail card-img-top img-fluid" />
        </div>
        <div class="col-md-6">
            <h1 class="wdname">${weddinghall.name}</h1>
            <div class="d-flex" style="margin: auto;">
                <p style="margin-right: 10px;">Giá sảnh <h4 class="text-info wdHall" style="font-style: italic;">
                    <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                      value = "${weddinghall.price}" /> VNĐ</h4>
                </p>
            </div>
            <div class="d-flex" style="margin: auto;">
                <p style="margin-right: 10px;">Sức chứa tối đa <h4 class="text-info wdHall" style="font-style: italic;">
                    ${weddinghall.maxTable} bàn</h4>
                </p>
            </div>
            <div class="d-flex" style="margin: auto;">
                <p style="margin-right: 10px;">Mô tả 
                    <b style="font-size: 13px;"> ${weddinghall.description} </b>
                </p>
            </div>
            <div class="note" style="margin: auto;">
                <b class="text-warning notetitle"><i>Lưu ý trước khi đặt tiệc bạn cần</i></b>
                <div style="margin-left: 10px;"> + Tham khảo thêm các gói dịch vụ cưới <a href="<c:url value="/combo-services" />">tại đây!!</a></div> 
                <div style="margin-left: 10px;"> + Tham khảo thêm các món ăn của nhà hàng <a href="<c:url value="/foods" />">tại đây!!</a></div>     
                <div>
                    <a href="<c:url value="/wedding/${weddinghall.weddinghallId}/booking-wedding" />" 
                       class="btn btn-danger btnOrder" onclick="#">Đặt tiệc</a>
                </div>
            </div>

        </div>
    </div>
    <br><br>
    <!--PHẦN BÌNH LUẬN - PHẢN HỒI-->
    <h2 class="section-title section-title-center">
        <b></b>
        <span class="section-title-main" style="font-size:100%;color:rgb(210, 80, 0);">
            PHẦN BÌNH LUẬN - PHẢN HỒI
        </span>
        <b></b>
    </h2>
    <c:url value="/api/wedding/${weddinghall.weddinghallId}/feedbacks" var="endpoint" />
    <sec:authorize access="!isAuthenticated()">
        <strong>Vui lòng <a href="<c:url value="/login" />">đăng nhập</a> để phản hồi!!!</strong>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <div class="form-group">
            <textarea class="form-control feedback" placeholder="Nhập nội dung để phản hồi..." id="feedbackId"></textarea>
            <button class="btn btn-danger btn-feedback" onclick="addFeedback('${endpoint}', ${weddinghall.weddinghallId})">
                <i class="fas fa-comments" style="margin: 5px; vertical-align: middle;"></i>   Thêm phản hồi
            </button>
        </div>

    </sec:authorize>

    <h2 class="section-title3 section-title-center">
        <b></b>
        <span class="section-title-main" style="font-size:80%;color: #7A838B;">
            <i class="fas fa-comments" style="margin: 5px; vertical-align: middle;"></i> ${countFeedback} phản hồi
        </span>
        <b></b>
    </h2>
    <ul id="feedbacks" class="list-group list-feedback">

    </ul>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/wedding.js" />"></script>
<script>
                window.onload = function () {
                    loadFeedback('${endpoint}');
                }
</script>

<div>
    <ul class="pagination justify-content-center">
        <c:forEach begin="1" end="${Math.ceil(feedbackCounter/max)}" var="i">
            <c:url value="/wedding/${weddinghallId}" var="path">
                <c:param value="${i}" name="page"  />
            </c:url>
            <li class="page-item"><a  class="page-link" href="${path}">${i}</a></li>
            </c:forEach>
    </ul>
</div>
