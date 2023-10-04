package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class Appointmentdao {
 private Connection con;

public Appointmentdao(Connection con) {
	super();
	this.con = con;
}
 public boolean addAppointment(Appointment a) {
	 boolean b=false;
	 try {
		PreparedStatement ps=con.prepareStatement("insert into appointment (userid,fullname,gender,age,appointmentdate,email,phoneno,diseases,doctorid,fulladdress,status) values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,a.getUserid() );
		ps.setString(2, a.getFullname());
		ps.setString(3, a.getGender());
		ps.setString(4, a.getAge());
		ps.setString(5, a.getAppointmentdate());
		ps.setString(6, a.getEmail());
		ps.setString(7, a.getPhoneno());
		ps.setString(8, a.getDiseases());
		ps.setInt(9, a.getDoctorid());
		ps.setString(10, a.getFulladdress());
		ps.setString(11, a.getStatus());
		int a1=ps.executeUpdate();
		if(a1==1)b=true;;
	} catch (Exception e) {
		System.out.print(e);
	}
	 return b;
 }
 
 public List<Appointment> getAppointsbyuserid(int id){
	 List<Appointment>al=new ArrayList<>();
	 Appointment a=null;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from appointment where userid=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			a=new Appointment();
			a.setId(rs.getInt(1));
			a.setUserid(rs.getInt(2));
			a.setFullname(rs.getString(3));
			a.setGender(rs.getString(4));
			a.setAge(rs.getString(5));
			a.setAppointmentdate(rs.getString(6));
			a.setEmail(rs.getString(7));
			a.setPhoneno(rs.getString(8));
			a.setDiseases(rs.getString(9));
			a.setDoctorid(rs.getInt(10));
			a.setFulladdress(rs.getString(11));
			a.setStatus(rs.getString(12));
			al.add(a);
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return al;
 }
 
 public List<Appointment> getAppointsbydoctorid(int id){
	 List<Appointment>al=new ArrayList<>();
	 Appointment a=null;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from appointment where doctorid=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			a=new Appointment();
			a.setId(rs.getInt(1));
			a.setUserid(rs.getInt(2));
			a.setFullname(rs.getString(3));
			a.setGender(rs.getString(4));
			a.setAge(rs.getString(5));
			a.setAppointmentdate(rs.getString(6));
			a.setEmail(rs.getString(7));
			a.setPhoneno(rs.getString(8));
			a.setDiseases(rs.getString(9));
			a.setDoctorid(rs.getInt(10));
			a.setFulladdress(rs.getString(11));
			a.setStatus(rs.getString(12));
			al.add(a);
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return al;
 }
 
 public Appointment getAppointsbyid(int id){

	 Appointment a=null;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from appointment where id=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			a=new Appointment();
			a.setId(rs.getInt(1));
			a.setUserid(rs.getInt(2));
			a.setFullname(rs.getString(3));
			a.setGender(rs.getString(4));
			a.setAge(rs.getString(5));
			a.setAppointmentdate(rs.getString(6));
			a.setEmail(rs.getString(7));
			a.setPhoneno(rs.getString(8));
			a.setDiseases(rs.getString(9));
			a.setDoctorid(rs.getInt(10));
			a.setFulladdress(rs.getString(11));
			a.setStatus(rs.getString(12));
			
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return a;
 }
 public boolean updateStatus(int id,int did,String Comm) {
	 boolean b=false;
	 try {
		PreparedStatement ps=con.prepareStatement("update appointment set status=? where id=? and doctorid=?");
		ps.setString(1, Comm);
		ps.setInt(2, id);
		ps.setInt(3, did);
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	 return b;
 }
 
 public List<Appointment> getAppoints(){
	 List<Appointment>al=new ArrayList<>();
	 Appointment a=null;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from appointment order by id desc");
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			a=new Appointment();
			a.setId(rs.getInt(1));
			a.setUserid(rs.getInt(2));
			a.setFullname(rs.getString(3));
			a.setGender(rs.getString(4));
			a.setAge(rs.getString(5));
			a.setAppointmentdate(rs.getString(6));
			a.setEmail(rs.getString(7));
			a.setPhoneno(rs.getString(8));
			a.setDiseases(rs.getString(9));
			a.setDoctorid(rs.getInt(10));
			a.setFulladdress(rs.getString(11));
			a.setStatus(rs.getString(12));
			al.add(a);
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return al;
 }
 
 public int countDoctor() {
	 int c=0;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from doctor");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			c++;
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return c;
 }
 
 public int countAppointment() {
	 int c=0;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from appointment");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			c++;
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return c;
 }
 
 public int countUser() {
	 int c=0;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from userdetails");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			c++;
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return c;
 }
 public int countSpecialist() {
	 int c=0;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from specialisttable");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			c++;
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return c;
 }
 
 public int countAppointmentbydoctorid(int did) {
	 int c=0;
	 try {
		PreparedStatement ps=con.prepareStatement("select * from appointment where doctorid=?");
		ps.setInt(1, did);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			c++;
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	 return c;
 }
}
