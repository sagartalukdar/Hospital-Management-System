
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
     
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="../index.jsp"><i class="fa-solid fa-house-medical"> </i>&nbsp Medical center</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor.jsp"><i class="fa-solid fa-right-to-bracket"></i>&nbsp HOME</a>
        </li>
                
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="patient.jsp"><i class="fa-solid fa-bed fa-2xl" style="color: #fcff33;"></i>&nbsp PATIENT</a>
        </li>
        
      
      </ul>
      
      <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
<i class="fa-solid fa-user-doctor fa-2xl" style="color: #fbfcfe;"></i>${doctor.fullname }&nbsp &nbsp
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
       <li><a class="dropdown-item" href="editprofile.jsp"><i class="fa-solid fa-pen"></i>Edit profile</a></li>
     
    <li><a class="dropdown-item" href="../doctorlogout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a></li>
    
  </ul>
</div>
     
    </div>
  </div>
</nav>