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
<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>Mã tiệc cưới</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${yearStats}" var="y">
                <tr>
                    <td>${y[0]}</td>
                    <td>${y[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${y[2]}" maxFractionDigits="3" /> VND
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-6 col-xs-12">
        <c:url value="/admin/yearStats" var="action" />
        <form action="${action}">
            <div class="mb-3">
                <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
            </div>
            <button type="submit" class="btn btn-primary">Lộc dữ liệu</button>
        </form>
        <canvas id="myChart4"></canvas>
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