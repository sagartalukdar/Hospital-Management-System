<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.Doctordao"%>
<%@page import="com.dao.Specialistdao"%>
<%@page import="com.connc.Connectionclass"%>
<%@page import="com.entity.Specialist"%>
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
<%@include file="../components/css.jsp" %>
<style type="text/css">

.box{
display: grid;
grid-template-columns:1fr 3fr;
margin:10px;
grid-column-gap:20px;
padding: 10px;
}

.item{
box-shadow: 0px 0px 10px ;
padding: 5px;
border-radius: 10px;
}

</style>
</head>
<body>
<%@include file="navbar.jsp" %>


<div class="box"  >

<div class="item" >

<h2 style="text-align: center; margin-top: 10px;">Add Doctor</h2>


<c:if test="${not empty sucmsg }">
<p class="text-center text-success" style="font-size: 35px;">${sucmsg }</p>
<c:remove var="sucmsg"/>
</c:if>

<c:if test="${not empty errmsg }">
<p class="text-center text-danger"  style="font-size: 35px;">${errmsg }</p>
<c:remove var="errmsg"/>
</c:if>
<form action="../adddoctor" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="fullname">
   </div>
   
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Date of Birth</label>
    <input type="date" class="form-control" id="exampleInputPassword1" name="dob">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Qualification</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="qualification">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Specialist</label>
    <select name="specialist">
    <option selected>Select Specialist</option>
     <%
     Specialistdao sd=new Specialistdao(Connectionclass.getConnection());
    List<Specialist> ls=sd.getAllSpecialist();
    for(Specialist s:ls){  		
     %>
         <option><%=s.getName() %></option>
     <%} %>
     
    </select>
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Email</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="email">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Mob no</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="mob">
    </div>
    
      <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="password">
  </div>
  
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

</div>

<div class="item" >
<h2 style="text-align: center; margin-top: 10px;">Doctor Details</h2>

<c:if test="${not empty upsucmsg }">
<p class="text-center text-success" style="font-size: 35px;">${upsucmsg }</p>
<c:remove var="upsucmsg"/>
</c:if>

<c:if test="${not empty uperrmsg }">
<p class="text-center text-danger"  style="font-size: 35px;">${uperrmsg }</p>
<c:remove var="uperrmsg"/>
</c:if>
<table class="table">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Full Name</th>
      <th scope="col">Date of Birth</th>
      <th scope="col">Qualification</th>
      <th scope="col">Specialist</th>
      <th scope="col">Email</th>
      <th scope="col">Mob</th>
      <th scope="col">Password</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   
    <%Doctordao dd=new Doctordao(Connectionclass.getConnection());
    List<Doctor>dl=dd.getAllDoctor();
    for(Doctor d:dl){
    %>
     <tr>
      <th scope="row"><%=d.getId() %></th>
      <td><%=d.getFullname() %></td>
      <td><%=d.getDob() %></td>
      <td><%=d.getQualification() %></td>
      <td><%=d.getSpecialist() %></td>
      <td><%=d.getEmail() %></td>
      <td><%=d.getMob() %></td>
      <td><%=d.getPassword() %></td>
      <td><a href="edit.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
      
      <a href="../delete?id=<%=d.getId() %>" class="btn btn-sm btn-danger ms-1" style="margin-top: 5px;"><i class="fa-solid fa-trash-can"></i></a>
      </td>
     
    </tr>
  
    <%} %>
    
    
  </tbody>
</table>
</div>
</div>

</body>
</html>