<%@page import="com.entity.Appointment"%>
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
.backimg img{
height: 50vh;
width: 100%;
background: cover no-repeat;
opacity: 0.7;
}

.box{
padding: 60px;
box-shadow: 0px 0px 12px grey;
margin: 300px;
margin-top: 30px;
}
.db{
display: grid;
grid-template-columns:1fr 1fr;
grid-column-gap:45px;
margin-top: 40px;
}
</style>
</head>
<body>

<c:if test="${empty doctor }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>


<div class="backimg">
<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Vlkt2V1VC1j-fKsnwBxJuX8_hr5-rulGeQ&usqp=CAU">
</div>


<div class="box">
<h3 style="text-align: center;"> Comments </h3>

<form action="../updatestatus" method="post">

<%
int id=Integer.parseInt(request.getParameter("id"));
Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection());
Appointment a=ad.getAppointsbyid(id);
%>
<div class="db" >
<div  class="item">

<div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Patient Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="patientname" value="<%=a.getFullname()%>">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Phone no</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="phoneno" value="<%=a.getPhoneno()%>">
  </div>
   
</div>

<div class="item">

<div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Patient Age</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="age" value="<%=a.getAge()%>">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Diseases</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="diseases" value="<%=a.getDiseases()%>">
  </div>

</div>

</div>
<h5>Comment</h5>
<textarea rows="5" cols="60" name="comment"></textarea>

<input type="hidden" name="id" value="<%=a.getId() %>">
<input type="hidden" name="did" value="<%=a.getDoctorid() %>">

<button class="btn btn-primary" style="width: 250px; align-self: center;">Submit</button>
</form>

</div>

</body>
</html>