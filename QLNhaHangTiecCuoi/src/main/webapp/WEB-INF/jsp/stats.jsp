<%-- 
    Document   : statistical
    Created on : Aug 11, 2022, 11:00:45 PM
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="text-center text-danger">THỐNG KÊ</h1>
<br><br>
<div class="row">
    <div class="col-md-5 col-xs-12">
        <table class="table">
            <tr>
                <th>Mã tiệc cưới</th>
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
    <div class="col-md-5 col-xs-12">
        <c:url value="/admin/stats" var="action" />
        <form action="${action}">
            <div class="mb-3">
                <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
            </div>
            <button type="submit" class="btn btn-primary">Lộc dữ liệu</button>
        </form>
        <canvas id="myChart"></canvas>
    </div>
</div>

<div class="row">
    <div class="col-md-5 col-xs-12">
        <table class="table">
            <tr>
                <th>Mã tiệc cưới</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${monthStats}" var="m">
                <tr>
                    <td>${m[0]}</td>
                    <td>${m[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" value="${m[2]}" maxFractionDigits="3" /> VND
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-5 col-xs-12">
        <c:url value="/admin/stats" var="action" />
        <form action="${action}">
            <div class="mb-3 mt-3">
                <select class="form-control" name="month">
                    <c:forEach begin="1" end="12" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
            </div>
            <button type="submit" class="btn btn-primary">Lộc dữ liệu</button>
        </form>
        <canvas id="myChart2"></canvas>
    </div>
</div>
            
<div class="row">
    <div class="col-md-5 col-xs-12">
        <table class="table">
            <tr>
                <th>Mã tiệc cưới</th>
                <th>Tên tiệc cưới</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${revenueStats}" var="r">
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
    <div class="col-md-5 col-xs-12">
        <c:url value="/admin/stats" var="action" />
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

<div class="row">
    <div class="col-md-5 col-xs-12">
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
    <div class="col-md-5 col-xs-12">
        <c:url value="/admin/stats" var="action" />
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
        let data2 = [];
        let labels2 = [];
        let data3 = [];
        let labels3 = [];
        let data4 = [];
        let labels4 = [];
        
    <c:forEach items="${densityStats}" var="d">
            data.push(${d[2]});
            labels.push('${d[1]}');
    </c:forEach>

    <c:forEach items="${monthStats}" var="m">
        data2.push(${m[2]});
        labels2.push('${m[1]}');
    </c:forEach>

    <c:forEach items="${revenueStats}" var="r">
        data3.push(${r[2]});
        labels3.push('${r[1]}');
    </c:forEach>
        
    <c:forEach items="${yearStats}" var="y">
        data4.push(${y[2]});
        labels4.push('${y[1]}');
    </c:forEach>


        densityStats(labels, data);
        monthStats(labels2, data2);
        revenueStats(labels3, data3);
        yearStats(labels4, data4);
    }
</script>