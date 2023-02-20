


<!-- header -->
<div id="header">
	<div class="inner">
		<div class="left">
			<div class="gnb_btn">
				<button type="button" class="plain pc" onclick="$('.gnb_wrap').toggleClass('on'); $('.content').toggleClass('on');">
					<img src="/admin/image/common/menu.png">
				</button>
				<button type="button" class="plain m" onclick="$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');">
					<img src="/admin/image/common/menu.png">
				</button>
			</div>
			<div class="logo"><a href="/admin/main.asp">Aron</a></div>
		</div>
		<div class="right">
			<!-- <div class="lang">
		       <button type="button" class="plain" onclick="$('.langShow').toggleClass('on');">KOR</button>
		       <ul class="langShow">
	            <li><a href="">ENG</a></li>
	            <li><a href="">CHI</a></li>
				<li><a href="">JPY</a></li>
		      </ul>
			</div> -->
			<div class="head_mypage">
				<button type="button" class="plain" onclick="$('.my_wrap').toggleClass('on');"><img src="/admin/image/common/user_c.png" height="40"></button>
				<ul class="my_wrap">
					<li class="name"><img src="/admin/image/common/user_c.png" height="25">제니티(<%=CkAdminName%>)</li>
					<li class="mt10"><a href="mypage.asp"><img src="/admin/image/common/setting.png">내 정보</a></li>
					<li class="mb10"><a href="/admin/logout.asp"><img src="/admin/image/common/logout.png">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- END header -->