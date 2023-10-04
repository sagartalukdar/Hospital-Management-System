<%@page import="com.dao.Doctordao"%>
<%@page import="com.connc.Connectionclass"%>
<%@page import="com.dao.Appointmentdao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.user"%>

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
grid-template-columns:3fr 1fr;

}

</style>

</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="box" >

<div class="backimg">
<img alt="" src="https://media.istockphoto.com/id/1398625179/photo/glass-window-building-of-new-office-space.jpg?s=1024x1024&w=is&k=20&c=tmAbOHMJ8GmaEI96c4SNjD7PlLPitYJ18-kqfj6afkE=" style="height: 300px;width: 100%;">
</div>

<div class="grid-box" >

<div class="item" style="padding: 20px;margin-top: 30px;margin-left:50px; box-shadow: 0px 0px 10px grey;margin-bottom:20px; width: 1000px;">
<h2 style="text-align: center;"> Appointment List</h2>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Full Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Age</th>
      <th scope="col">Appointment Date</th>
       <th scope="col">Diseases</th>
        <th scope="col">Doctor Name</th>
        <th scope="col">Status</th> 
    </tr>
  </thead>
  <tbody>
  <%
  
  user u=(user)session.getAttribute("userobj");
  Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection());
  Doctordao dd=new Doctordao(Connectionclass.getConnection());
  List<Appointment> al=ad.getAppointsbyuserid(u.getId());
  for(Appointment a:al){
  Doctor d=dd.getDoctorbyId(a.getDoctorid());
  %>
	  
	  <tr>
      <th scope="row"><%=a.getFullname() %></th>
      <td><%=a.getGender() %></td>
      <td><%=a.getAge() %></td>
      <td><%=a.getAppointmentdate() %></td>
      <td><%=a.getDiseases() %></td>
      <td><%=d.getFullname() %></td>
       <td>
        <%if("pending".equals(a.getStatus())){ %>
      <button class="btn btn-warning"><i class="fa-solid fa-pen-nib fa-lg" style="color: #121417;"></i> &nbsp Pending</button>
      <%}else{ %>
      <button class="btn btn-primary"><i class="fa-regular fa-circle-check fa-lg" style="color: #1b1c1d;"></i> &nbsp Done</button>
      <%} %>
      
       </td>
    </tr>
	  
  <%}
  %>
 
   
  </tbody>
</table>

</div>

<div class="doctorimg" >
<img alt="" src="https://purepng.com/public/uploads/large/purepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctornotepad-1421526857009zrma0.png" style="width: 200px;height: 300px; ">
</div>

</div>

</div>
</body>
</html>