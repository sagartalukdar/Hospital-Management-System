<%@page import="com.connc.Connectionclass"%>
<%@page import="com.dao.Appointmentdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/css.jsp" %>

<style type="text/css">
.point-card{
box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container p-5" >
<p class="text-center fs-3">Admin Dashbord</p>

<%Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection()); %>
<c:if test="${not empty sucmsg }">
<p class="text-center text-success" style="font-size: 35px;">${sucmsg }</p>
<c:remove var="sucmsg"/>
</c:if>

<c:if test="${not empty errmsg }">
<p class="text-center text-danger"  style="font-size: 35px;">${errmsg }</p>
<c:remove var="errmsg"/>
</c:if>

<c:if test="${empty admin }">
<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>
<div class="row">
<div class="col-md-4">
<div class="card point-card">
<div class="card-body text-center text-success">
<i class="fa-solid fa-user-doctor fa-2xl" style="color: #2fe222;"></i>
<br>
<p class="fs-4 text-center">
Doctor <br> <%=ad.countDoctor() %>
</p>
</div>
</div>
</div>

<div class="col-md-4">
<div class="card point-card">
<div class="card-body text-center text-success">
<i class="fa-solid fa-users fa-2xl" style="color: #161718;"></i>

<br>
<p class="fs-4 text-center">
User <br> <%=ad.countUser() %>
</p>
</div>
</div>
</div>



<div class="col-md-4">
<div class="card point-card">
<div class="card-body text-center text-success">
<i class="fa-solid fa-calendar-check fa-2xl" style="color: #f04005;"></i>

<br>
<p class="fs-4 text-center">
Total Appoitment <br> <%=ad.countAppointment() %>
</p>
</div>
</div>
</div>



<div class="col-md-4 mt-4" style="margin: auto;" data-bs-toggle="modal" data-bs-target="#exampleModal">
<div class="card point-card">
<div class="card-body text-center text-success">
<i class="fa-solid fa-user-nurse fa-2xl" style="color: #1aff53;"></i>

<br>
<p class="fs-4 text-center">
Speacialist<br> <%=ad.countSpecialist() %>
</p>
</div>
</div>
</div>
</div>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="../addspecialist" method="post">
      <div class="form-group">
      <label>Add Spaecialist name</label>
      <input type="text" name="name" class="form-control">
      </div>
      <div class="text-center mt-3">
      <button type="submit" class="btn btn-primary">Add</button>
      </div>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>
</body>
</html>