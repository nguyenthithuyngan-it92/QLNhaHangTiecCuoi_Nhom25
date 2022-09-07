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
<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>Mã tiệc cưới</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${quarterStats}" var="r">
                <tr>
                    <td>${r[0]}</td>
                    <td>${r[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${r[2]}" maxFractionDigits="3" /> VND
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-6 col-xs-12">
        <c:url value="/admin/quarterStats" var="action" />
        <form action="${action}">
            <div class="mb-3 mt-3">
                <select class="form-control" name="quarter">
                    <c:forEach begin="1" end="4" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
            </div>
            <button type="submit" class="btn btn-primary">Lộc dữ liệu</button>
        </form>
        <canvas id="myChart3"></canvas>
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