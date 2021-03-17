package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.UserNotes;

public class NoteDAO {

	private Connection conn;

	public NoteDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addNotes(String title, String content, int uID) {
		boolean f = false;

		try {
			String query = "insert into notes(topic, content, uid) value(?,?,?)";
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

	public List<UserNotes> getNotes(int uid) {
		List<UserNotes> noteList = new ArrayList<UserNotes>();
		UserNotes note = null;
		try {
			PreparedStatement ps = conn.prepareStatement(
					"select * from notes where uid=? " + "order by id desc");
			ps.setInt(1, uid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				note = new UserNotes();
				note.setId(rs.getInt(1));
				note.setTitle(rs.getString(2));
				note.setContent(rs.getString(3));
				note.setDt(rs.getDate(4));

				noteList.add(note);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return noteList;
	}

	public UserNotes editNote(int noteId, int uid) {
		UserNotes resNotes = null;

		try {
			String query = "select * from notes where id = ? and uid = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, noteId);
			ps.setInt(2, uid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				resNotes = new UserNotes();
				resNotes.setId(rs.getInt(1));
				resNotes.setTitle(rs.getString(2));
				resNotes.setContent(rs.getString(3));
				resNotes.setDt(rs.getDate(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resNotes;
	}

	public boolean updateNote(int noteID, String title, String content)
			throws SQLException {
		boolean f = false;
		try {
			String query = "update notes set topic=?, content=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, noteID);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteNote(int uid, int noteid) {
		boolean f = false;
		try {
			String query = "Delete from notes where uid =? and id =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, uid);
			ps.setInt(2, noteid);
			int i = ps.executeUpdate();
			if (i==1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
}
