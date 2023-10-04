package com.userServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Userlogout")
public class userlogout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		jakarta.servlet.http.HttpSession hs=req.getSession();
		hs.removeAttribute("userobj");
		hs.setAttribute("sucmsg", "user loged out successfully");
		resp.sendRedirect("user_login.jsp");
	}

}
