<%-- 
    Document   : index
    Created on : 20 thg 7, 2022, 15:53:32
    Author     : LENOVO
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1>Hello World!</h1>

<c:if test="${currentUser != null}">
    ${currentUser.username}
</c:if>

