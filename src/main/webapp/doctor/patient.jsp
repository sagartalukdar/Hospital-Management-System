
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.connc.Connectionclass"%>
<%@page import="com.dao.Appointmentdao"%>
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
</head>
<body>
<c:if test="${empty doctor }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp" %>

<div class="item" style="padding: 20px;margin-top: 30px;margin-left:90px; box-shadow: 0px 0px 10px grey;margin-bottom:20px; width: 1100px;">
<h2 style="text-align: center; "> Patient Appointment List</h2>

<c:if test="${not empty sucmsg }">
<h3 style="text-align: center; color: green;">${sucmsg }</h3>
<c:remove var="sucmsg"/>
</c:if>

<c:if test="${not empty errmsg }">
<h3 style="text-align: center; color: red;">${errmsg }</h3>
<c:remove var="errmsg"/>
</c:if>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Full Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Age</th>
      <th scope="col">Appointment Date</th>
       <th scope="col">Email</th>
       <th scope="col">Phone No</th>
       <th scope="col">Diseases</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th> 
    </tr>
  </thead>
  <tbody>
  <%
  Doctor d=(Doctor)session.getAttribute("doctor");
  Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection());
  List<Appointment>al=ad.getAppointsbydoctorid(d.getId());
  for(Appointment a:al){
  %>
   <tr>
      <th scope="row"><%=a.getFullname() %></th>
      <td><%=a.getGender() %></td>
      <td><%=a.getAge() %></td>
      <td><%=a.getAppointmentdate() %></td>
      <td><%=a.getEmail() %></td>
      <td><%=a.getPhoneno() %></td>
      <td><%=a.getDiseases() %></td>
      <td>
      <%if("pending".equals(a.getStatus())){ %>
      <button class="btn btn-warning"><i class="fa-solid fa-pen-nib fa-lg" style="color: #121417;"></i> &nbsp Pending</button>
      <%}else{ %>
      <button class="btn btn-primary"><i class="fa-regular fa-circle-check fa-lg" style="color: #1b1c1d;"></i> &nbsp Done</button>
      <%} %>
      </td>
      
      <td>
      <%
      if("pending".equals(a.getStatus())){%>
        <a href="comment.jsp?id=<%=a.getId() %>" class="btn btn-success"><i class="fa-solid fa-comment-dots fa-lg" style="color: #f4f6fb;"></i>&nbsp Comment</a>
       <%}else{ %>
    	   <a href="#" class="btn btn-success disabled"><i class="fa-solid fa-comment-dots fa-lg" style="color: #f4f6fb;"></i>&nbsp Comment</a>
            
      <%} %> 
           
      </td>
     </tr>
    <%} %> 
     </tbody>
</table>
</div>

</body>
</html>