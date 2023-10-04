package com.doctorServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.Appointmentdao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/updatestatus")
public class Updatestatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		int did=Integer.parseInt(req.getParameter("did"));
		String comment=req.getParameter("comment");
		
		Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection());
		
	    jakarta.servlet.http.HttpSession hs=req.getSession();
	    if(ad.updateStatus(id, did, comment)) {
	    	hs.setAttribute("sucmsg", "status Updated");
	    	resp.sendRedirect("doctor/patient.jsp");
	    }else {
	    	hs.setAttribute("errmsg", "status not Updated");
	    	resp.sendRedirect("doctor/patient.jsp");
	    }
	}

}
