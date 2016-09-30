package com.market.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.market.beans.UserBean;

public class UserDbBean {
	
	private DataSource dataSource;
	
	public UserDbBean() throws NamingException {
		Context context = new InitialContext();
		dataSource = (DataSource) context.lookup("java:comp/env/jdbc/market");
	}

	public boolean  findUser(String username, String password) {
		try {
			String sql = "SELECT * FROM user WHERE username=? AND password=?";
			Connection connection = dataSource.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			boolean result = rs.next();
			closeConnection(connection);
			closePreparedStatement(ps);
			closeResultSet(rs);
			return result;
		} catch (SQLException e) {
			System.out.println("find username failed");
			e.printStackTrace();
			return false;
		}
	}
	public boolean  findUsername(String username) {
		try {
			String sql = "SELECT * FROM user WHERE username=?";
			Connection connection = dataSource.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			boolean result = rs.getRow() > 0;
			closeConnection(connection);
			closePreparedStatement(ps);
			closeResultSet(rs);
			return result;
		} catch (SQLException e) {
			System.out.println("find username failed");
			e.printStackTrace();
			return false;
		}
	}
	public boolean findEmail(String email) {
		try {
			String sql = "SELECT * FROM user WHERE email=?";
			Connection connection = dataSource.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			boolean result = rs.getRow() > 0;
			closeConnection(connection);
			closePreparedStatement(ps);
			closeResultSet(rs);
			return result;
		} catch (SQLException e) {
			System.out.println("find email failed");
			e.printStackTrace();
			return false;
		}
	}
	public boolean addUser(UserBean user) {
		try {
			String sql = "INSERT INTO user(username,email,password) VALUES(?,?,?)";
			Connection connection = dataSource.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.execute();
			closeConnection(connection);
			closePreparedStatement(ps);
			return true;
		} catch (SQLException e) {
			System.out.println("add user failed");
			e.printStackTrace();
			
			return false;
		}
		
	}
	protected void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
				connection = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	protected void closePreparedStatement(PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
				ps = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	protected void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
