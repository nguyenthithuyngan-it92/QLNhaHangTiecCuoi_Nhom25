<%-- 
    Document   : yearStats
    Created on : Sep 6, 2022, 9:21:02 PM
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info">THỐNG KÊ DOANH THU THEO NĂM</h1>
<br><br>
<c:url value="/admin/yearStats" var="action" />
<form action="${action}" class="d-flex searchStats" style="margin-left: 40%;">
    <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
    <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
</form>
<div class="row">
    <div class="col-md-5 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BẢNG THỐNG KÊ DOANH THU THEO NĂM
            </span>
            <b></b>
        </h2>
        <table class="table stats">
            <tr>
                <th class="id">Mã</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${yearStats}" var="y">
                <tr>
                    <td>${y[0]}</td>
                    <td>${y[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${y[2]}" maxFractionDigits="3" /> VNĐ
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BIỂU ĐỒ DOANH THU THEO NĂM
            </span>
            <b></b>
        </h2>
        <div class="canvasStats">
            <canvas id="myChart4"></canvas>
        </div>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];

    <c:forEach items="${yearStats}" var="y">
        data.push(${y[2]});
        labels.push('${y[1]}');
    </c:forEach>

        yearStats(labels, data);
    }
</script>