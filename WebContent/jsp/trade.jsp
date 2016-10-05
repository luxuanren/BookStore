<%@page import="com.market.exception.InsufficientException"%>
<%@page import="com.market.beans.TradeItem"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<jsp:useBean id="tradeBean" class="com.market.beans.TradeBean" scope="request"></jsp:useBean>
<jsp:useBean id="cart" class="com.market.beans.CartBean" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String json = request.getParameter("data");
	Gson gson = new Gson();
	ArrayList<TradeItem> list = gson.fromJson(json, new TypeToken<ArrayList<TradeItem>>(){}.getType());
	
	try{
		if(tradeBean.dealTrade(list)){
			// remove book from session
			cart.deleteItems(list);
			out.clear();
			out.print("success");
			out.flush();
		}
		
	}catch(InsufficientException e){
		session.setAttribute("cause", e.toString());
		response.sendRedirect(response.encodeRedirectURL("../errorPage/InSufficientError.jsp")); 
	}
	
%>