package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class Doctordao {
private Connection con;

public Doctordao(Connection con) {
	super();
	this.con = con;
}
public boolean addDoctor(Doctor d) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("insert into doctor (fullname,dob,qualification,specialist,email,mob,password) values(?,?,?,?,?,?,?)");
		ps.setString(1, d.getFullname());
		ps.setString(2, d.getDob());
		ps.setString(3, d.getQualification());
		ps.setString(4, d.getSpecialist());
		ps.setString(5, d.getEmail());
		ps.setString(6, d.getMob());
		ps.setString(7, d.getPassword());
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}
public List<Doctor> getAllDoctor(){
	List<Doctor>dl=new ArrayList<>();
	try {
		PreparedStatement ps=con.prepareStatement("select * from doctor");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Doctor d=new Doctor();
			d.setId(rs.getInt(1));
			d.setFullname(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMob(rs.getString(7));
			d.setPassword(rs.getString(8));
			dl.add(d);
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	return dl;
}
public Doctor getDoctorbyId(int id) {
	Doctor d=new Doctor();
	try {
		PreparedStatement ps=con.prepareStatement("select * from doctor where id=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			
			d.setId(rs.getInt(1));
			d.setFullname(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMob(rs.getString(7));
			d.setPassword(rs.getString(8));
			
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	return d;
}
public boolean updateDoctor(Doctor d) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mob=?,password=? where id=?");
		ps.setString(1, d.getFullname());
		ps.setString(2, d.getDob());
		ps.setString(3, d.getQualification());
		ps.setString(4, d.getSpecialist());
		ps.setString(5, d.getEmail());
		ps.setString(6, d.getMob());
		ps.setString(7, d.getPassword());	
		ps.setInt(8, d.getId());
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}
public boolean delete(int id) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("delete from doctor where id=?");
		ps.setInt(1, id);
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}

public Doctor doctorLogin(String email,String password) {
	Doctor d=null;
	try {
		PreparedStatement ps=con.prepareStatement("select * from doctor where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			d=new Doctor();
			d.setId(rs.getInt(1));
			d.setFullname(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMob(rs.getString(7));
			d.setPassword(rs.getString(8));
		}
		
	} catch (Exception e) {
		System.out.print(e);
	}
	return d;
}
public boolean changeDoctorPassword(int did,String op,String np) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("update doctor set password=? where id=? and password=?");
		ps.setString(1, np);
		ps.setInt(2, did);
		ps.setString(3, op);
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}

public boolean updateDoctorwithoutpassword(Doctor d) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mob=? where id=?");
		ps.setString(1, d.getFullname());
		ps.setString(2, d.getDob());
		ps.setString(3, d.getQualification());
		ps.setString(4, d.getSpecialist());
		ps.setString(5, d.getEmail());
		ps.setString(6, d.getMob());
		ps.setInt(7,  d.getId());	
		
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}
}
