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

<form:form modelAttribute="category" action="/category/create" method="POST">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm mới thể loại</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Tên thể loại</label>
    <input type="text" name="nameCate" class="form-control" id="inputEmail4">
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
<div class="col-md-8 mx-auto">
<div class="p-2 text-center font-monospace">
	<h3>Underwear Manager</h3>
</div>
<div class="p-2 text-end">
<button  type="button" class="btn btn-outline-dark p-1 me-1" data-bs-toggle="modal" data-bs-target="#exampleModal">
 <i class="bi bi-trash3 me-1"></i> Delete Category
</button>
<button  type="button" class="btn btn-outline-dark p-1 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
 <i class="bi bi-plus-circle me-1"></i> Add Category
</button>
</div>
	<table class="table">
  <thead>
    <tr>
   	  <th scope="col">Chọn</th>
      <th scope="col">Tên sản phẩm</th>
      <th scope="col">Time</th>      
      <th scope="col">Thao tác</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${ category }" var = "dsCate">
    <tr>
      <td>
      <input type="checkbox">
      </td>
      <td>${ dsCate.nameCate }</td>
      <td>${ dsCate.dateNow }</td>
      <td>
      <a class="btn btn-outline-dark" data-bs-toggle="modal" href="#updateCateModal_${dsCate.id}"><i class="bi bi-pencil"></i></a>
      <a class="btn btn-outline-dark" data-bs-toggle="modal" href="#deleteCateModal_${dsCate.id}"><i class="bi bi-trash"></i></a>
      </td>
    </tr>
    <form:form modelAttribute="cate" action="/category/update?id=${dsCate.id}" method="POST">
<!-- Modal -->
<div class="modal fade" id="updateCateModal_${dsCate.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm mới thể loại</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Tên thể loại</label>
    <input type="text" name="nameCate" class="form-control" id="inputEmail4" value="${dsCate.nameCate}">
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
<div class="modal fade" id="deleteCateModal_${dsCate.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        <button type="reset" class="btn btn-outline-dark">Close</button>
        <a class="btn btn-outline-dark" href="/category/delete?id=${dsCate.id}">Accept</a>
      </div>
      </div>
    </div>
  </div>    
    </c:forEach>
  </tbody>
</table>
</div>		
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>