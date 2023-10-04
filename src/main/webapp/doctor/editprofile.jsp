<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dao.Specialistdao"%>
<%@page import="com.connc.Connectionclass"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
    
    <%@page import="com.entity.Doctor" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/css.jsp" %>
<style type="text/css">
.box{
width:350px;
height:350px;
margin-left:50px;
margin-top:20px;
padding: 30px;
box-shadow: 0px 0px 15px grey;
border-radius: 20px;
}
.pbox{
display: grid;
grid-template-columns:1fr 2fr;
}
.edit{
margin-left:80px;
margin-top:20px;
margin-right:80px;
padding: 30px;
box-shadow: 0px 0px 15px grey;
border-radius: 20px;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty doctor }">
<c:redirect url="doctor_login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty sucmsg }">
<h3 class="text-center text-success" style="margin-top: 20px;">${sucmsg }</h3>
<c:remove var="sucmsg"/>
</c:if>

<c:if test="${not empty errmsg }">
<h3 class="text-center text-danger" style="margin-top: 20px;">${errmsg }</h3>
<c:remove var="errmsg"/>
</c:if>

<div class="pbox">
<%Doctor d=(Doctor)session.getAttribute("doctor"); %>
<div class="box">

<form action="../changedoctorpassword" method="post">
<h4 style="text-align: center;">Want to Change Password ?</h4>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"></label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="enter old password" name="oldpassword">
   </div>
   
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label"></label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="enter new password" name="newpassword">
  </div>
  
  <input type="hidden" name="did" value="<%=d.getId()%>">
  <button type="submit" class="btn btn-dark" style="width: 290px;"><i class="fa-solid fa-key fa-lg" style="color: #f7f9fd;"></i> &nbsp Change password</button>
</form>
</div>

<div class="edit">
<form action="../editprofile" method="post">
<h4 style="text-align: center;">Edit Profile</h4>


  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="fullname" value="<%=d.getFullname() %>">
   </div>
   
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Date of Birth</label>
    <input type="date" class="form-control" id="exampleInputPassword1"  name="dob" value="<%=d.getDob()%>">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Qualification</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="qualification" value="<%=d.getQualification()%>">
   </div>
   
   <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Specialist</label>
    <select name="specialist" >
  
    <option selected>Select Specialist</option>
     <%
     Specialistdao sd=new Specialistdao(Connectionclass.getConnection());
    List<Specialist> ls=sd.getAllSpecialist();
    for(Specialist s:ls){  		
     %>
         <option value="<%=s.getName()%>"><%=s.getName() %></option>
     <%} %>
     
    </select>
  </div>
   
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="email" value="<%=d.getEmail() %>">
   </div>
   
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Phone no</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="phoneno" value="<%=d.getMob() %>">
   </div>
  
  <input type="hidden" name="did" value="<%=d.getId()%>">
  <button type="submit" class="btn btn-primary"  >Submit</button>
</form>
</div>

</div>
</body>
</html>