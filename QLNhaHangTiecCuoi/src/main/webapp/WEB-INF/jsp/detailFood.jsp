<%-- 
    Document   : detailFood
    Created on : Aug 25, 2022, 1:53:03 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1 class="text-center text-danger titleWd">CHI TIẾT MÓN ĂN</h1>

<div class="row">
    <div class="col-md-5 imgWedding">
        <img src="${food.image}" alt="${food.name}" class="img-thumbnail card-img-top img-fluid" style="width: auto; height: 200px" />
    </div>
    <div class="col-md-6">
        <h1 class="wdname" style="margin-bottom: 20px;">${food.name}</h1>
        <div class="d-flex" style="margin: auto;">
            <p style="margin-right: 10px;">Giá món ăn/bàn <h4 class="text-info wdHall" style="font-style: italic;">
                <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                  value = "${food.price}" /> VNĐ</h4>
            </p>
        </div>
        
        <div class="d-flex" style="margin: auto;">
            <p style="margin-right: 10px;">Thuộc danh mục món
            <h5 class="wdHall" style="padding: 0px;"> ${food.categoryId.name}</h5>
            </p>
        </div>
    </div>
</div>
