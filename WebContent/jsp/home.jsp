<%@page import="com.market.beans.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookDb" class="com.market.beans.dao.BookDbBean" scope="request"></jsp:useBean>
<%
	String username = request.getParameter("username");
	String status = "";
	if ( username == null){
		username = "登录";
	}else{
		status = "login";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎光临书城</title>
    <link rel="stylesheet" href="../css/home.css">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/home.js"></script>
</head>
<body>
	<div id="frame">
        <div id="userBar">
<<<<<<< HEAD
            <label><%= username%></label>
=======
            <label id="loginStatus" class="<%= status%>"><u><%= username%></u></label>
>>>>>>> feature
            <label>购物车</label>
        </div>
        <div id="searchBar">
            <input type="text">
            <input id="search" type="button" value="搜索">
            <input id="showAll" type="button" value="显示所有图书">
        </div>
        <div id="content">
            <table>
                <thead>
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
                	<%
                		ArrayList<BookBean> list = bookDb.getAllBooks();
                		for ( int i = 0 ; i < list.size(); i++){
                			BookBean book = list.get(i);
                			out.print("<tr>");
                			out.print("<td><label name=\"name\">"+book.getTitle()+"</label></td>");
                			out.print("<td><label name=\"price\"> ￥"+book.getPrice()+"</label></td>");
                			out.print("<td><label name=\"author\">"+book.getAuthor()+"</label></td>");
                			out.print("<td><label name=\"publish\">"+book.getPulishDate().toString()+"</label></td>");
                			out.print("<td><label name=\"amount\">"+book.getAmount()+"</label></td>");
                			out.print("<td><input type=\"button\" value=\"加入购物车\"></td>");
                			out.print("</tr>");
                		}
                	%>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>