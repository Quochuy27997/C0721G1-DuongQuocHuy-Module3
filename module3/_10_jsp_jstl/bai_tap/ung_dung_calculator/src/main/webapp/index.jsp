<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/10/2021
  Time: 4:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.css">
</head>
<body>
<c:if test="${empty khachHangList}">
    <h1>Khach Hang Trong</h1>
</c:if>
<c:if test="${not empty khachHangList}">


    <div class="container-fluid">
        <table class="table">
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>

            </tr>
            <c:forEach var="KhachHang" items="${khachHangList}">
            <tr>
                <th>${KhachHang.name}</th>
                <th>${KhachHang.age}</th>
                <th>${KhachHang.address}</th>
                <th>${KhachHang.image}</th>

            </tr>
            </c:forEach>
        </table>

    </div>
</c:if>
</body>
</html>
