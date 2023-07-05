<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
</head>
<body>
    <h1>${p==null?"Create new Product":"Edit Product"}</h1>
    <form action="/product" method="post">
        <table>
            <tr>
                <td>ID</td>
                <c:if test="${p == null}">

                <td><input type="text" name="id" value=""/></td>
                </c:if>
                <c:if test="${p != null}">

                <td>${p.id}</td><input type="hidden" name="id" value="${p.id}"/>
                </c:if>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="${p==null?"":p.name}" /></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><input type="text" name="quantity" value="${p==null?"":p.quantity}"/></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" value="${p==null?"":p.price}"/></td>
            </tr>
            <tr>
                <td>Date release</td>
                <c:if test="${p==null}">
                <td><input type="text" placeholder="dd/MM/yyyy" name="dateRelease" /></td>
                </c:if>
                <c:if test="${p!=null}">
                <td><input type="text" placeholder="dd/MM/yyyy" name="dateRelease" value="${date}"/></td>
                </c:if>
            </tr>
            <tr>
                <td>Category</td>
                <td>
                    <c:if test="${p == null}">
                    <select name="categoryId">
                        <c:forEach items="${categories}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>

                    </c:if>
                    <c:if test="${p!=null}">
                        <select name="categoryId">
                            <c:forEach items="${categories}" var="c">
                                <option ${p.category.id==c.id?"Selected":""} value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="${p==null?"Add":"Update"}">
                    <button><a href="/product">Back</a></button>
                </td>
            </tr>
        </table>
        <input type="hidden" name="action" value="${p==null?"create":"update"}">
    </form>
</body>
</html>
