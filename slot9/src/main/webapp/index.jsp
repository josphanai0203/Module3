<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<form action="DiscountServlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Product Description: </label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="a">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">List Price</label>
    <input type="number" class="form-control" id="exampleInputPassword1" name="b">
  </div>
  <div class="mb-3">
    <label class="form-check-label" for="exampleCheck1">Discount Percent</label>
    <input type="number" class="form-control" id="exampleCheck1" name="c">
  </div>
  <button type="submit" class="btn btn-primary">Calculate Discount </button>
</form>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
</body>
</html>