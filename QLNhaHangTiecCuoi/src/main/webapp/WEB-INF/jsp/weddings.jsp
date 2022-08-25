<%-- 
    Document   : weddings
    Created on : Aug 25, 2022, 2:12:27 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-info">TIỆC CƯỚI</h1>

<c:url value="/weddings" var="action" />
<div class="container">
    <form action="${action}" class="d-flex" style="width: 1100px; height: 50px">
        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa để tìm...">
        <button type="submit" class="btn btn-primary" type="button" style="width: 100px; height: 50px">Tìm kiếm</button>
    </form>
</div>

<c:if test="${wedding.size() == 0}">
    <p><em>KHÔNG CÓ SẢNH CƯỚI NÀO</em></p>
</c:if>

<div class="container">
    <div class="row">
        <c:forEach items="${wedding}" var="w">
            <div class="col-md-3 col-xs-12" style="padding: 5px;">
                <div class="card">
                    <img class="card-img-top" class="img-thumbnail card-img-top img-fluid" src="${w.weddinghallId.image}" alt="Card image" style="width: auto; height: 200px">
                    <div class="card-body">
                        <h4 class="card-title">${w.name}</h4>
                        <p class="card-text">
                            <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${w.weddinghallId.price}" /> VND
                        </p>
                        <a href="<c:url value="/wedding/${w.weddingId}" />" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<ul class="pagination justify-content-end">
        <c:forEach begin="1" end="${Math.ceil(weddingCounter/8)}" var="i">
            <c:url value="/weddings" var="c">
                <c:param value="${i}" name="page" />
            </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
</ul>