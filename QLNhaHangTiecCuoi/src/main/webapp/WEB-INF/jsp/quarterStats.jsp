<%-- 
    Document   : quarterStats
    Created on : Sep 6, 2022, 9:18:30 PM
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<h1 class="text-center text-info">THỐNG KÊ DOANH THU THEO QUÝ</h1>
<br><br>
<c:url value="/admin/quarterStats" var="action" />
<form action="${action}" class="d-flex searchStats">
    <select class="form-control" name="quarter">
        <option selected disabled>Chọn quý</option>
        <c:forEach begin="1" end="4" var="i">
            <option value="${i}">${i}</option>
        </c:forEach>
    </select>
    <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
    <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
</form>
<div class="row">
    <div class="col-md-5 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BẢNG DOANH THU THEO QUÝ
            </span>
            <b></b>
        </h2>
        <table class="table stats">
            <tr>
                <th class="id">Mã</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${quarterStats}" var="r">
                <tr>
                    <td>${r[0]}</td>
                    <td>${r[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${r[2]}" maxFractionDigits="3" /> VNĐ
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BIỂU ĐỒ DOANH THU THEO QUÝ
            </span>
            <b></b>
        </h2>
        <div class="canvasStats">
            <canvas id="myChart3"></canvas>
        </div>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];

    <c:forEach items="${quarterStats}" var="r">
        data.push(${r[2]});
        labels.push('${r[1]}');
    </c:forEach>

        quarterStats(labels, data);
    }
</script>