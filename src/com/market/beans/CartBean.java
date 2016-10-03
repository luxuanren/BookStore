package com.market.beans;

import java.util.HashMap;
import java.util.Iterator;

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
			setBookQuantity(bookId, items.get(bookId).getQuantity() + 1);
		}
	}
	public synchronized void deleteItem(Integer bookId) {
		items.remove(bookId);
		sum--;
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
	public synchronized float getTotalPrice() {
		float sum = 0;
		Iterator<Integer> iterator = items.keySet().iterator();
		while (iterator.hasNext()) {
			Integer integer = (Integer) iterator.next();
			CartItemBean cartItem = items.get(integer);
			sum += cartItem.getQuantity() * cartItem.getBook().getPrice();
		}
		return sum;
	}
}
