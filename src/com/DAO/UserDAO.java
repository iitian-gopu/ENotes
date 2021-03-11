package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.User.UserDetails;

public class UserDAO {
	private Connection conn;
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addUser(UserDetails ud) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("insert into users(name, email, password) value(?,?,?)");
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getEmail());
			ps.setString(3, ud.getPassword());

			int i = ps.executeUpdate();
			System.out.println("Data entered!");
			if (i == 1) {
				f = true;
			}else {
				f=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
