<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.market.beans.BookBean"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="bookDb" class="com.market.beans.dao.BookDbBean" scope="request"></jsp:useBean>
<%
	ArrayList<BookBean> list = bookDb.getAllBooks();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String json = gson.toJson(list);
	out.clear();
	out.print(json);
	out.flush();
%>