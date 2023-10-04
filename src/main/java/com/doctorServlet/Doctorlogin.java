package com.doctorServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.Doctordao;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/doctorlogin")
public class Doctorlogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String email=req.getParameter("email");
	String password=req.getParameter("password");
		
		Doctordao dd=new Doctordao(Connectionclass.getConnection());
	Doctor doc=dd.doctorLogin(email, password);
	jakarta.servlet.http.HttpSession hs=req.getSession();
	if(doc!=null) {
		hs.setAttribute("doctor", doc);
		resp.sendRedirect("doctor/doctor.jsp");
	}else {
		hs.setAttribute("errmsg", "wrong email / password");
		resp.sendRedirect("doctor_login.jsp");
	}
	}

}
