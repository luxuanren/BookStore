<%@page import="com.market.beans.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.market.beans.CartBean" scope="session"></jsp:useBean>
<%
	String action = request.getParameter("action");
	if ( "update".equals(action)){
		String bookId = request.getParameter("bookId");
		String value = request.getParameter("value");
		cart.setBookQuantity(Integer.valueOf(bookId), Integer.valueOf(value));
	}else if ("delete".equals(action)){
		String bookId = request.getParameter("bookId");
		cart.deleteItem(Integer.valueOf(bookId));
	}else if ("add".equals(action)){
		String bookId = request.getParameter("bookId");
		String title = request.getParameter("title");
		title = new String(title.getBytes("ISO-8859-1"),"UTF-8");
		String price = request.getParameter("price");
		String amount = request.getParameter("amount");
		int id = Integer.valueOf(bookId);
		cart.addItem(id,new BookBean(id, title, Float.valueOf(price), Integer.valueOf(amount)));
	}
	out.print("success");
	
%>