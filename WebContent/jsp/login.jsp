<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String status = (String)session.getAttribute("status");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录</title>
<link rel="stylesheet" href="../css/register.css">
</head>
<body>
	<div id="frame">
        <form id="registerForm" class="fontType" action="loginCheck.jsp" method="post">
                <div class="int" >
                    <label for="username" class="int">用户名：</label>
                    <input name="username" class="required" type="text" value="exuanlu">
                </div>
                <div class="int" >
                    <label for="password" class="int">密码：</label>
                    <input name="password" class="required" type="password" value="123">
                </div>
                <div class="sub">
                <p class="int" id="tips"><%= status == null ? "": status%></p>
                    <input id="submitbtn" type="submit" value="登录" >
                </div>
        </form>
    </div>
</body>
</html>