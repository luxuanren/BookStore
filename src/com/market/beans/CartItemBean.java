package com.market.beans;

import java.io.Serializable;

public class CartItemBean implements Serializable{
	
	private static final long serialVersionUID = -3074000833171576164L;
	private BookBean book;
	private int quantity;
	public CartItemBean() {
		
	}
	public CartItemBean(BookBean book) {
		this.book = book;
		this.quantity = 1;
	}
	public CartItemBean(BookBean book,int quantity) {
		this.book = book;
		this.quantity = quantity;
	}
	public BookBean getBook() {
		return book;
	}
	public void setBook(BookBean book) {
		this.book = book;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
