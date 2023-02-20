


var loc = document.location.href;
var kind = loc.split("/");
console.log(loc);
console.log(kind);

$(function(){
	
	// gnb01
	if(kind[5]=='approval.asp'){ //승인내역 | OCB두툼
		$(".gnb > li").eq(0).addClass("select");
		$(".gnb > li.select .gsnb li").eq(0).addClass("select");
	}
	if(kind[5]=='cancellation.asp'){ //취소내역
		$(".gnb > li").eq(0).addClass("select");
		$(".gnb > li.select .gsnb li").eq(1).addClass("select");
	}

	// gnb02
	if(kind[5]=='statslist.asp'){ //리스트
		$(".gnb > li").eq(1).addClass("select");
		$(".gnb > li.select .gsnb li").eq(0).addClass("select");
	}
	if(kind[5]=='statslistday.asp'){ //집계매출(일별)
		$(".gnb > li").eq(1).addClass("select");
		$(".gnb > li.select .gsnb li").eq(1).addClass("select");
	}
	if(kind[5]=='statslistmonth.asp'){ //집계매출(월별)
		$(".gnb > li").eq(1).addClass("select");
		$(".gnb > li.select .gsnb li").eq(2).addClass("select");
	}
	if(kind[5]=='monthgraph.asp'){ //월별그래프
		$(".gnb > li").eq(1).addClass("select");
		$(".gnb > li.select .gsnb li").eq(5).addClass("select");
	}

	//gnb04
	if(kind[5]=='cpmanagement.asp'){ 
		$(".gnb > li").eq(3).addClass("select");
		$(".gnb > li.select .gsnb li").eq(0).addClass("select");
	}
	if(kind[5]=='sidmanagement.asp'){ 
		$(".gnb > li").eq(3).addClass("select");
		$(".gnb > li.select .gsnb li").eq(1).addClass("select");
	}
	if(kind[5]=='ocb_admin_list.asp'){ 
		$(".gnb > li").eq(3).addClass("select");
		$(".gnb > li.select .gsnb li").eq(2).addClass("select");
	}

	// gnb05
	if(kind[5]=='board_list.asp'){ 
		$(".gnb > li").eq(4).addClass("select");
	}

	// gnb06
	if(kind[5]=='weblocklist.asp'){ 
		$(".gnb > li").eq(5).addClass("select");
	}

	// gnb07
	if(kind[5]=='Downloadlist.asp'){ 
		$(".gnb > li").eq(6).addClass("select");
		$(".gnb > li.select .gsnb li").eq(2).addClass("select");
	}

	// gnb08
	if(kind[5]=='help.asp'){ 
		$(".gnb > li").eq(7).addClass("select");
	}
});
