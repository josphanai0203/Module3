<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String a = request.getParameter("a");
double b = Double.parseDouble(request.getParameter("b"));
double c = Double.parseDouble(request.getParameter("c"));
Double d = (Double)request.getAttribute("dao");
%>

<h1>Hello </h1>
<p>Product Description : <%=a %></p>
<p>List Price : <%=b %></p>
<p>Discount Percent: <%=c %></p>
<p>Discount Amount : <%=d %></p>
</body>
</html>