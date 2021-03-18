package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserDetails;
/*	Dao Contains all the DATABASE Queries */
public class UserDAO {
	private Connection conn;
	// Its is a constructor it's firing is must, thus will get connection for
	// us.
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UserDetails ud) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(
					"insert into users(name, email, password) value(?,?,?)");
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getEmail());
			ps.setString(3, ud.getPassword());

			int i = ps.executeUpdate();
			//System.out.println("Data entered! New User created");
			if (i == 1) {
				f = true;
			} else {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public UserDetails loginUser(UserDetails ud) {
		UserDetails uDetails = null;
		try {
			String query = "SELECT * FROM users WHERE email = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, ud.getEmail());
			ps.setString(2, ud.getPassword());
			ResultSet rSet = ps.executeQuery();

			if (rSet.next()) {
				uDetails = new UserDetails();
				uDetails.setId(rSet.getInt("id"));
				uDetails.setName(rSet.getString("name"));
				uDetails.setEmail(rSet.getString("email"));
				//uDetails.setPassword(rSet.getString("password"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return uDetails;
	}

}
