<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/css.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>

<style type="text/css">
.point-card{
box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/pexels-photo-3279203.jpeg" class="d-block w-100" alt="..."height="400px">
    </div>
    <div class="carousel-item">
      <img src="img/pexels-photo-7108145.jpeg" class="d-block w-100" alt="..."height="400px">
    </div>
    <div class="carousel-item">
      <img src="img/photo-1532938911079-1b06ac7ceec7.avif" class="d-block w-100" alt="..." height="400px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

 <div class="container p-3" >
  <p class="text-center fs-2">Key Features of Our Hospital</p>
  <div class="row">
  <div class="col-md-8 p-5">
  <div class="row">
  <div class="col-md-6">
  <div class="card point-card">
  <div class="card-body">
  <p class="fs-5">Safe Occurence</p>
  <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." </p>
  </div>
  </div>
  </div>
  
  <div class="col-md-6">
  <div class="card point-card">
  <div class="card-body">
  <p class="fs-5">Our Environment</p>
  <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." </p>
  </div>
  </div>
  </div>
  
  <div class="col-md-6 mt-2">
  <div class="card point-card">
  <div class="card-body">
  <p class="fs-5">Doctors</p>
  <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." </p>
  </div>
  </div>
  </div>
  
  <div class="col-md-6 mt-2">
  <div class="card point-card">
  <div class="card-body">
  <p class="fs-5">Medical Fields</p>
  <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." </p>
  </div>
  </div>
  </div>
  
  </div>
  </div>
  
  <div class="col-md-4">
  <img src="img/pexels-photo-6303777.jpeg" height=800px width=400px>
  </div>
  </div>
  </div>
  
  <hr>
  
  <div clas="container p-2">
  <p class="text-center fs-2"> Our Team</p>
  <div class="row">
  <div class="col-md-3">
  <div class="card point-card">
  <div class="card-body text-center">
  <img src="img/d1.webp" height=150px,width=120px>
  <p class="fw-bold fs-5">Mr gsf</p>
   <p class="fs-7"> gbsgbgb sa</p>
  </div>
  </div>
  </div>
  
   <div class="col-md-3">
  <div class="card point-card">
  <div class="card-body text-center">
  <img src="img/d2.jpeg" height=150px,width=120px>
  <p class="fw-bold fs-5">Mr mdbd</p>
   <p class="fs-7"> jh3gjev</p>
  </div>
  </div>
  </div>
  
    <div class="col-md-3">
  <div class="card point-card">
  <div class="card-body text-center">
  <img src="img/d3.jpeg" height=150px,width=120px>
  <p class="fw-bold fs-5"> Rbndeb</p>
   <p class="fs-7"> ab j n jdb</p>
  </div>
  </div>
  </div>
  
    <div class="col-md-3">
  <div class="card point-card">
  <div class="card-body text-center">
  <img src="img/d4.jpeg" height=150px,width=120px>
  <p class="fw-bold fs-5">mhukh</p>
   <p class="fs-7"> k  diuedh </p>
  </div>
  </div>
  </div>
  
  </div>
  </div>
<%@include file="components/footer.jsp" %>
</body>
</html>
