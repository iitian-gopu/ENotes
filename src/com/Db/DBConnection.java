package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection con;
	public static Connection getCon() {
		try {
			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","Goldenstar@1234");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
