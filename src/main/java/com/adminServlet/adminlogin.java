package com.adminServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.entity.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Adminlogin")
public class adminlogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String email=req.getParameter("email");
	 String password=req.getParameter("password");
	 
	 jakarta.servlet.http.HttpSession hs=req.getSession();
	 if("admin@gmail.com".equals(email) && "admin".equals(password)) {
		 hs.setAttribute("admin", new user());
		 resp.sendRedirect("admin/index.jsp");
	 }else {
		 hs.setAttribute("errmsg","invalid email ,password");
		 resp.sendRedirect("admin_login.jsp");
	 }
	}

}
