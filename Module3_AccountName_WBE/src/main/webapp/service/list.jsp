<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/10/2021
  Time: 9:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>

<h4>
    <a href="/">Trang chủ</a>
</h4>
<div class="row">
    <div class="col-8">
        <h1>Service Management</h1>
    </div>
</div>
<h4>
    <a href="/service?action=create_service">Create Service</a>
</h4>



<div align="center">
    <table id="product" border="1" cellpadding="5">
        <caption><h2>List Service</h2></caption>
        <tr>
            <th>Id</th>
            <th>Name service</th>
            <th>Area service</th>
            <th>Cost service</th>
            <th>Max_people</th>
            <th>Rent type</th>
            <th>Service type</th>
            <th>Standard room</th>
            <th>description</th>
            <th>pool_area</th>
            <th>number_of_floors</th>
        </tr>
        <c:forEach var="service" items="${listService}">
            <tr>
                <td>${service.service_id}</td>
                <td>${service.service_name}</td>
                <td>${service.service_area}</td>

                <td>${service.service_cost}</td>
                <td>${service.service_max_people}</td>
                <td>${service.rent_type_id}</td>

                <td>${service.service_type_id}</td>
                <td>${service.standard_room}</td>
                <td>${service.description}</td>
                <td>${service.pool_area}</td>
                <td>${service.number_of_floors}</td>


            </tr>
        </c:forEach>
    </table>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>

</body>
</html>
