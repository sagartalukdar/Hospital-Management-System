
<%@page import="com.connc.Connectionclass"%>
<%@page import="com.dao.Doctordao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/css.jsp" %>

<style type="text/css">

.grid-box{
display: grid;
grid-template-columns:1fr 3fr;
grid-column-gap:19px;
}
.fr{
display: grid;
grid-template-columns:1fr 1fr;
grid-column-gap:19px;
}
</style>

</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="box" >

<div >
<img alt="" src="https://media.istockphoto.com/id/1398625179/photo/glass-window-building-of-new-office-space.jpg?s=1024x1024&w=is&k=20&c=tmAbOHMJ8GmaEI96c4SNjD7PlLPitYJ18-kqfj6afkE=" style="height: 300px;width: 100%;">
</div>

<div class="grid-box" >

<div class="item" >
<img alt="" src="https://media.istockphoto.com/id/461162217/photo/doctor.jpg?s=1024x1024&w=is&k=20&c=wi2ElQohAqQjQDc5RgXS8PL7onTv1gS7qULc6cwECDo=" style="width: 300px;height: 500px;margin-left: 100px;">
</div>

<div class="item" style="padding: 15px;margin-top: 12px;box-shadow: 0px 0px 10px grey;margin-right: 32px;border-radius: 15px;">
<h2 style="text-align: center;"> User Appointment</h2>

<c:if test="${not empty sucmsg }">
<h3 style="text-align: center; color: green;">${sucmsg }</h3>
<c:remove var="sucmsg"/>
</c:if>
<c:if test="${not empty errmsg }">
<h3 style="text-align: center; color: red;">${errmsg }</h3>
<c:remove var="errmsg"/>
</c:if>
<form action="appointmentservlet" method="post" >

<input type="hidden" name="userid" value="${userobj.id }">
<div class="fr">
<div class="form1">

 <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="fullname">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Age</label>
    <input type="number" class="form-control" id="exampleInputPassword1" name="age">
  </div>
  
   <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Email</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="email">
  </div>
  
   <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Diseases</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="diseases">
  </div>
  
</div>

<div class="form2">

 <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Gender</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="gender">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Appointment Date</label>
    <input type="date" class="form-control" id="exampleInputPassword1" name="appointmentdate">
  </div>

    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Phone no</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="phoneno">
  </div>
  
   <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label"  style="margin-top: 10px;">Doctor</label >
    <select name="doctor">
    <option selected="selected"> --Select-- </option>
    <%Doctordao dd=new Doctordao(Connectionclass.getConnection());
     List<Doctor>dl=dd.getAllDoctor();
     for(Doctor d:dl){
    %>
    <option value="<%=d.getId()%>"><%=d.getFullname() %> (<%=d.getSpecialist() %>)</option>
    <%} %>
    </select>
  </div>

</div>
</div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Full Address</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="fulladdress" style="height: 100px;">
  </div>
  
    <c:if test="${empty userobj }">
    <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Please login first</a>
    </c:if>
   <c:if test="${not empty userobj }">
  <button type="submit" class="btn btn-primary">Submit</button>
  </c:if>
  
</form>
</div>

</div>

</div>
</body>
</html>