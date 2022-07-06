<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
         <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/index.jsp"></jsp:include>
  <div class="shadow p-5 mt-1  rounded-3 bg-dark d-block mx-auto  " >
        <h1 class="text-white text-center">ORDER</h1>
    </div>
     

<div class="container p-5">
	<table class="table">
		<thead>
			<th>ID</th>
			<th>Image</th>
			<th>Name</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Created Date</th>
			<th>Status</th>
		</thead>
		<tbody class="align-middle">
		
		
		
		<c:forEach items="${order}" var="o">
	<%-- 	<c:if test="${sessionScope.userxc.id == cart.user.id}"> --%>
		<c:set var="s" value="${s + cart.underwear.price * cart.quantity}"></c:set>
			<tr> 
				<td>${o.order.id}</td>
				<td><img src="/img/${o.underwear.img}" height="100"></td>
				<td>${o.underwear.productName }</td>
				<td>${o.quantity}</td>
				<td>${o.price * o.quantity}đ</td>
				<td><fmt:formatDate pattern="dd-MM-yyyy" value="${o.order.createdDate}"></fmt:formatDate></td>
				<td><c:choose>
							<c:when test="${ o.order.status == false }">Pending</c:when>
							
							<c:otherwise> - </c:otherwise>
						</c:choose></td>
			<%-- 	<td><a class="btn btn-danger " href="/cart/delete/${cart.id}">Delete</a></td> --%>
			</tr>
				
	<%-- </c:if> --%>
		</c:forEach>
		<%-- <tr>
		<td colspan="5"  class="text-end fw-bold">Total Price:</td>
		<td> ${s}đ</td>
		</tr> --%>
			
	
		</tbody>
	</table>
	<!-- <a type="button" class="btn btn-primary float-start mt-4 ms-2"  href="/home/">
  Continue Shopping
</a>

<a class="btn btn-danger float-start ms-2  mt-4" href="/order/checkout">
  Checkout
</a>	 -->

</body>
</html>