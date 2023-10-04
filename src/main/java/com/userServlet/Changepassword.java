package com.userServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.userdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/changepassword")
public class Changepassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldpassword=req.getParameter("oldpassword");
		String newpassword=req.getParameter("newpassword");
		
		userdao ud=new userdao(Connectionclass.getConnection());
		jakarta.servlet.http.HttpSession hs=req.getSession();
		if(ud.changePassword(uid, oldpassword, newpassword)) {
			hs.setAttribute("sucmsg", "password Changed");
			resp.sendRedirect("changepassword.jsp");
		}
		else {
			hs.setAttribute("errmsg", "enter correct old password");
			resp.sendRedirect("changepassword.jsp");
		}
		
	}

}
