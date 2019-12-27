$(document).ready(function(){


	// 选项卡
	$('.options li').click(function(){
		//给当前这个元素添加active  找到同辈元素移出class
		$(this).addClass('active').siblings().removeClass('active');

		//获取当前选项的索引
		var inx = $(this).index();
		$('.card li').eq(inx).addClass('active').siblings().removeClass('active');
	})



	$('.uimg li').click(function(){
		var r = $(this).find('img').attr('src');
		$('#small img').attr('src',r);
		$('#big img').attr('src',r);
	})






	// 放大镜
	$('#small').mouseover(function(){
		//鼠标移入后 显示放大镜 大图
		$('#big').show();
		$('#move').show();
		var w = $('#big').width()/$('#big img').width()*$('#small').width();
		var h = $('#big').height()/$('#big img').height()*$('#small').height();
		
		$('#move').css({width:w+'px',height:h+'px'});


	}).mouseout(function(){
		$('#big').hide();
		$('#move').hide();
	}).mousemove(function(e){
		var newTop = e.pageY - $(this).offset().top - $('#move').height()/2;
		var newLeft =   e.pageX - $(this).offset().left - $('#move').width()/2;
		var maxTop = $(this).height()-$('#move').height();
		var maxLeft = $(this).width()-$('#move').width();

		if(newTop <= 0){newTop = 0}
		if(newLeft <= 0){newLeft = 0}
		if(newTop >= maxTop){newTop = maxTop}
		if(newLeft >= maxLeft){newLeft = maxLeft}

		$('#move').css({top:newTop+'px',left:newLeft+'px'});

		var newTop = newTop*1.425;
		var newLeft = newLeft*1.425;

		$('#big img').css({top:-newTop+'px',left:-newLeft+'px'});

	});





	// 多级列表
	//绑定点击事件//隐藏点击事件
		var duojidianji = 0;
		$('.dizhi').mouseenter(function(){
			duojidianji = 1;
		});
		$('.shixian').mouseenter(function(){
			duojidianji = 1;
		});
		$('.dizhi').mouseleave(function(){
			duojidianji = 0;
		});
		$('.shixian').mouseleave(function(){
			duojidianji = 0;
		});
		$('body').click(function(){
			if (duojidianji == 1) {
			$('.shixian').css("display","block");
			}else {
			$('.shixian').css("display","none");
			dizhia();
			}
		})
		


	//定义数据
	var city = {};
	//定义省市关系
	city['山东'] = ['济南','青岛','烟台','济宁'];
	city['山西'] = ['运城','太原','大同','临汾'];
	city['河南'] = ['洛阳','开封','郑州','南阳'];
	city['河北'] = ['石家庄','保定','邯郸','唐山'];

	//定义市 县 关系
	var cun = {};
	cun['济南'] = ['平阴','历下区','济南大区'];
	cun['青岛'] = ['市南区','城阳区','即墨区'];
	cun['烟台'] = ['烟台1区','烟台2区','烟台3区'];
	cun['济宁'] = ['兖州','梁山','曲阜'];
	cun['石家庄'] = ['长安区','新华区','石家庄大区'];
	cun['保定'] = ['保定1','保定2','保定3'];
	cun['邯郸'] = ['邯郸1','邯郸2','邯郸3'];
	cun['唐山'] = ['唐山1','唐山2','唐山3'];
	cun['运城'] = ['运城1','运城2'];
	cun['太原'] = ['太原1'];
	cun['大同'] = ['大同1'];
	cun['临汾'] = ['临汾1'];
	cun['洛阳'] = ['洛阳1'];
	cun['开封'] = ['开封1'];
	cun['郑州'] = ['郑州1'];
	cun['南阳'] = ['南阳1'];



	var jieguo = '地址:';
	 
	var str = '<option value="">-- 请选择省 --</option>';
	//遍历省份信息
	for(var i in city){
		// console.log(i);
		str += '<option value="'+i+'">-- '+i+' --</option>';
	}
	//
	$('#she').html(str);


	//绑定change事件 当值发生改变时触发
	$('#she').change(function(){
		//获取当前选中的值
		var v = $(this).val();
		// console.log(city[v]);
		var c = city[v];

		var str = '<option value="">-- 请选择市 --</option>';
		//遍历省份信息
		for(var i in c){
			// console.log(c[i]);
			str += '<option value="'+c[i]+'">-- '+c[i]+' --</option>';
		}
		$('#shi').html(str);
	})


	$('#shi').change(function(){
		var v = $(this).val();
		var c = cun[v];
		var str = '<option value="">-- 请选择县 --</option>';
		//遍历省份信息
		for(var i in c){
			str += '<option value="'+c[i]+'">-- '+c[i]+' --</option>';
		}
		$('#xian').html(str);
	})


	// $('#xian').change(function(){
	// 	var s1 = $('#she').val();
	// 	var s2 = $('#shi').val();
	// 	var s3 = $(this).val();
	// 	jieguo = s1 + '省' + s2 + '市' + s3;
	// 	console.log(jieguo);
	// })

	var dizhia = function(){
		var s1 = $('#she').val();
		var s2 = $('#shi').val();
		var s3 = $('#xian').val();
		jieguo = s1 + '省' + s2 + '市' + s3;
		$('.dizhi').html(jieguo);
		// console.log(jieguo);
		};














});