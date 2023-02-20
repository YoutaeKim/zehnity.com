<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!-- #include file = './include/head.asp' -->
<%
  Language="KO"
  PageName = ""
  SubName = ""
If Not(CkAdminCode = "" Or IsNull(CkAdminCode)) Then
	Response.Redirect "/admin/main.asp"		
End If
Dim SaveId
SaveId = Request.Cookies("AdminLoginInfo")("LoginID")
%>

<!-- header -->
<div id="header">
	<div class="inner">
		<div class="left">
			<div class="logo"><a href="/admin/main.asp">Aron</a></div>
		</div>
		<div class="right">
			<div class="lang">
		       <button type="button" class="plain" onclick="$('.langShow').toggleClass('on');">KOR</button>
		       <ul class="langShow">
	            <li><a href="">ENG</a></li>
	            <li><a href="">CHI</a></li>
				<li><a href="">JPY</a></li>
		      </ul>
	    	</div>
			<%If Not(CkAdminCode = "" Or IsNull(CkAdminCode)) Then%>
			<div class="head_mypage">
				<button type="button" class="plain" onclick="$('.my_wrap').toggleClass('on');"><img src="/admin/image/common/user_c.png" height="40"></button>
				<ul class="my_wrap">
					<li class="name"><img src="/admin/image/common/user_c.png" height="25">위페이(관리자)</li>
					<li class="mt10"><a href="mypage.asp"><img src="/admin/image/common/setting.png">내 정보</a></li>
					<li class="mb10"><a href="/admin/logout.asp"><img src="/admin/image/common/logout.png">로그아웃</a></li>
				</ul>
			</div>
			<%End If%>
		</div>
	</div>
</div>
<!-- END header -->

<!-- container -->
<div id="container">
	
	<div class="login_wrap">	

		<div class="flex">
			<div class="white_box">
				<div class="login">
					<div class="login_tit">로그인</div>
					<div class="mb10"><input type="text" name="admin_id" id="admin_id" placeholder="관리자아이디" value="<%=SaveId%>"></div>
					<div class="mb10"><input type="password" name="admin_pwd" id="admin_pwd" placeholder="비밀번호"></div>
					<div class="login_check">
						<input id="login_chk" type="checkbox" value="1"<%If Request.Cookies("AdminLoginInfo")("uckSave") = "1" Then%> checked<%End If%>>
						<label for="login_chk">아이디 저장</label>
					</div>
					<div class="login_btn mt30">
						<a href="javascript:void(0);">로그인</a>
					</div>
					<div class="gray6 mt30 align-c">
						아이디/비번분실시 고객센터 : 070-4639-0042 <br>
						기술지원문의 : yjjjedan@daum.net
					</div>
				</div>
			</div>
		</div>

		<div class="login_footer">	
			주식회사 ARON ｜ 대표자명 : 박신영 ｜ (08381) 서울시 구로구 디지털로31길 19 에이스테크노타워 2차 808호 ｜ 사업자번호 : 455-87-00502 <div class="hide-767"></div>

			고객상담전화 : 070-4639-0042 ｜ 정산관련 : 070-4639-0043 ｜ 기술지원 : yjjjedan@daum.net  ｜ 통신판매신고번호 : 제 2017-서울구로-0140호 ｜ Mail : wepaycokr@gmail.com <div class="hide-767"></div>

			<ul class="mt20">
				<li>호주 : 180 St Kilda Rd, Melbourne VIC 3006, Australia</li>
				<li>싱가폴 : 10 Bayfront Ave, Singapore 018956</li>
				<li>일본 : 1 Chome-294 Kiyomizu, Higashiyama Ward, Kyoto, 605-0862, Japan</li>
			</ul>

			<div class="mt20">Copyright ⓒ ARON All Rights Reserved</div>
		</div>	

	</div>	
	

</div>
<!-- END container -->
<script>
	$(document).ready(function () {
		$("#admin_id").focus();
		//검색 엔터 실행
		$("#admin_pwd").keydown(function(key) {
			if( key.keyCode == 13 ){
				$(".login_btn.mt30").trigger("click");
			}
		});
		//로그인
		$(".login_btn.mt30").on('click', function (){
			var uckSave;
			uckSave = "0";			
			if( $('#login_chk').is(':checked') == true ){
				uckSave = "1";
			}
			if( $("#admin_id").val() == "" ){
				alert("아이디를 입력해주세요.");
				$("#admin_id").focus();
				return false;
			}
			if( $("#admin_pwd").val() == "" ){
				alert("비밀번호를 입력해주세요.");
				$("#admin_pwd").focus();
				return false;
			}
			$.ajax({
				url : "/common/json/admin/login.json.asp",
				type : "post",
				data : { uckSave:uckSave, userid:$("#admin_id").val(), upw:$("#admin_pwd").val()},
				dataType : 'json',
				success : function(result){					
					if(result.DATA == "0"){
						location.href="/admin";
					}else if(result.DATA == "3"){
						alert("비밀번호가 다릅니다.");
						return false;
					}else if(result.DATA == "9"){
						alert("탈퇴한 아이디입니다.");
						return false;
					}else if(result.DATA == "2"){
						alert("승인중인 아이디입니다.");
						return false;
					}else if(result.DATA == "4"){
						alert("가입된 정보가 없습니다.");
						return false;
					}else{
						alert("잘못된 접근입니다.");
						return false;
					}				 
				},
				error : function(){
					alert("서버요청실패");					
				}
			});
		});
    });
</script>
<!-- #include file = '../include/footer.asp' -->
  