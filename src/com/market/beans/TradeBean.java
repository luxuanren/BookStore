package com.market.beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.market.beans.dao.DbBean;
import com.market.exception.InsufficientException;

public class TradeBean extends DbBean implements Serializable{

	public TradeBean() throws NamingException {
		super();
	}

	private static final long serialVersionUID = 4463855141235489941L;
	
	public boolean dealTrade(ArrayList<TradeItem> list) throws InsufficientException {
		String sql = "select title,amount from book where id=?";
		String updateSql = "update book set amount=? where id=?";
		Connection connection = null;
		PreparedStatement ps = null;
		PreparedStatement updatePs = null;
		ResultSet rs = null;
		boolean isExistInSufficient = false;
		ArrayList<String> inSufList = new ArrayList<String>();
		
		try {
			connection = dataSource.getConnection();
			connection.setAutoCommit(false);
			connection.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			ps = connection.prepareStatement(sql);
			updatePs = connection.prepareStatement(updateSql);
			
			String name;
			int sum ;
			int num ;
			int id;
			for (TradeItem tradeItem : list) {
				id = tradeItem.getBookid();
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if ( rs.next() ){
					name = rs.getString(1);
					sum = rs.getInt(2);
				}else {
					inSufList.add(new String("图书号 ：" + id + " 没有库存。"));
					isExistInSufficient = true;
					continue;
				}
				num = tradeItem.getNum();
				if( num <= sum){
					updatePs.setInt(1, sum - num);
					updatePs.setInt(2, id);
					updatePs.executeUpdate();
				}else {
					inSufList.add(new String(name + " 库存不足，当前库存为 ：" + sum));
					isExistInSufficient = true;
				}
			}
			if (isExistInSufficient) {
				throw new InsufficientException(inSufList);
			}else {
				connection.commit();
			}
			
			return true;
			
		}catch ( InsufficientException e){
			rollBack(connection);
			throw e;
		}
		catch (SQLException e) {
			rollBack(connection);
			e.printStackTrace();
		}finally {
			closeResultSet(rs);
			closePreparedStatement(ps);
			closePreparedStatement(updatePs);
			closeConnection(connection);
		}
		return false;
	}
}
