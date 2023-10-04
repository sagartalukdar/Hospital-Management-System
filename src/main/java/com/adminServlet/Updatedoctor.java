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
@WebServlet("/updatedoctor")
public class Updatedoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String fullname=req.getParameter("fullname");
		String dob=req.getParameter("dob");
		String qualification=req.getParameter("qualification");
		String specialist=req.getParameter("specialist");
		String email=req.getParameter("email");
		String mob=req.getParameter("mob");
		String password=req.getParameter("password");
		
		Doctor d=new Doctor(fullname, dob, qualification, specialist, email, mob, password);
		d.setId(id);
		Doctordao dd=new Doctordao(Connectionclass.getConnection());
		boolean b=dd.updateDoctor(d);
		jakarta.servlet.http.HttpSession hs=req.getSession();
		if(b) {
			hs.setAttribute("upsucmsg"," Doctor successfully updated ");
			resp.sendRedirect("admin/doctor.jsp");
		}
		else {
			hs.setAttribute("uperrmsg"," Doctor not updated ");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}

}
