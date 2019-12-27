jQuery(document).ready(function($) {
	$('.top').click(function(){
		//返回顶部
		$('html,body').animate({scrollTop:'0px'},500);
	})



	//点击对应楼层到达指定楼层位置
	$('#card li').click(function(){
		//获取当前点击的楼层
		var inx = $(this).index()+1;
		//获取当前楼层距离文档顶部偏移量
		var inxTop = $('#f'+inx).offset().top;
		//设置当前文档的滚动
		$('html,body').animate({scrollTop:inxTop+'px'},500);
	})

	//绑定文档滚动事件
	$(window).scroll(isScroll);

	isScroll();

	function isScroll(){
		//获取当前文档滚动的距离
		var Top = $(document).scrollTop();

		//获取每个楼层距离文档顶部的偏移量
		var f1 = $('#f1').offset().top;
		var f2 = $('#f2').offset().top;
		var f3 = $('#f3').offset().top;


		if(Top <= f2-500){
			$('#card').fadeOut(500);
		}else{
			$('#card').fadeIn(500);

		}

		if(Top >= f1){$('#card li').eq(0).addClass('cur').siblings().removeClass('cur');}
		if(Top >= f2-200){$('#card li').eq(1).addClass('cur').siblings().removeClass('cur');}
		if(Top >= f3-200){$('#card li').eq(2).addClass('cur').siblings().removeClass('cur');}
		
		
	}





});