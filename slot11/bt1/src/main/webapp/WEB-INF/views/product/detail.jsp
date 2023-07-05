<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/5/2023
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>detail</title>
  <style>
    table {
      border-collapse: collapse;
    }
    table, th, td {
      border: 1px solid;
    }
  </style>
</head>
<body>


    <table>
      <tr>
        <td>ID</td>
        <td>${product.id}</td>
      </tr>
      <tr>
        <td>Name</td>
        <td>${product.name}</td>
      </tr>
      <tr>
        <td>Quantity</td>
        <td>${product.quantity}</td>
      </tr>
      <tr>
        <td>Price</td>
        <td>${product.price}</td>
      </tr>
      <tr>
        <td>Date release</td>
        <td><fmt:formatDate value="${product.dateRelease}" pattern="dd/MM/yyyy" /></td>
      </tr>
      <tr>
        <td>Category</td>
        <td>${product.category.name}</td>
      </tr>
    </table>
    <button style=" margin-top:10px " ><a href="/product">Back</a></button>
</body>
</html>
