<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/cart.css">
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../js/cart.js"></script>
<title>购物车</title>
</head>
<body>
	<body>
    <div id="frame">
        <div id="userBar">
            <label id="user" class="hover"><u>用户</u></label>
            <label class="hover"><u>返回主页</u></label>
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
            <tr>
                <td><input type="checkbox"></td>
                <td><label class="name" class="bookInfo">java</label></td>
                <td>
                    <b>￥</b>
                    <b class="price">30.5</b>
                </td>
                <td class="num">
                    <input class="cut" type="button" value="-">
                    <input class="amend" type="text" value="1">
                    <input class="plus" type="button" value="+">
                </td>
                <td>
                    <b class="highlight">￥</b>
                    <b class="part highlight">30.5</b>
                </td>
                <td><label class="op hover"><u>删除</u></label></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td><label class="name" class="bookInfo">java</label></td>
                <td>
                    <b>￥</b>
                    <b class="price">30.5</b>
                </td>
                <td class="num">
                    <input class="cut" type="button" value="-">
                    <input class="amend" type="text" value="1">
                    <input class="plus" type="button" value="+">
                </td>
                <td>
                    <b class="highlight">￥</b>
                    <b class="part highlight">30.5</b>
                </td>
                <td><label class="op hover"><u>删除</u></label></td>
            </tr>
            </tbody>
            
        </table>
        <div id="bill">
            <label>已选商品</label><b id="itemSum" class="highlight">0</b><label> 件 </label>
            <label>共计:</label>
            <b class="highlight">￥</b>
            <b id="sum" class="highlight">0.0</b>
            <input id="deal" type="submit" value="结算">
        </div>
    </div>
</body>
</body>
</html>