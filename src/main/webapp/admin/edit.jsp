<%@page import="com.connc.Connectionclass"%>
<%@page import="com.dao.Doctordao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.dao. Specialistdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/css.jsp" %>

<style type="text/css">
.item{
box-shadow: 0px 0px 10px ;
padding: 15px;
border-radius: 10px;
width: 45%;
margin: auto;
margin-top: 15px;
}

</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<%
Doctordao dd=new Doctordao(Connectionclass.getConnection());
int id=Integer.parseInt(request.getParameter("id"));
Doctor d=dd.getDoctorbyId(id);
%>

<div class="item" >

<h2 style="text-align: center; margin-top: 10px;">Edit Doctor</h2>



<form action="../updatedoctor" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="fullname" value="<%=d.getFullname()%>">
   </div>
   
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Date of Birth</label>
    <input type="date" class="form-control" id="exampleInputPassword1" name="dob" value="<%=d.getDob() %>">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Qualification</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="qualification" value="<%=d.getQualification() %>">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label" >Specialist</label>
    <select name="specialist">
    <option selected><%=d.getSpecialist() %></option>
    <%
    Specialistdao sd=new Specialistdao(Connectionclass.getConnection());
    List<Specialist> sl=sd.getAllSpecialist();		
    for(Specialist s:sl){		
    %>
      <option><%=s.getName() %></option>
    <%} %>
     
    </select>
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Email</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="email" value="<%=d.getEmail() %>">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Mob no</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="mob" value="<%=d.getMob() %>">
    </div>
    
      <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="password" value="<%=d.getPassword() %>">
  </div>
  
  <input type="hidden" name="id" value="<%=d.getId() %>">
  <button type="submit" class="btn btn-primary">Update</button>
</form>

</div>

</body>
</html>