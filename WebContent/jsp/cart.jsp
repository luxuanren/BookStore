<%@page import="java.text.DecimalFormat"%>
<%@page import="com.market.beans.BookBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.market.beans.CartItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.market.beans.CartBean" scope="session"></jsp:useBean>
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
            <label id="back" class="hover"><u>返回主页</u></label>
        </div>
        <table id="cart">
            <thead>
                <tr>
                    <td><input type="checkbox" id="selectAll"><label for="selectAll"></label></td>
                    <td class="bookInfo">图书信息</td>
                    <td class="price">价格</td>
                    <td class="num">数量</td>
                    <td class="part">小计</td>
                    <td class="op">操作</td>
                </tr>
            </thead>
            <tbody>
            <%
            	HashMap<Integer, CartItemBean> map = cart.getItems();
                Iterator<Integer> iterator = map.keySet().iterator();
                DecimalFormat df = new DecimalFormat("#.00");
                    		
                while(iterator.hasNext()){
                	Integer key = (Integer) iterator.next();
                	CartItemBean cartItem = map.get(key);
                	BookBean book = cartItem.getBook();
                	
                	out.print("<tr id=\""+ book.getId() +"\">");
        			out.print("<td><input type=\"checkbox\"></td>");
        			out.print("<td><label class=\"name\">"+book.getTitle()+"</label></td>");
        			out.print("<td><b>￥</b><b class=\"price\">"+df.format(book.getPrice())+"</b></td>");
        			
        			out.print("<td><input class=\"cut\" type=\"button\" value=\"-\">");
        			out.print("<input class=\"amend\" type=\"text\" value=\""+ cartItem.getQuantity() +"\">");
        			out.print("<input class=\"plus\" type=\"button\" value=\"+\"></td>");
        			
        			out.print("<td> <b class=\"highlight\">￥</b> <b class=\"part highlight\">"+
        					df.format(cartItem.getQuantity() * book.getPrice()) +"</b></td>");
        			
        			out.print("<td><label class=\"delete hover\"><u>删除</u></label></td>");
        			out.print("</tr>");
                }
            %>
            </tbody>
            
        </table>
        <div id="bill">
            <label>已选商品</label><b id="itemSum" class="highlight">0</b><label> 件 </label>
            <label>共计:</label>
            <b class="highlight">￥</b>
            <b id="sum" class="highlight">0.00</b>
            <input id="deal" type="submit" value="结算">
        </div>
    </div>
</body>
</body>
</html>