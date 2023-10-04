package com.connc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connectionclass {
private static Connection con;
public static Connection getConnection() {
	try {
		if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospitalmanagementsystem","root","Sagar325@#");
		}
	} catch (Exception e) {
	System.out.print(e);
	}
	return con;
}
}
