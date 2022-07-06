<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản phẩm</title>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
 <link href="/css/headers.css" rel="stylesheet">
 <link href="/css/dropdown.css" rel="stylesheet"> 
  <link href="/css/modals.css" rel="stylesheet">
   <link href="/css/cards.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body class="container">
 <%-- <div class="shadow p-5 mt-1  rounded-3 bg-dark d-block mx-auto  " >
        <h1 class="text-white text-center">PRODUCT</h1>
    </div>
 
    <div class="container pt-5 ">
	<form method="POST"
		action="/Lab56/products/store"  enctype="multipart/form-data">
		<div class="row ">
		
		
		<div class="col">
			<label class="form-label fw-bold">Tên sản phẩm</label>
			<input type="text" name="ten" class="form-control" />
		</div>
		<div class="col">
			<label class="form-label fw-bold">Số lượng</label>
			<input type="number" name="soLuong" class="form-control" />
		</div>
		</div>
			<div class="row mt-2">
		<div class="col">
			<label class="form-label fw-bold">Đơn giá</label>
			<input type="number" name="donGia"  class="form-control"/>
		</div>
		<div class="col">
			<label class="form-label fw-bold">Màu sắc</label>
			<input type="text" name="mauSac" class="form-control" />
		</div>
		</div>
		<div class="row mt-2">
		<div class="col">
			<label class="form-label fw-bold">Kích thước</label>
			<input type="text" name="kichThuoc"  class="form-control"/>
		</div>
		<div class="col">
			<label class="form-label fw-bold">Ảnh</label>
			<input type="file" name="img" class="form-control" />
		</div>
		</div>
		<div class="row mt-2">
		<div class="col">
			<label class="form-label fw-bold">Tên danh mục</label>
  			<select class="form-select" name="cate_id">
		<c:forEach items="${ dsCate }" var="cate">
				<option value="${ cate.id }">
					${ cate.ten }
				</option>
		</c:forEach>
			</select>
		</div>
		
		</div>
		
<!-- <div>
	<!-- 		<label>Loại KH</label>
			<select name="loaiKH">
				<option value="0">Thường</option>
				<option value="1">VIP</option>
			</select> -->
	<!-- 	</div> -->
	
	<div class= " mt-4">

			<button class="btn btn-primary fw-bold">Add</button>
			<button class="btn btn-primary fw-bold" type="reset">Clear</button>
		</div>
		

		
	</form>
	<form method="post" enctype="multipart/form-data" action="/Lab56/import">
	<div class="row mt-4 offset-7">


<div class=" col-8">
	<input type="file" name="excel"  class="form-control" >
	</div>
	<div class="col-4">
	<button  class="btn btn-primary fw-bold" >Import</button>
	</div>
	

	
	
	</div>
		</form>
	</div> --%>
<div>

 <%--       <c:if test="${ empty quans }">
	<p class="alert alert-warning">Không có dữ liệu</p>
</c:if> --%>
</div>
<div class="shadow p-5 mt-1 mb-4  rounded-3 bg-dark d-block mx-auto  " >
        <h1 class="text-white text-center">Manage Pants</h1>
    </div>










<div>
<form action="/pant/page/1" class="float-start ">
<div class="row">
<div class="col-7">
<label class="form-label fw-bold">Type Search</label>
<input type="text" name="keyWord" value="${keyWord}" class="form-control "  >
</div>

<div class="col-5 " >
<div style="padding-top: 9px">


<div class="row mt-4">
<div class="col-6">
<button type="submit"  class="btn btn-primary ps-2 pe-2 mx-auto" >Search</button>
</div>

<div class="col-6" >
<a href="/pant/" class="btn btn-danger  ps-2 pe-2 mx-auto" >Reset</a>
</div>

</div>
</div>
</div>
</div>
</form>
</div>






<div style="padding-top: 9px">
<button type="button" class="btn btn-primary float-end mt-4 ms-2"  data-bs-toggle="modal" data-bs-target="#exampleModal">
  Add New Pants
</button>

</div>
<%-- <c:if test="${ !empty quans }"> --%>
<div class="container">
<form action="/pant/multipledelete">
<button class="btn btn-danger float-end  mt-4" >
  Delete
