<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<jsp:useBean id="userDb" class="com.market.beans.dao.UserDbBean" scope="request"></jsp:useBean>
<%
	String action = request.getParameter("action");
	if("username".equals(action)){
		String username = request.getParameter("username");
		String result = null;
		System.out.print(username);
		if(userDb.findUsername(username)){
			result = "false";
		}else{
			result = "true";
		}
		out.clear();
		out.print(result);
		out.flush();
	}
	if("email".equals(action)){
		String email = request.getParameter("email");
		System.out.print(email);
		String result = null;
		System.out.print(email);
		if(userDb.findEmail(email)){
			result = "false";
		}else{
			result = "true";
		}
		out.clear();
		out.print(result);
		out.flush();
	}
%>