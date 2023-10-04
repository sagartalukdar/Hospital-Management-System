package com.appointmentServlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.connc.Connectionclass;
import com.dao.Appointmentdao;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/appointmentservlet")
public class Appointmentservlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid=Integer.parseInt(req.getParameter("userid"));
	    String fullname=req.getParameter("fullname");
	    String gender=req.getParameter("gender");
	    String age=req.getParameter("age");
	    String appointmentdate=req.getParameter("appointmentdate");
	    String email=req.getParameter("email");
	    String phoneno=req.getParameter("phoneno");
	    String diseases=req.getParameter("diseases");
	    int doctorid=Integer.parseInt(req.getParameter("doctor"));
	    String fulladdress=req.getParameter("fulladdress");
	    
	    Appointment a=new Appointment(userid, fullname, gender, age, appointmentdate, email, phoneno, diseases, doctorid, fulladdress, "pending");
	    
	    Appointmentdao ad=new Appointmentdao(Connectionclass.getConnection());
	    jakarta.servlet.http.HttpSession hs=req.getSession();
	    if(ad.addAppointment(a)) {
	    	hs.setAttribute("sucmsg", "appointment successfull");
	    	resp.sendRedirect("user_appointment.jsp");
	    }else {
	    	hs.setAttribute("errmsg", "appointment unsuccessfull");
	    	resp.sendRedirect("user_appointment.jsp");
	    }
	}

}
