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
<div class="row">
    <div class="col-md-8 col-xs-12">
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
    <div class="col-md-4 col-xs-12">
        <c:url value="/admin/stats" var="action" />
        <form action="${action}" class="searchStats">
            <div class="mb-3">
                <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
            </div>
            <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
        </form>
    </div>
</div>
<div class="canvasStats">
    <canvas id="myChart"></canvas>
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