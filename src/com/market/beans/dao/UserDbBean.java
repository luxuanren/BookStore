package com.market.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.market.beans.UserBean;

public class UserDbBean extends DbBean{
	

	public UserDbBean() throws NamingException {
		super();
	}
	public boolean  findUser(String username, String password) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM user WHERE username=? AND password=?";
			connection = dataSource.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			System.out.println("find username failed");
			e.printStackTrace();
			return false;
		}finally{
			closeResultSet(rs);
			closePreparedStatement(ps);
			closeConnection(connection);
		}
	}
	public boolean  findUsername(String username) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM user WHERE username=?";
			connection = dataSource.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();			
			return rs.next();
		} catch (SQLException e) {
			System.out.println("find username failed");
			e.printStackTrace();
			return false;
		}finally{
			closeResultSet(rs);
			closePreparedStatement(ps);
			closeConnection(connection);
		}
	}
	public boolean findEmail(String email) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM user WHERE email=?";
			connection = dataSource.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			System.out.println("find email failed");
			e.printStackTrace();
			return false;
		}finally {
			closeResultSet(rs);
			closePreparedStatement(ps);
			closeConnection(connection);
		}
	}
	public boolean addUser(UserBean user) {
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			String sql = "INSERT INTO user(username,email,password) VALUES(?,?,?)";
			connection = dataSource.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.execute();
			return true;
		} catch (SQLException e) {
			System.out.println("add user failed");
			e.printStackTrace();
			return false;
		}finally {
			closePreparedStatement(ps);
			closeConnection(connection);
		}
		
	}

}
