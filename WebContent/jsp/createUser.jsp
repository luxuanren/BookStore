<%@page import="com.market.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="db" class="com.market.beans.dao.UserDbBean"></jsp:useBean>
<jsp:useBean id="user" class="com.market.beans.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<c:if test="${db.addUser(user) }">
	<jsp:forward page="<%= response.encodeRedirectURL(\"registerStatus.jsp\") %>">
			<jsp:param value="success" name="status"/>
	</jsp:forward>
</c:if>

<jsp:forward page="registerStatus.jsp">
	<jsp:param value="failed" name="status"/>
</jsp:forward>

	
