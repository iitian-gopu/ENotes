package com.DAO;

import java.sql.Connection;

public class UserDAO {
	
	public static Connection con;
	public static Connection getCon() {
		
		if(con == null) {
			
		}
		return con;
	}

}
