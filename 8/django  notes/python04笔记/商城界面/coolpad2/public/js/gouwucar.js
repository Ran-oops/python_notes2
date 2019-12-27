
$(document).ready(function(){

	// 删除
	$(".shanchu").click(function(event) {
		$(this).parent().remove();
		ff();
	});

	// 数量增减


	$(".jian").click(function(event) {
		i = $(this).next().html();
		if (i==0){i=0;}else{i--;};
		
		$(this).next().html(i);
		// $('.zongjiaya').html($('.danjiaya').html()*i);
		j = $(this).parent().prev().children().html()*i;
		$(this).parent().next().children().html(j.toFixed(2));
		ff();
	});

	$(".jia").click(function(event) {
		i = $(this).prev().html();
		i++;
		$(this).prev().html(i);
		// $('.zongjiaya').html($('.danjiaya').html()*i);
		j = $(this).parent().prev().children().html()*i;
		$(this).parent().next().children().html(j.toFixed(2));
		ff();
	});


// 点击单选框
	$('.ckbox').click(function() {
		ff();
	});


// 全选
	// console.log($("#checkedAll").attr("checked"));
	// 全选
	$("#checkedAll").click(function() {
		if ($(this).prop("checked") == true) {
			// console.log(1);
		$(".ckbox").prop('checked', true);
		} else { // 取消全选
			// console.log(0);
		$(".ckbox").prop("checked", false);
		};
		ff();
	});


	var ff = function(zong){
		// console.log($(".zongjiaya").init().length);
		var zz = 0.00;
		for (var i = 0;i < $(".zongjiaya").init().length;i++)
		{
			if($(".ckbox").eq(i).prop("checked") == true)
			{zz = zz + Number($(".zongjiaya").eq(i).html());}
			else
			{};
		};
		$(".zongjiya").html(zz.toFixed(2));
	}




	


});