<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.market.exception.InsufficientException"%>
<%@page import="com.market.beans.TradeItem"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<jsp:useBean id="tradeBean" class="com.market.beans.TradeBean" scope="request"></jsp:useBean>
<jsp:useBean id="cart" class="com.market.beans.CartBean" scope="session"></jsp:useBean>
<%
	String json = request.getParameter("data");
	json = new String(json.getBytes("ISO-8859-1"),"UTF-8");
	Gson gson = new Gson();
	ArrayList<TradeItem> list = gson.fromJson(json, new TypeToken<ArrayList<TradeItem>>(){}.getType());
	
	try{
		if(tradeBean.dealTrade(list)){
			// remove book from session
			cart.deleteItems(list);
			session.setAttribute("status", "success");
			response.sendRedirect(response.encodeRedirectURL("cart.jsp"));
		}
		
	}catch(InsufficientException e){
		session.setAttribute("cause", e.toString());
		response.sendRedirect(response.encodeRedirectURL("../errorPage/InSufficientError.jsp")); 
	}
	
%>