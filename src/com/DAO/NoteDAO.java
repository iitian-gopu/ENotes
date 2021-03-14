package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class NoteDAO {

	private Connection conn;
	public NoteDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addNotes(String title, String content, int uID) {
		boolean f = false;

		try {
			String query ="insert into notes(topic, content, uid) value(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, uID);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
