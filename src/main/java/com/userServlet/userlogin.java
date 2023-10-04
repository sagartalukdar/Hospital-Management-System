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
@WebServlet("/Userlogin")
public class userlogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		jakarta.servlet.http.HttpSession hs=req.getSession();
		userdao ud=new userdao(Connectionclass.getConnection());
		user u=ud.getLoginUser(email, password);
		if(u!=null) {
			hs.setAttribute("userobj", u);
			resp.sendRedirect("index.jsp");
		}else {
			hs.setAttribute("errmsg", "invalid email / password");
			resp.sendRedirect("user_login.jsp");
		}  
	}

}
