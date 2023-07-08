<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/7/2023
  Time: 10:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        *{
            font-family: sans-serif;
            box-sizing: border-box;
        }
        table,tr,td{
            border-collapse: collapse;
        }
        #inputSearch {
            width: 96%;
            border: none;
            padding: 4px;
            margin: 2px;
            font-size: 1.4rem;
            overflow: hidden;
            outline: none;
        }
        #box {
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
   <div id="box">
        <input type="text" oninput="loadData()" name="search" id="inputSearch" placeholder="Search ">

   </div>
</center>
<div align="center" id="content">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <script>
        function loadData(){
            let searchvalue = document.getElementById("inputSearch").value;
            $.ajax({
                url: "/load",
                type:"get",
                data: {
                    search : searchvalue,
                },
                success: function (data){
                    var content = document.getElementById("content");

                    content.innerHTML = data;
                }
            });
        }
    </script>
</div>
</body>
</html>