</button>
	<table class="table ">
		<thead>
	
			<th><input type="checkbox" id="chkBoxAll"/></th>
			<th >Name</th>
			<th>Quantity</th>
			<th >Price</th>
			<th >Color</th>
			<th>Size</th>
			<th>Type</th>
			<th >Created Date</th>
			<th colspan="2">Actions</th>
		</thead>
		<tbody class="table-info">
			<c:forEach items="${ listPants }" var="pant" >
				<tr class="align-middle">
				<td><input type="checkbox" class="chkCheckBoxId" value="${pant.id}" name="ids"></td>
				<td>${pant.name}</td>
				<td>${pant.quantity}</td>
				<td>${pant.price}đ</td>
				<td >${pant.color}</td>
				<td>${pant.size}</td>
				<td>${pant.cate.name}</td>
		
				<td><fmt:formatDate pattern="dd-MM-yyyy" value="${pant.createdDate}"/></td>
				<td >
						<div  style="cursor: pointer">
						<a href="#updatePantModal_${pant.id}" id="updateButton"  class="bi bi-pen-fill text-warning fs-4" role="button" data-bs-toggle="modal"></a>
					
						<a href="#deletePantModal_${pant.id}" id="deleteButton" class="bi bi-trash-fill text-danger fs-4 ms-3" role="button" data-bs-toggle="modal"></a>
							
						</div>
 
					</td>
					<%-- <td><img src="/Lab56/img/${product.img}"   height="100px" width="80px"></td>
					<td>${product.cate.ten}</td>
					<td class="row">
						<div class="col-4 me-5">
						<a class="btn btn-primary text-nowrap" href="/Lab56/products/edit?id=${product.id}" >Cập nhật</a>
						</div>
						<div class=" col-4 ms-2">
						<a  href="/Lab56/products/show?id=${product.id}" class="btn btn-danger " >Xóa</a>	
						</div>
 					
					</td> --%>

				</tr>
<div id ="deletePantModal_${pant.id}" class="modal fade  py-5" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-6 shadow">

      <div class="modal-header border-bottom-0">
        <h3 class="modal-title text-info">Delete Pant</h3> 
      </div>
      <div class="modal-body py-0">
		<div class="mt-2">
		<span>Bạn có muốn xóa sản phẩm <i class="fw-bold">${pant.name}</i> này không?</span>
			<div class="modal-footer flex-column border-top-0">
		
        <a href="/pant/delete/${pant.id}" class="btn btn-lg btn-primary w-100 mx-0 mb-2" >Yes</a>
    
        <button type="button" class="btn btn-lg btn-light w-100 mx-0"  data-bs-dismiss="modal">No</button>
        </div>
      </div>
      </div>
      
  
       
		</div>
      </div>
      
    </div>

<div class="modal fade py-5" tabindex="-1" role="dialog" id="updatePantModal_${pant.id}">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-6 shadow">
      <div class="modal-header border-bottom-0">
        <h3 class="modal-title text-info">Update Pant</h3> 
      </div>
      <div class="modal-body py-0">
        <form:form method="post" modelAttribute="pant"
	action = "/pant/update?id=${pant.id}" >
	 <input type="hidden" value="${pant.id}" />
		<div>
			<label class="form-label fw-bold">Name</label>
			<input type="text" name="name" class="form-control" value="${pant.name}" />
		</div>
		<div class="">
			<label class="form-label fw-bold">Quantity</label>
			<input type="number" name="quantity" class="form-control" value="${pant.quantity}"/>
		</div>
		<div class="">
			<label class="form-label fw-bold">Price</label>
			<input type="text" name="price"  class="form-control" value="${pant.price}"/>
		</div>
		<div class="">
			<label class="form-label fw-bold">Color</label>
			<input type="text" name="color" class="form-control" value="${pant.color}"/>
		</div>
		<div class="">
			<label class="form-label fw-bold">Size</label>
			<input type="text" name="size" class="form-control" value="${pant.size}"/>
		</div>
		<div class="">
		<label class="form-label fw-bold">Type</label>
			 <select name="cate"  class="form-select" >
			<c:forEach items="${ listCate }" var="cate">	
			<option  value="${cate.id}">		
				${cate.name}
				</option>	
				
			</c:forEach>
			</select>
			
		</div>
		<div class="mt-2">
			<div class="modal-footer flex-column border-top-0">
        <button type="submit" class="btn btn-lg btn-primary w-100 mx-0 mb-2">Save changes</button>
        <button type="button" class="btn btn-lg btn-light w-100 mx-0"type="button"   data-bs-dismiss="modal">Close</button>
      </div>
		</div>

