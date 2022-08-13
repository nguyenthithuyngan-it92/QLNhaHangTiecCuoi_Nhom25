<%-- 
    Document   : index
    Created on : 20 thg 7, 2022, 15:53:32
    Author     : LENOVO
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form method="get" class="d-flex">
    <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa để tìm...">
    <button type="submit" class="btn btn-primary" type="button">Tìm kiếm</button>
</form>

<section class="page-section clearfix">
    <div class="container">
        <div class="intro">
            <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src=<c:url value="/img/Backround1.jpg" /> alt="">
            <div class="intro-text left-0 text-center bg-faded p-5 rounded">
                <h2 class="section-heading mb-4">
                    <span class="section-heading-upper">Fresh Coffee</span>
                    <span class="section-heading-lower">Worth Drinking</span>
                </h2>
                <p class="mb-3">Every cup of our quality artisan coffee starts with locally sourced, hand picked ingredients. Once you try it, our coffee will be a blissful addition to your everyday morning routine - we guarantee it!</p>
                <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="#!">Visit Us Today!</a></div>
            </div>
        </div>
    </div>
</section>

<section class="page-section cta">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 mx-auto">
                <div class="cta-inner bg-faded text-center rounded">
                    <h2 class="section-heading mb-4">
                        <span class="section-heading-upper">Our Promise</span>
                        <span class="section-heading-lower">To You</span>
                    </h2>
                    <p class="mb-0">When you walk into our shop to start your day, we are dedicated to providing you with friendly service, a welcoming atmosphere, and above all else, excellent products made with the highest quality ingredients. If you are not satisfied, please let us know and we will do whatever we can to make things right!</p>
                </div>
            </div>
        </div>
    </div>
</section>


<c:if test="${currentUser != null}">
    ${currentUser.username}
</c:if>

