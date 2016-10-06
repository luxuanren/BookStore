<%@page import="com.market.beans.TradeItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.market.beans.BookBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.market.beans.CartItemBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.market.beans.CartBean" scope="session"></jsp:useBean>
<c:set var="status" value="${sessionScope.status }" scope="page"></c:set>
<c:if test="${sessionScope.status != null }">
	<c:remove var="status" scope="session"/>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/cart.css">
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/cart.js"></script>
<title>购物车</title>
</head>
<body>
	<body>
    <div id="frame">
        <div id="userBar">
            <label id="user" class="hover"><u>用户</u></label>
            <a href="home.jsp" class="hover">返回主页</a>
        </div>
        <table id="cart" title=<c:out value="${status }" default=""/>>
            <thead>
                <tr>
                    <td><input type="checkbox" id="selectAll"><label for="selectAll"></label></td>
                    <td class="bookInfo">图书信息</td>
                    <td class="price">价格</td>
                    <td class="num">数量</td>
                    <td class="part">小计</td>
                    <td class="op">删除</td>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="entry" items="${cart.items}">
					<tr id="${entry.value.book.id}" amount="${entry.value.book.amount }">
						<td><input type="checkbox"></td>
						<td><label class="name">${entry.value.book.title}</label></td>
						<td><b>￥</b><b class="price"><fmt:formatNumber 
						value="${entry.value.book.price}" pattern=".00"/></b></td>
						<td>
							<input class="cut" type="button" value="-">
							<input class="amend" type="text" value="${entry.value.quantity }">
							<input class="plus" type="button" value="+">
						</td>
						<td>
							<b class="highlight">￥</b>
							<b class="part highlight">
						<fmt:formatNumber value="${entry.value.book.price * entry.value.quantity}" pattern=".00"/>
							</b>
						</td>
						<td><label class="delete hover"><u>删除</u></label></td>
					</tr>
				</c:forEach>            
            </tbody>
            
        </table>
        <div id="bill">
            <label>已选商品</label><b id="itemSum" class="highlight">0</b><label> 件</label>
            <label>共计:</label>
            <b class="highlight">￥</b>
            <b id="sum" class="highlight">0.00</b>
            <input id="deal" type="submit" value="结算">
        </div>
    </div>
</body>
</body>
</html>