package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class Specialistdao {
private Connection con;

public Specialistdao(Connection con) {
	super();
	this.con = con;
}
public boolean addSpecialist(String name) {
	boolean b=false;
	try {
		PreparedStatement ps=con.prepareStatement("insert into specialisttable (name) values (?)");
		ps.setString(1, name);
		int a=ps.executeUpdate();
		if(a==1)b=true;
	} catch (Exception e) {
		System.out.print(e);
	}
	return b;
}
public List<Specialist> getAllSpecialist(){
	List<Specialist> ls=new ArrayList<>();
	try {
		PreparedStatement ps=con.prepareStatement("select * from specialisttable");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Specialist sp=new Specialist();
			sp.setId(rs.getInt(1));
			sp.setName(rs.getString(2));
			ls.add(sp);
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	return ls;
}
}
