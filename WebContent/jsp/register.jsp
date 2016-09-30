<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
	<title>Register Page</title>
	<link rel="stylesheet" href="../css/register.css">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/register.js"></script>
   
</head>
<body>
	 <div id="frame">
        <form id="registerForm" class="fontType" action="createUser.jsp" method="get">
        		<div class="int" >
                    <label for="username" class="int">用户名：</label>
                    <input id="username" name="username" class="required" type="text">
                </div>
                <div class="int">
                    <label for="email" class="int">邮箱：</label>
                    <input id="email" name="email" class="required">
                </div>
                <div class="int" >
                    <label for="password" class="int">密码：</label>
                    <input id="password" name="password" class="required" type="password">
                </div>
                <div class="int" >
                    <label for="confirmPassword" class="int" >确认密码：</label>
                    <input id="confirmPassword" class="required" type="password">
                </div>
                <div class="sub">
                    <input id="submitbtn" type="submit" value="提交" >
                </div>
        </form>
    </div>
	
</body>
</html>