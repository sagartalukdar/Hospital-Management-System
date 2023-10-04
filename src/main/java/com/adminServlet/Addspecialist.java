package com.adminServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.Specialistdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/addspecialist")
public class Addspecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		Specialistdao sd=new Specialistdao(Connectionclass.getConnection());
		boolean b=sd.addSpecialist(name);
		jakarta.servlet.http.HttpSession hs=req.getSession();
		if(b) {
			hs.setAttribute("sucmsg", "specialist added");
			resp.sendRedirect("admin/index.jsp");
		}else {
			hs.setAttribute("errmsg", "specialist not added");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
