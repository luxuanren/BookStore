package com.market.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.market.beans.BookBean;

public class BookDbBean extends DbBean{
	
	public BookDbBean() throws NamingException {
		super();
	}
	public ArrayList<BookBean> getAllBooks() {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ArrayList<BookBean> list = new ArrayList<BookBean>();
			String sql = "select * from book";
			connection = dataSource.getConnection();
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				BookBean book = new BookBean();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPulishDate(rs.getDate(4));
				book.setPrice(rs.getFloat(5));
				book.setAmount(rs.getInt(6));
				list.add(book);
			}
			
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			closeResultSet(rs);
			closePreparedStatement(ps);
			closeConnection(connection);
		}
	
	}
	public ArrayList<BookBean> searchBooks(String key) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ArrayList<BookBean> list = new ArrayList<BookBean>();
			String sql = "select * from book where title like concat('%',?,'%') or author like concat('%',?,'%')";
			connection = dataSource.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, key);
			ps.setString(2, key);
			rs = ps.executeQuery();
			
			while(rs.next()){
				BookBean book = new BookBean();
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPulishDate(rs.getDate(4));
				book.setPrice(rs.getFloat(5));
				book.setAmount(rs.getInt(6));
				list.add(book);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			closeResultSet(rs);
			closePreparedStatement(ps);
			closeConnection(connection);
		}
	
	}
}
