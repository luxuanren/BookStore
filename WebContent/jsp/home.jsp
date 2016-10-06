<%@page import="com.market.beans.BookBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookDb" class="com.market.beans.dao.BookDbBean" scope="request"></jsp:useBean>
<jsp:useBean id="cart" class="com.market.beans.CartBean" scope="session"></jsp:useBean>
<%

	String username = (String)session.getAttribute("username");
	String status = "";
	if ( username == null){
		username = "登录";
	}else{
		status = "login";
	}
	
	ArrayList<BookBean> list = null;
	String key = request.getParameter("key");
	if (key != null){
		key = new String(key.getBytes("ISO-8859-1"),"UTF-8");
		list = bookDb.searchBooks(key);
	}else{
		list = bookDb.getAllBooks();
	}
	
	cart.updateBookAccount(list);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎光临书城</title>
    <link rel="stylesheet" href="../css/home.css">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/home.js"></script>
</head>
<body>
	<div id="frame">
        <div id="userBar">
            <label id="loginStatus" class="<%= status%>"><u><%= username%></u></label>
            <label id="cart"><u>购物车</u></label>
        </div>
        <div id="searchBar">
        	<form action="<%= response.encodeRedirectURL("home.jsp") %>">
        		<input id="input" name="key" type="text">
	            <input id="doSearch" type="submit" value="搜索">
	            <input id="showAll" type="button" value="显示所有图书">
        	</form>
        </div>
        <div id="content">
            <table>
                <thead id="head">
                    <tr>
                        <th>书名</th>
                        <th>价格</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>库存</th>
                        <th>购买</th>
                    </tr>
                </thead>
                <tbody id="books">
                	<c:forEach var="item" items="<%= list %>">
						<tr id="${item.id}">
							<td><label name="name">${item.title}</label></td>
							<td>￥<label name="price"><fmt:formatNumber 
							value="${item.price}" pattern=".00"/></label></td>
							<td><label name="author">${item.author}</label></td>
							<td><label name="publish"><fmt:formatDate value="${item.pulishDate }" pattern="yyyy-MM-dd"/></label></td>
							<td><label name="amount">${item.amount}</label></td>
							<td><input class="add" type="button" value="加入购物车"></td>
						</tr>
					</c:forEach>    
                	
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>