</form:form> 
      </div>
      
    </div>
  </div>
</div>


			</c:forEach>
			
		</tbody>
	
	</table>
	</form>
	</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content rounded-6 shadow">
      <div class="modal-header border-bottom-0 row">
    
        <h3 class="modal-title text-info" id="exampleModalLabel">Add Pants</h3>
  <!--       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body py-0">
       <form:form 
		action="/pant/create"  method="post" modelAttribute="pant">
		<div class="col mt-2">
		
			<label class="form-label fw-bold">Name</label>
			<input type="text" name="name" class="form-control" />
		</div>
		<div class="col mt-2">
			<label class="form-label fw-bold">Quantity</label>
			<input type="number" name="quantity" class="form-control" />
	
		</div>
		
		<div class="col mt-2">
			<label class="form-label fw-bold">Price</label>
			<input type="number" name="price"  class="form-control"/>
		</div>
		<div class="col mt-2">
			<label class="form-label fw-bold">Color</label>
			<input type="text" name="color" class="form-control" />
		
		</div>
	
		<div class="col mt-2">
			<label class="form-label fw-bold">Size</label>
			<input type="text" name="size"  class="form-control"/>
		</div>
		
		<div class="row mt-2">
		<div class="col">
			<label class="form-label fw-bold">Type</label>
  			<select class="form-select" name="cate">
     		<option value="-" label="--Please Select"/>
     		<c:forEach items="${ listCate }" var="cate">
				<option value="${ cate.id }">
					${ cate.name }
				</option>
		</c:forEach>
    	 	
		</select>
		</div>
		
		</div>
	
	<div class="mt-2">
			<div class="modal-footer flex-column border-top-0">
        <button class="btn btn-lg btn-primary w-100 mx-0 mb-2">Save changes</button>
        <button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal">Close</button>
      </div>
		</div>
		

		
	</form:form>
      </div>
    </div>
  </div>
</div>
	<div>
		<span class="">Showing <span class="fw-bold">${currentPage} </span><span>out of </span><span class="fw-bold">${totalPages} </span><span>entries</span></span>
		<span class="float-end">
	<ul class="pagination">
	<c:choose>
	<c:when test="${currentPage > 1}">
	 <li class="page-item"><a class="page-link" href="/pant/page/${currentPage -1} ">Previous</a></li>
	</c:when>
	<c:otherwise><li class="page-item disable"><a class="page-link">Previous</a></li></c:otherwise>
	</c:choose>
	<c:forEach begin = "1" end= "${totalPages}" var="i">
	<c:choose>
	<c:when test="${i!=currentPage}">
	<li class="page-item"><a class="page-link" href="/pant/page/${i} ">${i}</a></li>
	</c:when>
	<c:otherwise><li class="page-item active "><a class="page-link">${i}</a></li></c:otherwise>
	</c:choose>
	</c:forEach>
	<c:choose>
	<c:when test="${currentPage < totalPages}">
	  <li class="page-item"><a class="page-link" href="/pant/page/${currentPage+1} ">Next</a></li>
	</c:when>
	<c:otherwise><li class="page-item disable"><a class="page-link">Next</a></li></c:otherwise>
	</c:choose>
	</ul>
	</span>
	</div>
	
	
	
	
<%-- </c:if> --%>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#chkBoxAll').click(function(){
		if($(this).is(":checked"))
		$('.chkCheckBoxId').prop('checked',true);
		else
			$('.chkCheckBoxId').prop('checked',false);
		
	});
	
});
</script>

	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>