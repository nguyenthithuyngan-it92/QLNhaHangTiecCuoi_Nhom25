<%-- 
    Document   : monthStats
    Created on : Sep 6, 2022, 9:11:36 PM
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info">THỐNG KÊ DOANH THU THEO THÁNG</h1>
<br><br>

<c:url value="/admin/monthStats" var="action" />
<form action="${action}" class="d-flex searchStats">
    <select class="form-control" name="month">
        <option selected disabled>Chọn tháng</option>
        <c:forEach begin="1" end="12" var="i">
            <option value="${i}">${i}</option>
        </c:forEach>
    </select>
    <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
    <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>

</form>

<div class="row" style="margin-top: 20px;">
    <div class="col-md-5 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BẢNG DOANH THU THEO THÁNG
            </span>
            <b></b>
        </h2>
        <table class="table stats">
            <tr>
                <th class="id">Mã</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>

            <c:forEach items="${monthStats}" var="m">
                <tr>
                    <td>${m[0]}</td>
                    <td>${m[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${m[2]}" maxFractionDigits="3" /> VNĐ
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>

    <div class="col-md-7 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BIỂU ĐỒ DOANH THU THEO THÁNG
            </span>
            <b></b>
        </h2>
        <div class="canvasStats">
            <canvas id="myChart2"></canvas>
        </div> 
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];
        let msg = document.getElementById('msg');

    <c:forEach items="${monthStats}" var="m">
        data.push(${m[2]});
        labels.push('${m[0]}-${m[1]}');
    </c:forEach>

                monthStats(labels, data);
            }
</script>