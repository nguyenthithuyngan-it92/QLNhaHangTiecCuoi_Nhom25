<%-- 
    Document   : foods
    Created on : Aug 25, 2022, 1:52:36 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-danger">MÓN ĂN</h1>

<c:url value="/foods" var="action" />
<div class="container">
    <form action="${action}" class="d-flex" style="width: 100%; height: 50px">
        <div class="dropdown" style="margin-right: 10px;">
            <button type="button" class="btn btn-primary dropdown-toggle form-control me-2" style="height: 50px;" data-bs-toggle="dropdown">
                Chọn danh mục
            </button>
            <ul class="dropdown-menu">
                <c:forEach items="${categories}" var="cate">
                    <c:url value="/foods" var="cUrl">
                        <c:param name="cateID" value="${cate.categoryId}" />
                    </c:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${cUrl}"">${cate.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <input class="form-control me-2" type="text" name="kw" value="" placeholder="Nhập từ khóa để tìm...">
        <input class="form-control me-2" type="text" name="fromPrice" value="" placeholder="Món giá tối thiểu từ...">
        <input class="form-control me-2" type="text" name="toPrice" value="" placeholder="Món giá tối đa đến...">
        <button type="submit" class="btn btn-primary" type="button" style="width: 40%; height: 50px">Tìm kiếm</button>
    </form>
</div>

<c:if test="${food.size() == 0}">
    <p><em>KHÔNG CÓ MÓN ĂN NÀO</em></p>
</c:if>

<div class="container">
    <div class="row">
        <c:forEach items="${food}" var="f">
            <div class="col-md-4 col-xs-12" style="padding: 5px;">
                <div class="card">
                    <img class="card-img-top" class="img-thumbnail card-img-top img-fluid" src="${f.image}" alt="Card image" style="width: auto; height: 225px; object-fit: cover;">
                    <div class="card-body">
                        <h4 class="card-title">${f.name}</h4>
                        <p class="card-text">
                            <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${f.price}" /> VND
                        </p>
                        <a href="<c:url value="/food/${f.foodId}" />" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<ul class="pagination justify-content-end">
    <c:forEach begin="1" end="${Math.ceil(foodCounter/9)}" var="i">
        <c:url value="/foods" var="c">
            <c:param value="${i}" name="page" />
        </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
</ul>

