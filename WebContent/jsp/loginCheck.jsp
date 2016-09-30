<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDb" class="com.market.beans.dao.UserDbBean" scope="request"></jsp:useBean>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if(userDb.findUser(username, password)){
		%>
			<jsp:forward page="home.jsp">
				<jsp:param value="<%=request.getParameter(\"username\") %>" name="username"/>
			</jsp:forward>
		<%
	}else{
		%>
			<jsp:forward page="login.jsp">
				<jsp:param value="invailed username or password" name="status"/>
			</jsp:forward>
		<%
	}

%>