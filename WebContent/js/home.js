/**
 * Created by exuanlu on 9/27/2016.
 */
$(function () {
	
	if( $('#books tr').length == 0){
		var $head = $('#head');
		$head.empty();
		var html = "<tr><td>没有相关结果</td></tr>";
		$head.html(html);
	}else{
		$('tr:odd').css("background","#FFE4CA");
		$('tr:even').css("background","#DFFFDF");
	}
	// deal space input or zero input
	$('#doSearch').click(function(){
		var value = $('input').val();
		var reg = / +/gm;
		if (value == "" || reg.test(value)){
			return false;
		}
	});

	$('#books label[name=amount]').each(function(){
		if ( $(this).text() == 0 ){
			$(this).parent().parent().find('.add').attr({"disabled":"disabled"});
		}
	})
	
    $('#showAll').click(function () {
        $.post("../ajax/getAllbooks.jsp",function (data) {
            $('#books').empty();
            var html = '';
            $.each(data,function (index,book) {
                html += '<tr>' +
                        '<td>' + book['title'] + '</td>' +
                        '<td>'+ changeTwoDecimal(book['price']).toFixed(2) + '</td>' +
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
    
    $('.add').click(function(){
    	var $parent = $(this).parent().parent();
    	
    	$.get("../ajax/cartUpdate.jsp",{
            action : "add" ,
            bookId : $parent.attr("id") ,
            title : $parent.find('label[name="name"]').text() ,
            price : $parent.find('label[name="price"]').text(),
            amount : $parent.find('label[name="amount"]').text()
        },function () {
        	$('#cart').css('color','OrangeRed');
        })
    })
    
    $('#cart').click(function(){
    	location.href = "cart.jsp";
    })
})

