package com.market.beans;

import java.util.ArrayList;
import java.util.HashMap;

public class CartBean {
	
	private HashMap<Integer, CartItemBean> items = null;
	private int sum = 0;
	
	public CartBean() {
		items = new HashMap<Integer, CartItemBean>();
	}
	public HashMap<Integer, CartItemBean> getItems() {
		return items;
	}
	public synchronized void addItem(Integer bookId, BookBean book) {
		if (!items.containsKey(bookId)) {
			items.put(bookId, new CartItemBean(book));
			sum++;
		}else {
			CartItemBean item = items.get(bookId);
			int num = item.getQuantity();
			if ( num < item.getBook().getAmount()){
				setBookQuantity(bookId, num + 1);
			}
		}
	}
	public synchronized void deleteItem(Integer bookId) {
		items.remove(bookId);
		sum--;
	}
	
	public synchronized void deleteItems(ArrayList<TradeItem> list) {
		for (TradeItem tradeItem : list) {
			items.remove(tradeItem.getBookid());
			sum--;
		}
	}
	
	public synchronized void clear() {
		items.clear();
		sum = 0;
	}
	public synchronized Integer getSum() {
		return sum;
	}
	public synchronized void setBookQuantity(Integer bookId,int num) {
		if (items.containsKey(bookId)) {
			if ( num <= 0) {
				items.remove(bookId);
			}else {
				items.get(bookId).setQuantity(num);
			}
		}
	}
	// used in normal case
	public void updateBookAccount(ArrayList<BookBean> list) {
		for (BookBean bookBean : list) {
			int id = bookBean.getId();
			if (items.containsKey(id)) {
				items.get(id).getBook().setAmount(bookBean.getAmount());
				if ( items.get(id).getQuantity() > bookBean.getAmount() ) {
					items.get(id).setQuantity(bookBean.getAmount());
				}
			}
		}
	}
}
