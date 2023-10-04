package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;

public class userdao {
private Connection con;

public userdao(Connection con) {
	super();
	this.con = con;
}
public boolean userRegister(user u) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("insert into userdetails (fullname,email,password) values(?,?,?)");
		ps.setString(1, u.getFullname());
		ps.setString(2, u.getEmail());
		ps.setString(3, u.getPassword());
		int a=ps.executeUpdate();
		if(a==1)b=true;
		
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}

public user getLoginUser(String email,String password) {
	user u=null;
	try {
		PreparedStatement ps=con.prepareStatement("select * from userdetails where email=? and password=?");
	
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			u=new user();
			u.setId(rs.getInt(1));
			u.setFullname(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPassword(rs.getString(4));
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	return u;
}
public boolean changePassword(int uid,String op,String np) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("update userdetails set password=? where id=? and password=?");
		ps.setString(1, np);
		ps.setInt(2, uid);
		ps.setString(3, op);
		int a=ps.executeUpdate();
		if(a==1)b=true;;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}
  
}
