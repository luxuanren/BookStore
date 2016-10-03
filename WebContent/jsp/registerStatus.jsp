<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String status = request.getParameter("status");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>welcome to book market</title>
</head>
<body>
	<%
		if("success".equals(status)){
			out.println("注册成功！");
			out.println("<a href=\""+ response.encodeRedirectURL("login.jsp") +"\">马上登录</a>");
		}else{
			out.println("注册失败！");
			out.println("<a href=\""+ response.encodeRedirectURL("register.jsp") +"\">稍后注册</a>");
		}
	%>
</body>
</html>