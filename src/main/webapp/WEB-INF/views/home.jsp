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
<style type="text/css">
.card {
  width: 444px;
}

body {
  background: #eee;
}
}
</style>	
</head>
<body>
<jsp:include page="/WEB-INF/views/index.jsp"></jsp:include>
<div class="container">
<div class="row">
<div class="p-1 text-center font-monospace">
<h3>Well Come To The dsUnder Shop</h3>
</div>
<div class="row">
<div class="col-6 mx-auto">
<form class="d-flex" role="search" action="/home/search">
      <input class="form-control me-2" type="search" name="keyWord" value="${keyWord}" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-dark me-1" type="submit"><i class="bi bi-search-heart"></i></button>
       <a href="/home" class="btn btn-outline-dark" type="submit"><i class="bi bi-arrow-clockwise"></i></a>
    </form>
    </div>
</div>


<c:forEach items="${underPage.getContent()}" var="dsUnder">
<div class="col-md-3 mt-2">
<div class="card" style="width: 18rem;">
  <img src="/img/${dsUnder.img}" class="card-img-top" height="270px">
  <div class="card-body">
    <h5 class="card-title">Name: ${dsUnder.productName}</h5>
    <p class="card-text">Category: ${dsUnder.category.nameCate}</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Price: ${dsUnder.price}VNĐ</li>
  </ul>
  <div class="card-body text-end">
    <a href="/cart/buy/${dsUnder.id}/1" class="card-link btn btn-outline-dark"><i class="bi bi-cart-plus"></i></a>
    <a href="#exampleModal_${dsUnder.id}" data-bs-toggle="modal" class="card-link btn btn-outline-dark"><i class="bi bi-eyeglasses"></i></a>
  </div>
</div>
</div>

<div class="modal fade" id="exampleModal_${dsUnder.id}">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">View Detail</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  <div class="d-flex justify-content-center container mt-3">
        <div class="card p-3 bg-white"><i class="fa fa-apple"></i>
            <div class="about-product text-center mt-1"><img src="/img/${dsUnder.img}" width="300">
                <div>
                    <h4>${dsUnder.productName}</h4>
                    <h6 class="mt-0 text-black-50">${dsUnder.category.nameCate}</h6>
                </div>
            </div>
            <div class="stats mt-2">
                <div class="d-flex justify-content-between p-price"><span>Color</span><span>${dsUnder.color}</span></div>
                <div class="d-flex justify-content-between p-price"><span>Size</span><span>${dsUnder.size}</span></div>
                
                <div class="d-flex justify-content-between p-price"><span>Quantity available</span><span>${dsUnder.quatity}</span></div>                                     	
            </div>
            <div class="d-flex justify-content-between total font-weight-bold mt-4"><span>Giá hạt rẻ</span><span>${dsUnder.price} VNĐ</span></div>
       		<hr>
       		<div class="text-end"><a href="/cart/buy/${dsUnder.id}/1" class="btn btn-outline-dark"><i class="bi bi-cart-plus"></i></a></div>
        </div>        
    </div>	
      </div>
    </div>
  </div>
</div>
</c:forEach>
<!--Modal -->

</div>

<p class="text-center mt-3">
	<c:if test="${underPage.getNumber()>0}">
		<a class="btn btn-outline-dark" href="/home?pageNumber=${underPage.getNumber() - 1}"><i class="bi bi-arrow-left-short"></i></a>
	</c:if>
	${underPage.getNumber() + 1} / ${underPage.getTotalPages() }
	<c:if test="${underPage.getNumber() < underPage.getTotalPages()-1 }">
	<a class="btn btn-outline-dark" href="/home?pageNumber=${underPage.getNumber() + 1}"><i class="bi bi-arrow-right-short"></i></a>
	</c:if>	
</p> 
</div>


<footer class="">
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</footer>
</body>
</html>