package com.doctorServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.Doctordao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/changedoctorpassword")
public class Changedoctorpassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int did=Integer.parseInt(req.getParameter("did"));
		String op=req.getParameter("oldpassword");
		String np=req.getParameter("newpassword");
		
		Doctordao dd=new Doctordao(Connectionclass.getConnection());
		jakarta.servlet.http.HttpSession hs=req.getSession();
		if(dd.changeDoctorPassword(did, op, np)) {
			hs.setAttribute("sucmsg", "password Changed");
			resp.sendRedirect("doctor/editprofile.jsp");
		}else {
			hs.setAttribute("errmsg", "enter correct old password ");
			resp.sendRedirect("doctor/editprofile.jsp");	
		}
	}

}
