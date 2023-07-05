<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style>
    body{
      font-family: 'Averia Serif Libre';
      margin: auto;
      margin-top: 25vh;
      width: 320px; height: 320px;
    }
    input{ border: 1px solid; }
    td:first-child{ width: 100px; }
  </style>
</head>
<body>
<h1>Simple Calculator</h1>
<div>
<form method="post" action="/calculate">
  <fieldset>
    <legend>Login</legend>
    <table>
      <tr><td>First operand</td><td><input type="text" name="num1"></td></tr>
      <tr><td>Operator</td><td>
        <select name="op">
          <option value="+">addition</option>
          <option value="-">Subtraction</option>
          <option value="*">multiplication</option>
          <option value="/">division</option>
        </select>
      </td></tr>
      <tr><td>second operand</td><td><input type="text" name="num2"></td></tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Calculate"/></td>
      </tr>
    </table>
  </fieldset>

</form>
</div>

</body>
</html>