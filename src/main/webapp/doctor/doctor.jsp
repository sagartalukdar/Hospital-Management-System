<%@page import="com.entity.Doctor"%>
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

.grid-box{
display: grid;
grid-template-columns:1fr 1fr;

}
.item{

height: 150px;
width: 300px;
margin-top: 40px;
box-shadow: 0px 0px 20px grey;
border-radius: 15px;
padding: 10px;
}
</style>
</head>
<body>
<%Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection()); 
Doctor d=(Doctor)session.getAttribute("doctor");
%>
<c:if test="${empty doctor }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp" %>
<h2 style="text-align: center;margin-top: 50px;color: blue;">Doctor DashBoard</h2>
<div class="grid-box">

<div class="item" style="margin-left: 300px;">
<h3 style="text-align: center;color:black;justify-content: center;"><i class="fa-solid fa-stethoscope"></i><br>Doctor <br><%=ad.countDoctor() %></h3>
</div>
<div class="item">
<h3 style="text-align: center;color:black; center;"><i class="fa-solid fa-calendar-check"></i><br>Total Appointment<br><%=ad.countAppointmentbydoctorid(d.getId()) %></h3>

</div>
</div>

</body>
</html>