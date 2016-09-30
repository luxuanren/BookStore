<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDb" class="com.market.beans.dao.UserDbBean" scope="request"></jsp:useBean>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if(userDb.findUser(username, password)){
		session.setAttribute("username", username);
		response.sendRedirect("home.jsp");
	}else{
		session.setAttribute("status", "用户名或密码错误");
		response.sendRedirect("login.jsp");
	}

%>