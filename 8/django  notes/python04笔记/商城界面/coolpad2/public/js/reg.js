
var isUser = false;
var isPass = false;
var isSame = false;

// alert($);
//blur 丧失焦点事件  focus 获取焦点事件  submit表单提交事件 
$(document).ready(function(){
$('input[name=username]').blur(function(){
	//获取用户输入信息
	var v = $(this).val();
	// alert(v);
	var reg = /^\w{11}$/;
	if(reg.test(v)){
		$(this).parent().addClass('has-success').removeClass('has-error');
		$(this).next().addClass('glyphicon-ok').removeClass('glyphicon-remove');
		isUser = true;
	}else{
		$(this).parent().addClass('has-error').removeClass('has-success');
		$(this).next().addClass('glyphicon-remove').removeClass('glyphicon-ok');
		isUser = false;
	}
})



$('input[name=password]').blur(function(){
	//获取用户输入信息
	var v = $(this).val();
	// alert(v);
	var reg = /^\w{6,18}$/;
	if(reg.test(v)){
		$(this).parent().addClass('has-success').removeClass('has-error');
		$(this).next().addClass('glyphicon-ok').removeClass('glyphicon-remove');
		isPass = true;
	}else{
		$(this).parent().addClass('has-error').removeClass('has-success');
		$(this).next().addClass('glyphicon-remove').removeClass('glyphicon-ok');
		isPass = false;
	}
})

$('input[name=password2]').blur(function(){
	//获取用户输入信息
	var v = $(this).val();
	var p = $('input[name=password]').val();
	if(v == p){
		$(this).parent().addClass('has-success').removeClass('has-error');
		$(this).next().addClass('glyphicon-ok').removeClass('glyphicon-remove');
		isSame = true;
	}else{
		$(this).parent().addClass('has-error').removeClass('has-success');
		$(this).next().addClass('glyphicon-remove').removeClass('glyphicon-ok');
		isSame = false;
	}
})



// 绑定提交事件
$('form').submit(function(){
	//先触发所有的丧失焦点事件
	$('input').trigger('blur')

	//判断是否正确
	if(isUser && isPass && isSame){

	}else{
		//
		return false;
	}
})




})

