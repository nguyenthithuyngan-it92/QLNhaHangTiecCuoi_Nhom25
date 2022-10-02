<%-- 
    Document   : services_wedding
    Created on : 29 thg 9, 2022, 18:54:18
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="d-flex">
    <div class="left imgServices">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7" aria-label="Slide 8"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="8" aria-label="Slide 9"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<c:url value="/img/BohemainDichVu_RotCat2.jpg"/>" class="d-block w-100" alt="Dịch vụ rót cát">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Trọn gói yêu thương==</h5>
                        <p>Gói dịch vụ cưới "Trọn gói yêu thương" - Nghi thức cưới "Rót cát"</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/JSYDichVu.jpg"/>" class="d-block w-100" alt="Dịch vụ rót cát">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Trọn gói yêu thương 2==</h5>
                        <p>Gói dịch vụ cưới "Trọn gói yêu thương 2" - Nghi thức cưới "Rót cát"</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/RSDichVuKiNiem_ThatDay.jpg"/>" class="d-block w-100" alt="Dịch vụ thắt dây">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Gắn kết yêu thương==</h5>
                        <p>Gói dịch vụ cưới "Gắn kết yêu thương" - Nghi thức cưới "Thắt dây tơ hồng"</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/SanVuonDichVu_RotGao.jpg"/>" class="d-block w-100" alt="Dịch vụ rót gạo">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Hạnh phúc ngọt ngào==</h5>
                        <p>Gói dịch vụ cưới "Hạnh phúc ngọt ngào" - Nghi thức cưới "Rót gạo"</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="<c:url value="/img/dichvurotruou.jpg"/>" class="d-block w-100" alt="Dịch vụ rót rượu">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Khởi đầu hạnh phúc==</h5>
                        <p>Gói dịch vụ cưới "Khởi đầu hạnh phúc" - Nghi thức cưới "Rót rượu"</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/dichvubantiec.jpg"/>" class="d-block w-100" alt="Trang trí bàn tiệc tối">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Trang trí tiệc tối==</h5>
                        <p>Trang trí đèn lung linh cho bàn tiệc tối.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/dichvule.jpg"/>" class="d-block w-100" alt="Trang trí bàn gia tiên">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Trang trí bàn gia tiên==</h5>
                        <p>Trang trí bàn gia tiên cho những lễ đính hôn trên không gian sảnh gác mái.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/dichvuDecorate.jpg"/>" class="d-block w-100" alt="Trang trí bàn Gallery">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Trang trí bàn Gallery==</h5>
                        <p>Trang trí bàn Gallery - bàn đón khách trước sảnh.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="<c:url value="/img/dichvuCong.jpg"/>" class="d-block w-100" alt="Trang trí cổng cưới">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>==Trang trí cổng cưới==</h5>
                        <p>Trang trí cổng cưới - cổng đón khách và chụp ảnh kỉ niệm.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <div class="introduce-service">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="font-size:200%;color:rgb(210, 80, 0);">
                DỊCH VỤ CƯỚI TRỌN GÓI
            </span>
            <b></b>
        </h2>
        <p style="padding: 0 15px 0 15px;text-align:center;font-size:13px;">
            Tại Trung Tâm Hội Nghị White Palace, chúng tôi cung cấp dịch vụ trang trí trọn gói với các chủ đề sang trọng, trang nhã,
            phù hợp với từng không gian sảnh tiệc. Tất cả hạng mục, từ hoa bàn tiệc, bánh cưới đến khu vực chụp hình, bàn đón khách đều được các chuyên gia của chúng tôi chăm chút chỉn chu, tỉ mỉ đến từng chi tiết, để bạn có thể toàn tâm tận hưởng những phút giây hạnh phúc trong ngày trọng đại.
        </p>
        <p style="padding: 0 15px 0 15px;text-align:center;font-size:13px;">
            Những dịch vụ chung mà ở tất cả các gói dịch vụ đều có như: 
            - Dịch vụ trang trí (bàn tiệc, sảnh cưới, sân khấu, cổng cưới, bàn đón khách)
            - Dịch vụ chụp ảnh trọn gói và album cưới (số lượng ảnh trong mỗi album tùy theo từng gói) 
            - Dịch vụ MC và tiết mục biểu diễn
        </p>
        <p style="padding: 0 15px 0 15px;text-align:center;font-size:13px;">Bên cạnh mỗi gói dịch vụ của nhà hàng còn có những đặc trưng riêng, phong cách trang trí riêng, các nghi thức lễ cưới độc đáo để lễ cưới của các cặp đôi mang đậm phong cách riêng để lại dấu ấn đẹp trong ngày trọng đại.</p>
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                CÁC GÓI DỊCH VỤ ĐƯỢC YÊU THÍCH
            </span>
            <b></b>
        </h2>
    </div>
</div>

