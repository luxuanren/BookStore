$(function () {

	var usernameLength = 1;
    $('.required').each(function () {
        var $required = $('<i class="high">*</i>');
        $(this).parent().append($required);
    });
    $('form :input').blur(function () {
        var $parent = $(this).parent();
        var errorMsg;
        var okMsg;
        if ($(this).is('#username')){
            if (this.value == "" || this.value.length < usernameLength){
                errorMsg = "请输入至少" + usernameLength + "用户名";
                $parent.find('.formtips').remove();
                $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
            }else{
            	$.get("../ajax/register_check.jsp",{
            		action:"username",username:this.value
            		},function(data, textStatus){
            		if( data == "true" ){
            			okMsg = "用户名可用";
                        $parent.find('.formtips').remove();
                        $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
            		}else{
            			errorMsg = "用户名已存在";
                   	 $parent.find('.formtips').remove();
                        $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
            		}

            	},"text")
            	 
            }
        }else if ($(this).is('#email')){
            if( this.value=="" || ( this.value!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value) ) ){
                errorMsg = '邮箱不合法';
                $parent.find('.formtips').remove();
                $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
            }else{
            	$.get("../ajax/register_check.jsp",{
            		"action":"email",email:this.value
            		},function(data, textStatus){
            		if( data == "true" ){
            			okMsg = "邮箱可用";
                        $parent.find('.formtips').remove();
                        $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
            		}else{
            			errorMsg = "该邮箱已被注册";
                   	 $parent.find('.formtips').remove();
                        $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
            		}

            	},"text")
            }
        } else if($(this).is('#password')) {
        	var pattern = /^(?=[0-9]*[a-zA-Z])[a-zA-Z0-9]{6,16}$/gm;
            if (this.value == "" || !pattern.test(this.value)){
                errorMsg = "请输入包含数字和字母的6-16位密码";
                $parent.find('.formtips').remove();
                $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
            }else {
                okMsg = "密码可用";
                $parent.find('.formtips').remove();
                $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
            }
         }
    });
    
    $('#confirmPassword').keyup(function(){
    	var $parent = $(this).parent();
    	if ( $('#password').val().length == 0 || this.value != $('#password').val()){
            errorMsg = "两次输入的密码不一致";
            $parent.find('.formtips').remove();
            $parent.append('<span class="formtips onError">' + errorMsg + '</span>');
        }else {
            okMsg = "确认通过";
            $parent.find('.formtips').remove();
            $parent.append('<span class="formtips onSuccess">' + okMsg + '</span>');
        }
    })

    $('#submitbtn').click(function () {
        $('form .required:input ').trigger('blur');
        if ($('.onError').length){
            return false;
        }
    });
});