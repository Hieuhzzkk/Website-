<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
<body >
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/home"><i class="bi bi-cart3 fs-3 me-1"></i>Underwear Shop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">   
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/cart"><i class="bi bi-cart"></i></a>
        </li>  
       <!--  <li class="nav-item">
          <a class="nav-link" href="/underwear">Underwear Manager</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user">User Manager</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/category">Category Manager</a>
        </li>     -->
       <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Manager
          </a>
          <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="/underwear">Underwear Manager</a></li>
            <li><a class="dropdown-item" href="/user">User Manager</a></li>
            <li><a class="dropdown-item" href="/category">Category Manager</a></li>
            <li><a class="dropdown-item" href="/order">Order Manager</a></li>
          </ul>
        </li>
      </ul>
    </div>   
      </ul> 
           
  </div>
  
  <c:choose>
  <c:when test="${not empty sessionScope.userxc}">
  <div class="text-end  justify-content-end">
  	<span>Hi,</span> <a class="text-decoration-none fw-bold text-black font-monospace me-2">${userxc.name}</a>
  	<a type="button" class="btn btn-outline-dark me-2" href="/logout">Logout</a>
  </div>
  </c:when>
  <c:otherwise>
  <div class="text-end  justify-content-end">
  	<p><a href="/login" class="nav-link btn btn-outline-dark text-secondary">Login</a></p>
  </div>
 </c:otherwise>
  </c:choose>
 </div>  
</nav>	

</body>
</html>