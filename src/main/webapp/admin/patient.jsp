<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.Doctordao"%>
<%@page import="com.connc.Connectionclass"%>
<%@page import="com.dao.Appointmentdao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/css.jsp" %>

<style type="text/css">
.box{
padding: 20px;
margin:60px;
margin-top: 30px;
box-shadow: 0px 0px 10px grey;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="box">
<h3 style="text-align: center;">Patient Appointments</h3>
<table class="table">
  <thead>
    <tr>
       <th scope="col">Full Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Age</th>
      <th scope="col">Appointment Date</th>
      <th scope="col">Email</th>
      <th scope="col">Phone no</th>
       <th scope="col">Diseases</th>
        <th scope="col">Doctor Name</th>
        <th scope="col">Full Address</th>
        <th scope="col">Status</th> 
    </tr>
  </thead>
  <tbody>
  <%
  Doctordao dd=new Doctordao(Connectionclass.getConnection());
  Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection());
  List<Appointment>al=ad.getAppoints();
  for(Appointment a:al){
	  Doctor d=dd.getDoctorbyId(a.getDoctorid());
  %>
    <tr>
      <th scope="row"><%=a.getFullname() %></th>
      <td><%=a.getGender() %></td>
      <td><%=a.getAge() %></td>
      <td><%=a.getAppointmentdate() %></td>
      <td><%=a.getEmail() %></td>
      <td><%=a.getPhoneno() %></td>
      <td><%=a.getDiseases() %></td>
      <td><%=d.getFullname() %></td>
      <td><%=a.getFulladdress() %></td>
      <td>
      <%if("pending".equals(a.getStatus())){ %>
      <button class="btn btn-warning"><i class="fa-solid fa-pen-nib fa-lg" style="color: #121417;"></i> &nbsp Pending</button>
      <%}else{ %>
      <button class="btn btn-primary"><i class="fa-regular fa-circle-check fa-lg" style="color: #1b1c1d;"></i> &nbsp Done</button>
      <%} %>
      </td>
    </tr>
    <%} %>
    
     
  </tbody>
</table>
</div>
</body>
</html>