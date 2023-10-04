package com.adminServlet;

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
@WebServlet("/adddoctor")
public class Adddoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname=req.getParameter("fullname");
		String dob=req.getParameter("dob");
		String qualification=req.getParameter("qualification");
		String specialist=req.getParameter("specialist");
		String email=req.getParameter("email");
		String mob=req.getParameter("mob");
		String password=req.getParameter("password");
		
		Doctor d=new Doctor(fullname, dob, qualification, specialist, email, mob, password);
		
		Doctordao dd=new Doctordao(Connectionclass.getConnection());
		boolean b=dd.addDoctor(d);
		jakarta.servlet.http.HttpSession hs=req.getSession();
		if(b) {
			hs.setAttribute("sucmsg", "Doctor Added..");
			resp.sendRedirect("admin/doctor.jsp");
		}
		else {
			hs.setAttribute("errmsg", "Doctor not Added..");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}

}
