         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"> </i>&nbsp Medical center</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
             <c:if test="${empty userobj }">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i>&nbsp ADMIN</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor_login.jsp"><i class="fa-solid fa-stethoscope"></i>&nbsp DOCTOR</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp"><i class="fa-solid fa-calendar-check"></i>&nbsp APPOINTMENT</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_login.jsp"><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i>&nbsp USER</a>
        </li>
      </c:if>
      
        
        <c:if test="${not empty userobj}">
           <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp"><i class="fa-solid fa-calendar-check"></i>&nbsp APPOINTMENT</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="viewappointment.jsp"><i class="fa-solid fa-calendar-check"></i>&nbsp VIEW APPOINTMENT</a>
        </li>
        
        <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    <i class="fa-regular fa-user fa-lg" style="color: #f5f7f9;"></i>&nbsp ${userobj.fullname }
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="changepassword.jsp"><i class="fa-solid fa-unlock fa-sm"></i>&nbsp Change password</a></li>
    <li><a class="dropdown-item" href="Userlogout">Logout &nbsp<i class="fa-solid fa-right-from-bracket fa-sm"></i></a></li>

  </ul>
</div>
        </c:if>
      
      </ul>
     
    </div>
  </div>
</nav>