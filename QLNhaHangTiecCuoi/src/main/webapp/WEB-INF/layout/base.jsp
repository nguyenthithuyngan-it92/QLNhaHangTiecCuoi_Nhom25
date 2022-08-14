<%-- 
    Document   : base
    Created on : 28 thg 7, 2022, 11:05:08
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        
        <link href="<c:url value="/img/icon.jpg" />" rel="shorcut icon"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" />
        <style>
            .was-validated .form-control.is-invalid:valid {
                background-image: url("<c:url value="/img/icons/invalid.svg" />");
            }
        </style>
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        
        <div class="container">
            <tiles:insertAttribute name="content" />
        </div>
        
        <tiles:insertAttribute name="footer" />
        
        <script src="<c:url value="/js/main.js"/>"></script>
        <script src="https://upload-widget.cloudinary.com/global/all.js"></script>
    </body>
</html>
