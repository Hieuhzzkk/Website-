<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css"
	integrity="sha512-g06pohSHYbSOHKq8tdDGXckE6C23Yt30xlTFDhrO0OcO/bNO2MWXb63oqU/Y23GDMNOon100eGHxZPBnT4QgMw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" 
    integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/index.jsp"></jsp:include>
	<div class="container">
	<div class="p-2 text-center font-monospace">
	<h3>Cart</h3>
</div>
	<div class="row">
	<table class="table">
  <thead>
    <tr>
      <th scope="col">Img</th>
      <th scope="col">Name</th>
      <th scope="col">Color</th>
      <th scope="col">Category</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Manipulation</th>
    </tr>
  </thead>
 
  <tbody>
   <c:forEach items="${cart}" var="cart">
   <c:set var="s" value="${s + cart.underwear.price * cart.quantity}"></c:set>
    <tr>
      <td><img src="/img/${cart.underwear.img}" height="100px"></td>
     			<td>${cart.underwear.productName }</td>
				<td>${cart.underwear.color }</td>
				<td>${cart.underwear.category.nameCate }</td>
				<td>${cart.quantity}</td>				
				<td>${cart.underwear.price * cart.quantity}VNĐ</td>				
      <td>
     <a class="btn btn-outline-dark" href="/cart/delete/${cart.id}">Xóa</a>
     <a class="btn btn-outline-dark" href="/order/checkout">Mua</a>
      </td>
      
    </tr>
     </c:forEach>
     <tr>
		<td colspan="5"  class="text-end fw-bold">Total Price:</td>
		<td> ${s}đ</td>
		</tr>
  </tbody>
</table>
<a type="button" class="btn btn-primary float-start mt-4 ms-2"  href="/home/">
  Continue Shopping
</a>
	</div>
	</div>
<footer class="">
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</footer>
</body>
</html>