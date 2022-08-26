<%-- 
    Document   : detailFood
    Created on : Aug 25, 2022, 1:53:03 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1 class="text-center text-danger">CHI TIẾT MÓN ĂN</h1>

<div class="row">
    <div class="col-md-5">
        <img src="${food.image}" alt="${food.name}" class="img-thumbnail card-img-top img-fluid" style="width: auto; height: 200px" />
    </div>
    <div class="col-md-7">
        <h1>${food.name}</h1>
        <h3><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${food.price}" /> VND</h3>
    </div>
</div>
