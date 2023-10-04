package com.adminServlet;

import java.io.IOException;

import com.connc.Connectionclass;
import com.dao.Doctordao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/delete")
public class Deletedoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id=Integer.parseInt(req.getParameter("id"));
	Doctordao dd=new Doctordao(Connectionclass.getConnection());
	boolean b=dd.delete(id);
	jakarta.servlet.http.HttpSession hs=req.getSession();
	if(b) {
		hs.setAttribute("upsucmsg"," Doctor successfully deleted ");
		resp.sendRedirect("admin/doctor.jsp");
	}
	else {
		hs.setAttribute("uperrmsg"," Doctor not deleted ");
		resp.sendRedirect("admin/doctor.jsp");
	}
	}

}
