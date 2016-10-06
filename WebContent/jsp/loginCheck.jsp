<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="userDb" class="com.market.beans.dao.UserDbBean" scope="request"></jsp:useBean>

<c:if test="${userDb.findUser(param.username,param.password) }">
	<c:set var="username" value="${param.username }" scope="session"/>
	<c:redirect url="home.jsp" />
</c:if>

<c:set var="status" value="用户名或密码错误" scope="session"/>
<c:redirect url="login.jsp" />
