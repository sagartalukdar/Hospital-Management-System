<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.entity.user" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/css.jsp" %>
<style type="text/css">
.box{
width:350px;
margin:auto;
margin-top:20px;
padding: 30px;
box-shadow: 0px 0px 12px grey;
}
</style>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="user_login.jsp"></c:redirect>
</c:if>
<div class="box">
<%user u=(user)session.getAttribute("userobj"); %>
<form action="changepassword" method="post">
<h4 style="text-align: center;">Want to Change Password ?</h4>

<c:if test="${not empty sucmsg }">
<p class="text-center text-success">"${sucmsg }"</p>
<c:remove var="sucmsg"/>
</c:if>

<c:if test="${not empty errmsg }">
<p class="text-center text-danger">"${errmsg }"</p>
<c:remove var="errmsg"/>
</c:if>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"></label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="enter old password" name="oldpassword">
   </div>
   
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label"></label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="enter new password" name="newpassword">
  </div>
  
  <input type="hidden" name="uid" value="<%=u.getId()%>">
  <button type="submit" class="btn btn-dark" style="width: 290px;"><i class="fa-solid fa-key fa-lg" style="color: #f7f9fd;"></i>&nbsp Change password</button>
</form>
</div>
</body>
</html>