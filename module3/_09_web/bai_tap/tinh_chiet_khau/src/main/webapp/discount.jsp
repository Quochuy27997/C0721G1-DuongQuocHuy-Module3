<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2021
  Time: 9:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form method="post" action="/display-discount">
    <input type="text" name="product_description" placeholder="Enter product description: "><br>
    <input type="text" name="list_price" placeholder="Enter list price: "><br>
    <input type="text" name="discount_percent" placeholder="Enter discount percent (%): "><br>
    <input type="submit" id="submit" value="Calculate Discount">
</form>
</body>
</html>
