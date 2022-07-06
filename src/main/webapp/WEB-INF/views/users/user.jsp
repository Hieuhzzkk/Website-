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
	

<form:form modelAttribute="user" action="/user/create" method="POST">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="inputEmail4">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Email</label>
    <input type="email" name="email" class="form-control" id="inputEmail4">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Password</label>
    <input type="password" name="pass" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-12">
  <div class="form-lable">
  	<label>Sex</label>
  </div>
    <div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="sex" id="inlineRadio1" value="1" checked="checked">
  <label class="form-check-label" for="inlineRadio1">Nam</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="sex" id="inlineRadio2" value="0">
  <label class="form-check-label" for="inlineRadio2">Nữ</label>
</div>
  </div>
   <div class="col-md-12">
   <div class="form-lable">
  	<label>Role</label>
  </div>
    <div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="role" id="inlineRadio1" value="0">
  <label class="form-check-label" for="inlineRadio1">Admin</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="role" id="inlineRadio2" value="1" checked="checked">
  <label class="form-check-label" for="inlineRadio2">User</label>
</div>
  </div>
  
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Img</label>
    <input type="file" name="img" class="form-control" id="inputEmail4">
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
	<h3>Users Manager</h3>
</div>
<div class="p-2">
 <form class="d-flex" role="search" action="/user/search">
      <input class="form-control me-2" type="search" name="keyWord" value="${keyWord}" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-dark me-1" type="submit"><i class="bi bi-search-heart"></i></button>
       <a href="/user/getAll" class="btn btn-outline-dark" type="submit"><i class="bi bi-arrow-clockwise"></i></a>
    </form>

<div class="text-end mt-3 ">
<button  type="button" class="btn btn-outline-dark p-1 me-1" data-bs-toggle="modal" data-bs-target="#exampleModal">
 <i class="bi bi-trash3 me-1"></i> Delete user
</button>
<button  type="button" class="btn btn-outline-dark p-1 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
 <i class="bi bi-plus-circle me-1"></i> Add user
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
      <th scope="col">Email</th>	
      <th scope="col">Password</th>
      <th scope="col">Sex</th>
      <th scope="col">Role</th>
      <th scope="col">Img</th>
      <th scope="col">Manipulation</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${userPage.getContent()}" var = "dsUser">
    <tr>
      <td>
      <input type="checkbox">
      </td>
      <td>${ dsUser.name }</td>
      <td>${ dsUser.email }</td>
      <td>${ dsUser.pass }</td>
      <td>
      	<c:choose>
      		<c:when test="${dsUser.sex == 1 }">Nam</c:when>
      		<c:when test="${dsUser.sex == 0 }">Nữ</c:when>
      		<c:otherwise>-</c:otherwise>
      	</c:choose>
      </td>
      <td>
      	<c:choose>
      		<c:when test="${dsUser.role == 1 }">User</c:when>
      		<c:when test="${dsUser.role == 0 }">Admin</c:when>
      		<c:otherwise>-</c:otherwise>
      	</c:choose>
      </td>
      <td><img src="/img/${dsUser.img}" height="100px"></td>
      <td>
      <a class="btn btn-outline-dark" data-bs-toggle="modal" href="#updateCateModal_${dsUser.id}"><i class="bi bi-pencil"></i></a>
      <a class="btn btn-outline-dark" data-bs-toggle="modal" href="#deleteCateModal_${dsUser.id}"><i class="bi bi-trash"></i></a>
      </td>
    </tr>
    <form:form modelAttribute="user" action="/user/update?id=${dsUser.id}" method="POST">
<!-- Modal -->
<div class="modal fade" id="updateCateModal_${dsUser.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row g-3">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="inputEmail4" value="${ dsUser.name }">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Email</label>
    <input type="email" name="email" disabled="disabled" class="form-control" id="inputEmail4" value="${dsUser.email }">
  </div>
   <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Password</label>
    <input type="password" disabled="disabled" name="pass" class="form-control" id="inputEmail4" value="${dsUser.pass }" >
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Sex</label>
    <input type="text" name="sex" class="form-control" id="inputEmail4" value="1" ${ dsUser.sex == 1 ? "checked" : "" }>Nam
     <input type="text" name="sex" class="form-control" id="inputEmail4" value="0" ${ dsUser.sex == 0 ? "checked" : "" }>Nữ
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Role</label>
    <input type="radio" name="role" class="form-control" id="inputEmail4" value="1" ${ dsUser.role == 1 ? "checked" : "" } >User
    <input type="radio" name="role" class="form-control" id="inputEmail4" value="0" ${ dsUser.role == 0 ? "checked" : "" } >Admin
  </div>
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Img</label>
    <input type="file" name="img" class="form-control" id="inputEmail4" value="${dsUser.img }">
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
<div class="modal fade" id="deleteCateModal_${dsUser.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
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
        <a class="btn btn-outline-dark" href="/user/delete?id=${dsUser.id}">Accept</a>
      </div>
      </div>
    </div>
  </div>    
    </c:forEach>
  </tbody>
</table>	
<p class="text-center">
	<c:if test="${userPage.getNumber()>0}">
		<a class="btn btn-outline-dark" href="/user/getAll?pageNumber=${userPage.getNumber() - 1}">Previous</a>
	</c:if>
	${userPage.getNumber() + 1} / ${userPage.getTotalPages() }
	<c:if test="${userPage.getNumber() < userPage.getTotalPages()-1 }">
	<a class="btn btn-outline-dark" href="/user/getAll?pageNumber=${userPage.getNumber() + 1}">Next</a>
	</c:if>	
</p> 
</div>		
</div>

		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
</body>
</html>