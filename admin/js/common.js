
$(function(){

	$(".gnb > li > a").on("click", function(){
		$(this).closest("li").toggleClass("on").siblings("li").removeClass("on").find(".gsnb").stop().slideUp('fast');
		$(this).siblings(".gsnb").stop().slideToggle('fast');
		return false;
	});

});


