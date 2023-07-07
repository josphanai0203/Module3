<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List product</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <h1>List product</h1>
    <a href="/product?action=create">Add new product </a>
    <form action="/product?action=search" method="post" id="search" style="display: inline">
    <input style="margin-left: 24px" type="text" oninput="onSearch()" placeholder="Search" name="valueSearch" id="searchInput">
    <input type="hidden" value="${value==null?"":value} " id="nuno"/>

    </form>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Date release</th>
            <th>Category</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach items="${searchList==null?products:searchList}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.quantity}</td>
                <td>${p.price}</td>
                <td>
                    <fmt:formatDate value="${p.dateRelease}" pattern="dd/MM/yyyy" />
                </td>
                <td>${p.category.name}</td>
                <td><a href="/product?action=update&id=${p.id}">Edit</a></td>
                <td><a href="/product?action=detail&id=${p.id}">Detail</a></td>
                <td><a href="/product?action=delete&id=${p.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <script>
        function onSearch(){
            document.getElementById("search").submit();

        }
        window.onload = function() {
            var a = document.getElementById("searchInput");
            var b = document.getElementById("nuno").value;
            console.log(b);
            a.value = b.trim();
            a.focus();

        }
    </script>
</body>
</html>