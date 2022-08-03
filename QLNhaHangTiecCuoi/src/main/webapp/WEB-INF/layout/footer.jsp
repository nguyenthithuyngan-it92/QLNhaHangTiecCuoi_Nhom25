<%-- 
    Document   : footer
    Created on : 28 thg 7, 2022, 11:05:49
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="jumbotron">
    <h5>Nhà hàng tiệc cưới ... hân hạnh mang lại cho quý khách trải nghiệm tuyệt vời!!!</h5>
    <hr width="60%" color="gray" size="2"/>
    <div class="row contact">
        <div class="col-md-6">
            <p class="footer">THÔNG TIN LIÊN HỆ</p>
            <ul class="social">
                <li class="nav-item">
                    <img src="<c:url value="/img/iconcall.png" />" class="icon rounded" width="30" alt="Call" />
                    0123456789
                </li>
                <li class="nav-item">
                    <a href="#" target="_blank">
                        <img src="<c:url value="/img/iconfb.png" />" class="icon rounded" width="30 alt="Facebook" />
                        Facebook
                    </a>
                </li>
                <li class="nav-item">
                    <img src="<c:url value="/img/iconmap.png" />" class="icon rounded" width="30" alt="Address" />
                    371 Nguyễn Kiệm, Phường 3, Quận Gò Vấp, TP.HCM
                </li>
            </ul>
        </div>
        <div class="col-md-6">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.9308737755287!2d106.67647591425859!3d10.816602092294234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528e195f816b7%3A0xfb5c0101490d8870!2zMzcxIE5ndXnhu4VuIEtp4buHbSwgUGjGsOG7nW5nIDMsIEfDsiBW4bqlcCwgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1599534407591!5m2!1svi!2s"
                    frameborder="0" style="border:0; width: 90%" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
    </div>
    <div class="footer" >WEDDING  &copy; 2022</div>
</div>
