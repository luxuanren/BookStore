<%@page import="com.market.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="com.market.beans.dao.UserDbBean"></jsp:useBean>
<jsp:useBean id="user" class="com.market.beans.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	if(db.addUser(user)){
%>	
		<jsp:forward page="<%= response.encodeRedirectURL(\"registerStatus.jsp\") %>">
			<jsp:param value="success" name="status"/>
		</jsp:forward>	
		<%
	}else{
		%>
		<jsp:forward page="registerStatus.jsp">
		<jsp:param value="failed" name="status"/>
	</jsp:forward>	
	<%
	}
		%>
	
