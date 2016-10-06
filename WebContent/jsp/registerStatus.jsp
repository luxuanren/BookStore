<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>welcome to book market</title>
</head>
<body>
	<c:choose>
		<c:when test="${\"success\".equals(param.status) }">
			<p>注册成功！</p>
			<a href="login.jsp">马上登录</a>
		</c:when>
		<c:otherwise>
			<p>注册失败！</p>
			<a href="register.jsp">重新注册</a>
		</c:otherwise>
	</c:choose>
</body>
</html>