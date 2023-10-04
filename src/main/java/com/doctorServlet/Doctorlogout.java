package com.doctorServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/doctorlogout")
public class Doctorlogout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		jakarta.servlet.http.HttpSession hs=req.getSession();
		hs.removeAttribute("doctor");
		hs.setAttribute("sucmsg", "Doctor Logout Successfull");
		resp.sendRedirect("doctor_login.jsp");
	}

}
