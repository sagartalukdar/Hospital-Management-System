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
@WebServlet("/editprofile")
public class Editprofile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int did=Integer.parseInt(req.getParameter("did"));
		String fullname=req.getParameter("fullname");
		String dob=req.getParameter("dob");
		String qualification=req.getParameter("qualification");
		String specialist=req.getParameter("specialist");
		String email=req.getParameter("email");
		String phoneno=req.getParameter("phoneno");
		
		Doctor d=new Doctor(fullname, dob, qualification, specialist, email, phoneno,"");
		d.setId(did);
		Doctordao dd=new Doctordao(Connectionclass.getConnection());
		jakarta.servlet.http.HttpSession hs=req.getSession();
		if(dd.updateDoctorwithoutpassword(d)) {
		
			hs.setAttribute("sucmsg", "profile updated");
			Doctor updoc=dd.getDoctorbyId(d.getId());
			hs.setAttribute("updatedoctor",updoc );
			resp.sendRedirect("doctor/editprofile.jsp");
		}else {
			hs.setAttribute("errmsg", "profile not updated ");
			resp.sendRedirect("doctor/editprofile.jsp");
		}
	}

}