<!--HÌNH ẢNH MINH HỌA-->
<div class="widget block block-static-block"><div class="home-service">
        <div class="container-services">
            <div class="about-service">
                <div class="service-one">
                    <div class="details-service">
                        <h2 class="trongdong-color">SẢNH CƯỚI</h2>
                        <p>Một sảnh cưới mang phong cách riêng được trang trí theo yêu cầu của các cặp đôi sẽ để lại một dấu ấn đặc biệt trong ngày trọng đại của dâu rễ.</p>
                        <a class="trong-dong-bottom" href="<c:url value="/weddings" />">Sảnh cưới</a></div>
                    <div class="img-service">
                        <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664515470/banner/sanhcuoi_rwxycu.jpg" 
                             data-amsrc="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664515470/banner/sanhcuoi_rwxycu.jpg" class="lozad" alt="" width="260" height="240" style="object-fit: cover;" data-loaded="true"></div>
                </div>
                <div class="service-one">
                    <div class="details-service">
                        <h2 class="trongdong-color">BÀN TIỆC</h2>
                        <p>Bàn tiệc sẽ được chúng tôi trang trí đồng bộ theo phong cách tiệc cưới mà các cặp đôi yêu cầu. Bàn tiệc lớn để khách mời cảm thấy thoải mái.</p>
                        <a class="trong-dong-bottom" href="#"></a></div>
                    <div class="img-service">
                        <picture>
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg" media="(max-width: 768px)and (min-width: 480px)" type="image/webp">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg" media="(max-width: 768px)and (min-width: 480px)">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg" media="(max-width: 480px)" type="image/webp">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg" media="(max-width: 480px)">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg" type="image/webp">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg">
                            <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvubantiec_pqrptk.jpg" alt="" width="260" height="240" style="object-fit: cover;">
                        </picture>
                    </div>
                </div>
                <div class="service-two">
                    <div class="details-service">
                        <h2 class="trongdong-color">BÀN GALLERY</h2>
                        <p>Bàn đón khách trước sảnh là nơi dâu rễ đón khách mời, decor những tấm ảnh cưới và nơi để khách mời lưu lại kỉ niệm với cặp đôi.</p>
                        <a class="trong-dong-bottom" href="#"></a></div>
                    <div class="img-service">
                        <picture>
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg" media="(max-width: 768px)and (min-width: 480px)" type="image/webp">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg" media="(max-width: 768px)and (min-width: 480px)">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg" media="(max-width: 480px)" type="image/webp">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg" media="(max-width: 480px)">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg" type="image/webp">
                            <source srcset="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg">
                            <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512788/banner/JSYDecorate_magk0k.jpg" alt="" width="260" height="240" style="object-fit: cover;">
                        </picture>
                    </div>
                </div>
                <div class="service-three">
                    <div class="details-service">
                        <h2 class="trongdong-color">CỔNG CƯỚI</h2>
                        <p>Cổng cưới là nơi dâu rễ chụp ảnh kỉ niệm cùng khách mời đến dự tiệc. Cổng cưới cũng được trang trí đồng bộ theo phong cách dâu rễ yêu cầu.</p>
                        <a class="trong-dong-bottom" href="#"></a></div>
                    <div class="img-service">
                        <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664514196/banner/congcuoi3_eah7dn.jpg" 
                             data-amsrc="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664514196/banner/congcuoi3_eah7dn.jpg" class="lozad" alt="" width="260" height="240" style="object-fit: cover;" data-loaded="true"></div>
                </div>
                <div class="service-four">
                    <div class="details-service">
                        <h2 class="trongdong-color">BÀN GIA TIÊN</h2>
                        <p>Ngoài ra, nhà hàng chúng tôi còn cung cấp dịch vụ trang trí bàn gia tiên cho các lễ Đính hôn. Hỗ trợ chuẩn bị mâm sính lễ theo yêu cầu của khách hàng.</p>
                        <a class="trong-dong-bottom" href="#"></a></div>
                    <div class="img-service">
                        <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvule_ts9uq4.jpg" 
                             data-amsrc="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664512772/banner/dichvule_ts9uq4.jpg" class="lozad" alt="" width="260" height="240" style="object-fit: cover;" data-loaded="true"></div>
                </div>
                <div class="service-four">
                    <div class="details-service">
                        <h2 class="trongdong-color">LÊN KẾ HOẠCH CƯỚI</h2>
                        <p>Ngày cưới là ngày trọng đại đời người nên ai cũng muốn có một lễ cưới hoàn hảo nhất, tuy nhiên không phải cặp đôi nào cũng có đủ thời gian cũng như kinh nghiệm vì vậy đội ngũ tổ chức sự kiện của chúng tôi sẽ giúp bạn lên kế hoạch cho ngày cưới của mình.</p>
                        <a class="trong-dong-bottom" href="#"></a></div>
                    <div class="img-service">
                        <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664516696/banner/banner_enwhnh.jpg" 
                             data-amsrc="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664516696/banner/banner_enwhnh.jpg" class="lozad" alt="" width="260" height="240" style="object-fit: cover;" data-loaded="true"></div>
                </div>
            </div>
        </div>
    </div></div>

<!--CÁC GÓI DỊCH VỤ-->
<h2 class="section-title section-title-center">
    <b></b>
    <span class="section-title-main" style="font-size:200%;color:rgb(210, 80, 0);">
        CÁC GÓI DỊCH VỤ
    </span>
    <b></b>
</h2>
<div class="info-Services row">
    <c:forEach items="${services}" var="s">
        <c:if test="${s.active == true}">
            <div class="service col-md-5 col-xs-12">
                <div class="name">
                    <h4 class="name-service">${s.name}</h4>
                    <h6 class="price-service"><fmt:formatNumber type="number" maxFractionDigits="3" 
                                      value="${s.price}" />  VNĐ</h6>
                </div>
                <div class="description">${s.description}</div>
            </div>
        </c:if>
    </c:forEach>
</div>