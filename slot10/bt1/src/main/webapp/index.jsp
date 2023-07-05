<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student list</title>
</head>
<body>
<h1>Student list - JSTL</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th> Img</th>
    </tr>
    <c:forEach items="${customerList}" var="s">
        <tr>
            <td><c:out value="${s.id}"></c:out></td>
            <td>${s.name}</td>
            <td>${s.age}</td>
            <td><img width="80px" height="60px" src="${s.imgAddress}" alt="" srcset=""></td>

        </tr>
    </c:forEach>

</table>
</body>
</html>
