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
        var $input = $(this).parent().find('.amend');
        var num = $input.val();
        if (num > 1){
            $input.val(--num);
            updatePart($input, $(this).parent().parent())
            updateSum();
        }
    })

    $('.plus').click(function () {
        var $input = $(this).parent().find('.amend');
        var num = $input.val();
        $input.val(++num);
        updatePart($input, $(this).parent().parent());
        updateSum();
    })

    $('.amend').keyup(function (event) {
        if( event.which <= 31 || ( event.which >=37 && event.which <= 40) ){
            if ($(this).val() == ''){
                $(this).val(1);
            }
            updatePart($(this),$(this).parent().parent())
        }else if (event.which >= 48 && event.which <= 57 || event.which >= 96 && event.which <= 105 ){
            updatePart($(this), $(this).parent().parent())
        }else {
            var value = $(this).val().toString();
            value = value.substring(0,value.length - 1 );
            $(this).val(value);
        }
        updatePart($(this),$(this).parent().parent())
        updateSum();
    })
})

function updateSum() {
    var ckList = $('#cart tbody :checkbox:checked');
    var sum = 0;

    $.each(ckList, function () {
        var num = parseFloat($(this).parent().parent().find('.part').text());
        sum = sum + num;
    })
    $('#itemSum').text(ckList.length);
    $('#sum').text(sum);
}

function updatePart($value,$parent) {
    var $part = $parent.find('.part');
    var $price = $parent.find('.price');
    if ( isNaN($value.val())){
        $value.val(1);
    }
    $part.text($value.val() * $price.text() );
}