package com.userServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.userdao;
import com.entity.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class userRegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname=req.getParameter("fullname");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		user u=new user(fullname, email, password);
		userdao ud=new userdao(Connectionclass.getConnection());
		jakarta.servlet.http.HttpSession hs=req.getSession();
		boolean b=ud.userRegister(u);
		if(b) {
			hs.setAttribute("sucmsg", "Successfully registered");
			resp.sendRedirect("sign_up.jsp");
		}
		else {
			hs.setAttribute("errmsg", "not registered");
			resp.sendRedirect("sign_up.jsp");
		}
	}

}
