/**
 * Created by luxuanren on 2016/10/3.
 */
$(function () {

    // initial
    $('#cart tr:even').css('background','#FFE4CA');
    $('#cart tr:odd').css('background','#DFFFDF');

    if ($('#cart tbody :checkbox:checked').length == 0){
        $('#deal').attr({'disabled':'disabled'});
    }

    // add listener
    $('.hover').hover(function () {
        $(this).toggleClass('highlight');
    },function () {
        $(this).toggleClass('highlight');
    })

    $('#back').click(function () {
        location.href = 'home.jsp';
    })

    $('#cart tbody :checkbox').click(function () {
        if ($(this).prop('checked') == true){
            $('#deal').removeAttr('disabled');
        }else {
            if ( $('#cart tbody :checkbox:checked').length == 0){
                $('#deal').attr({'disabled':'disabled'});
            }
        }
        updateSum();
    })

    $('#selectAll').click(function () {
        if ($(this).prop('checked') == true){
            $('#cart tbody :checkbox').prop('checked',true);
            $('#deal').removeAttr('disabled');
        }else {
            $('#cart tbody :checkbox').prop('checked',false);
            $('#deal').attr({'disabled':'disabled'});

        }
        updateSum();
    })

    $('.cut').click(function () {
    	var $parent = $(this).parent().parent();
        var num = $parent.find('.amend').val();
        if (num > 1){
            updateCart('update',$parent.attr('id'), --num, $parent);
        }
    })

    $('.plus').click(function () {
    	var $parent = $(this).parent().parent();
        var num = $parent.find('.amend').val();
        updateCart('update',$parent.attr('id'), ++num, $parent);
    })

    $('.amend').keyup(function (event) {
    	if ( typeof(event.which) == "undefined"){
    		return ;
    	}
    	var key = (event.which == undefined) ? event.keyCode : event.which; 
    	
        if( key <= 31 || ( key >=37 && key <= 40) ){
            if ($(this).val() == ''){
                $(this).val(1);
            }
        }else if (!(key >= 48 && key <= 57 || key >= 96 && key <= 105 )){
            var value = $(this).val().toString();
            value = value.substring(0,value.length - 1 );
            $(this).val(value);
        }
        var $parent = $(this).parent().parent();
        updateCart('update',$parent.attr('id'), $(this).val(), $parent);
    })

    $('.delete').click(function () {
    	var $parent = $(this).parent().parent();
        updateCart('delete',$parent.attr('id'), 0, $parent);
    })
})

function updateCart(action, bookId, num, $parent) {
    $.get("../ajax/cartUpdate.jsp",{
        action : action ,
        bookId : bookId ,
        value : num
    },function () {
        if ( action == 'update'){
        	$parent.find('.amend').val(num);
            updatePart(num,$parent);
            updateSum();
        }
        if ( action == 'delete'){
            $parent.remove();
        }

    })
}
function updateSum() {
    var ckList = $('#cart tbody :checkbox:checked');
    var sum = 0;

    $.each(ckList, function () {
        var num = parseFloat($(this).parent().parent().find('.part').text());
        sum = sum + num;
    })
    $('#itemSum').text(ckList.length);
    $('#sum').text(changeTwoDecimal(sum).toFixed(2));
}

function updatePart(num,$parent) {
    var $part = $parent.find('.part');
    var $price = $parent.find('.price');
    if ( isNaN(num)){
    	$parent.find('.amend').val(1);
    }
    $part.text( changeTwoDecimal(num * $price.text()).toFixed(2) );
}
