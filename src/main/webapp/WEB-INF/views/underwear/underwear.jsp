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
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/views/index.jsp"></jsp:include>
	</header>	
	

<form:form modelAttribute="underwear" action="/underwear/create" method="POST">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Underwear</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Tên sản phẩm</label>
    <input type="text" name="productName" class="form-control" id="inputEmail4">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Giá tiền</label>
    <input type="text" name="price" class="form-control" id="inputEmail4">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Số lượng</label>
    <input type="text" name="quatity" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Size</label>
    <input type="text" name="size" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Color</label>
    <input type="text" name="color" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Img</label>
    <input type="file" name="img" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Thể loại</label>
    <select name="category" class="form-select">
    	<c:forEach items="${category}" var="dsCate">
    		<option value="${dsCate.id }">
    		${dsCate.nameCate}
    	</c:forEach>
    </select>
  </div>
  </div>
</div>      
      <div class="modal-footer">
        <button type="reset" class="btn btn-outline-dark">Reset</button>
        <button type="submit" class="btn btn-outline-dark">Save</button>
      </div>
      </div>
    </div>
  </div>
   </form:form>
	
	<div class="container">
<div class="col-md-9 mx-auto">
<div class="p-2 text-center font-monospace">
	<h3>Underwear Manager</h3>
</div>
<div class="row p-2">
 <form class="d-flex" role="search" action="/underwear/search">
      <input class="form-control me-2" type="search" name="keyWord" value="${keyWord}" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-dark me-1" type="submit"><i class="bi bi-search-heart"></i></button>
       <a href="/underwear" class="btn btn-outline-dark" type="submit"><i class="bi bi-arrow-clockwise"></i></a>
    </form>

<div class="text-end mt-3 ">
<button  type="button" class="btn btn-outline-dark p-1 me-1" data-bs-toggle="modal" data-bs-target="">
 <i class="bi bi-trash3 me-1"></i> Delete Underwear
</button>
<button  type="button" class="btn btn-outline-dark p-1 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
 <i class="bi bi-plus-circle me-1"></i> Add Underwear
</button>
</div>
</div>
	<table class="table">
  <thead>
    <tr>
   	  <th scope="col">
   	  	<input type="checkbox">
   	  </th>
      <th scope="col">Name</th>
      <th scope="col">Price</th>	
      <th scope="col">Quantity</th>
      <th scope="col">Time</th>
      <th scope="col">Size</th>
      <th scope="col">Color</th>
      <th scope="col">Category</th>
      <th scope="col">Img</th>
      <th scope="col">Manipulation</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${underPage.getContent()}" var = "dsUnder">
    <tr>
      <td>
      <input type="checkbox">
      </td>
      <td>${ dsUnder.productName }</td>
      <td>${ dsUnder.price }VNĐ</td>
      <td>${ dsUnder.quatity }</td>
      <td>${ dsUnder.dateNow }</td>
      <td>${ dsUnder.size }</td>
      <td>${ dsUnder.color }</td>
      <td>${ dsUnder.category.nameCate }</td>
      <td><img src="/img/${dsUnder.img}" height="100px"></td>
      <td>
      <a class="btn btn-outline-dark" data-bs-toggle="modal" href="#updateCateModal_${dsUnder.id}"><i class="bi bi-pencil"></i></a>
      <a class="btn btn-outline-dark" data-bs-toggle="modal" href="#deleteCateModal_${dsUnder.id}"><i class="bi bi-trash"></i></a>
      </td>
    </tr>
    <form:form modelAttribute="under" action="/underwear/update?id=${dsUnder.id}" method="POST">
<!-- Modal -->
<div class="modal fade" id="updateCateModal_${dsUnder.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Underwear</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Tên sản phẩm</label>
    <input type="text" name="productName" class="form-control" id="inputEmail4" value="${ dsUnder.productName }">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Giá tiền</label>
    <input type="text" name="price" class="form-control" id="inputEmail4" value="${dsUnder.price }">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Số lượng</label>
    <input type="text" name="quatity" class="form-control" id="inputEmail4" value="${dsUnder.quatity }" >
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Size</label>
    <input type="text" name="size" class="form-control" id="inputEmail4" value="${dsUnder.size }">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Color</label>
    <input type="text" name="color" class="form-control" id="inputEmail4" value="${dsUnder.color }">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Img</label>
    <input type="file" name="img" class="form-control" id="inputEmail4" value="${dsUnder.img }">
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Thể loại</label>
    <select name="category" class="form-select">
    	<c:forEach items="${category}" var="dsCate">
    		<option value="${dsCate.id }">
    		${dsCate.nameCate}
    	</c:forEach>
    </select>
  </div>
  </div>
</div>      
      <div class="modal-footer">
        <button type="reset" class="btn btn-outline-dark">Reset</button>
        <button type="submit" class="btn btn-outline-dark">Save changes</button>
      </div>
      </div>
    </div>
  </div>
   </form:form>
   
  
<!-- Modal -->
<div class="modal fade" id="deleteCateModal_${dsUnder.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Xóa thể loại</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Bạn chắc chắn muốn xóa ?</label>
  </div>
  </div>
</div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary">Close</button>
        <a class="btn btn-outline-dark" href="/underwear/delete?id=${dsUnder.id}">Accept</a>
      </div>
      </div>
    </div>
  </div>    
    </c:forEach>
  </tbody>
</table>	
<p class="text-center">
	<c:if test="${underPage.getNumber()>0}">
		<a class="btn btn-outline-dark" href="/underwear?pageNumber=${underPage.getNumber() - 1}">Previous</a>
	</c:if>
	${underPage.getNumber() + 1} / ${underPage.getTotalPages() }
	<c:if test="${underPage.getNumber() < underPage.getTotalPages()-1 }">
	<a class="btn btn-outline-dark" href="/underwear?pageNumber=${underPage.getNumber() + 1}">Next</a>
	</c:if>	
</p> 
</div>		
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>