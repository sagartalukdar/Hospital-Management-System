package com.adminServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Adminlogout")
public class adminlogout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		jakarta.servlet.http.HttpSession hs=req.getSession();
		hs.removeAttribute("admin");
		hs.setAttribute("sucmsg", "admin loged out successfully");
		resp.sendRedirect("admin_login.jsp");
	}

}
