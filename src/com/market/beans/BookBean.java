package com.market.beans;

import java.io.Serializable;
import java.util.Date;

public class BookBean implements Serializable{

	private static final long serialVersionUID = -6804596921205600026L;
	private int id;
	private String title;
	private String author;
	private Date pulishDate;
	private float price;
	private int amount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPulishDate() {
		return pulishDate;
	}
	public void setPulishDate(Date pulishDate) {
		this.pulishDate = pulishDate;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
