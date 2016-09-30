/**
 * Created by exuanlu on 9/27/2016.
 */
$(function () {
    $('tr:odd').css("background","#FFE4CA");
    $('tr:even').css("background","#DFFFDF");

    $('#showAll').click(function () {
        $.post("../ajax/getAllbooks.jsp",function (data) {
            $('#books').empty();
            var html = '';
            $.each(data,function (index,book) {
                html += '<tr>' +
                        '<td>' + book['title'] + '</td>' +
                        '<td>￥' + book['price'] + '</td>' +
                        '<td>' + book['author'] + '</td>' +
                        '<td>' + book['pulishDate'] + '</td>' +
                        '<td>' + book['amount'] + '</td>' +
                        '<td><input type=\"button\" value=\"加入购物车\"></td>' +
                        '</tr>';
            })
            $('#books').html(html);
            $('tr:odd').css("background","#FFE4CA");
            $('tr:even').css("background","#DFFFDF");
        },"json");
    });
    $('#loginStatus').click(function(){
    	if ($('#loginStatus').hasClass('login')){
    		// do nothing
    	}else{
    		location.href = "http://localhost:8080/BookStore/jsp/login.jsp";
    	}
    });
    $('#userBar label').hover(function(){
    	$(this).toggleClass('highlight');
    },function(){
    	$(this).toggleClass('highlight');
    });
})

