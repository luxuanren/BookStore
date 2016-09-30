package com.market.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.market.beans.BookBean;

public class BookDbBean {
	private DataSource dataSource;
	
	public BookDbBean() throws NamingException {
		Context context = new InitialContext();
		dataSource = (DataSource) context.lookup("java:comp/env/jdbc/market");
	}
	
	public ArrayList<BookBean> getAllBooks() {
		ArrayList<BookBean> list = new ArrayList<BookBean>();
		String sql = "select * from book";
		Connection connection;
		try {
			connection = dataSource.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
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
		}
		
		
	}
}
