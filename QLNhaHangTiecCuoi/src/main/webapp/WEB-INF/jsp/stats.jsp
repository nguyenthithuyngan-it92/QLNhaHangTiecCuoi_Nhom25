<%-- 
    Document   : statistical
    Created on : Aug 11, 2022, 11:00:45 PM
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info">THỐNG KÊ BÁO CÁO MẬT ĐỘ TIỆC CƯỚI</h1>
<br><br>
<c:url value="/admin/stats" var="action" />
<form action="${action}" class="d-flex searchStats" style="margin-left: 40%;">
    <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
    <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
</form>
<div class="row">
    <div class="col-md-5 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BẢNG THỐNG KÊ MẬT ĐỘ SẢNH CƯỚI
            </span>
            <b></b>
        </h2>
        <table class="table stats">
            <tr>
                <th class="id">Mã</th>
                <th>Tên tiệc cưới</th>
                <th>Số lượng</th>
            </tr>
            <c:forEach items="${densityStats}" var="d">
                <tr>
                    <td>${d[0]}</td>
                    <td>${d[1]}</td>
                    <td>${d[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BIỂU ĐỒ MẬT ĐỘ SẢNH CƯỚI
            </span>
            <b></b>
        </h2>
        <div class="canvasStats2">
            <canvas id="myChart"></canvas>
        </div>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];

    <c:forEach items="${densityStats}" var="d">
        data.push(${d[2]});
        labels.push('${d[1]}');
    </c:forEach>

        densityStats(labels, data);
    }
</script>