<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-danger">SẢNH CƯỚI</h1>

<c:url value="/weddings" var="action" />
<div class="container">
    <form action="${action}" class="d-flex" style="width: 100%; height: 50px">
        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa để tìm...">
        <input class="form-control me-2" type="text" name="fromPrice" placeholder="Nhập giá để tìm...">
        <input class="form-control me-2" type="text" name="toPrice" placeholder="Nhập giá để tìm...">
        <button type="submit" class="btn btn-primary" type="button" style="width: 300px; height: 50px">Tìm kiếm</button>
    </form>
</div>

<c:if test="${weddinghall.size() == 0}">
    <p><em>HIỆN TẠI KHÔNG CÓ SẢNH CƯỚI NÀO!!</em></p>
</c:if>

<div class="container">
    <div class="row">
        <c:forEach items="${weddinghall}" var="w">
            <c:if test="${w.active == true}">
                <div class="col-md-4 col-xs-12" style="padding: 5px;">
                    <div class="card Wd">
                        <img class="card-img-top" class="img-thumbnail card-img-top img-fluid" src="${w.image}" alt="Card image" style="width: auto; height: 200px;object-fit: cover;">
                        <div class="card-body">
                            <h4 class="card-title">${w.name}</h4>
                            <p class="card-text">
                                <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${w.price}" /> VND
                            </p>
                            <a href="<c:url value="/wedding/${w.weddinghallId}" />" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<ul class="pagination justify-content-end">
    <c:forEach begin="1" end="${Math.ceil(weddingCounter/9)}" var="i">
        <c:url value="/weddings" var="c">
            <c:param value="${i}" name="page" />
        </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
</ul>