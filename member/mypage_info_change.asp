<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"--><%
  Language="KO"
  PageName = "mypage"
  SubName = "ko"
  header = "sub"
  
If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/")
	Response.end
End If

'# 마이페이지 상단 프로젝트 갯수, 후원금 합계 정보
Dim Cols_IngProject : Cols_IngProject = 0
Dim Cols_EndProject : Cols_EndProject = 0
Dim Cols_DonationSum : Cols_DonationSum = 0
Dim Cols_SgCode : Cols_SgCode = 0
Set objMember = New clsMember
Dim arrData : arrData = objMember.getMypageInfo(CKMemberCode)
Set objMember = Nothing
If IsArray(arrData) Then
	Cols_IngProject = FormatNumber(arrData(0,0),0)
	Cols_EndProject = FormatNumber(arrData(1,0),0)
	Cols_DonationSum = FormatNumber(arrData(2,0),0)
	Cols_SgCode	= arrData(3,0)	
End If

%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- mypage -->
    <div class="mypage_wrap login_wrap info">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">
                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name"><%=CKUserName%> 님</div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_IngProject%></span>
                                    건
                                </div>
                                <div class="name">진행중인<br class="hide-default show-700"/> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_EndProject%></span>
                                    건
                                </div>
                                <div class="name">종료된<br class="hide-default show-700"/> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_DonationSum%></span>
                                </div>
                                <div class="name">이번달 받은<br class="hide-default show-700"/> 후원금($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="mypage.asp">1:1문의</a>
                        </li>
                        <li class="on">
                            <a href="mypage_info_change.asp">정보 변경</a>
                        </li>
						<%If Cols_SgCode <> "0" Then%>
                        <li>
                            <a href="mypage_info_edit.asp">후원단체 정보관리</a>
                        </li>
                        <li>
                            <a href="mypage_management.asp">후원프로젝트 관리</a>
                        </li>
						<li>
                            <a href="mypage_board.asp">BOARD</a>
                        </li>
                        <li>
                            <a href="mypage_photo.asp">PHOTO</a>
                        </li>
                        <li>
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
						<%End If%>
                    </ul>
                    <div class="input_common_form_box">
                        <div class="cg_tit">비밀번호 변경</div>
                        <label for="pw" class="common_input_box">
                            현재 비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="beforePwd">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            새로운 비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="newPwd">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <button type="button" class="common_submit_btn">확인</button>

                        <div class="withdraw_box">
                            <div class="name">회원탈퇴</div>
                            <div class="alt">
                                Zehnity 서비스를 더 이상 이용하지 않을 경우 회원 정보를 삭제합니다. <br />
                                후원단체 및 후원 프로젝트가 있는 경우에는 삭제 후 탈퇴가 가능합니다.
                            </div>
                            <a href="javascript:;" class="withdraw_btn">회원탈퇴 하기</a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
        // 아코디언
        $('.ques_box').on('click', function () {
            if ($(this).parent().hasClass('active')) {
                $(this).parent().removeClass('active');
                $(this).siblings('.ques_answer_box').slideUp();
                $(this).siblings('.sub_alt').slideUp();
            } else if ($(this).find('.mode').hasClass('on')) {
                $('.ques_box').siblings('.ques_answer_box').slideUp();
                $('.ques_box').siblings('.sub_alt').slideUp();
                $(this).parent().siblings().removeClass('active');
                $(this).parent().addClass('active');
                $(this).siblings('.ques_answer_box').slideDown();
                $(this).siblings('.sub_alt').slideDown();
            }
        });
        // END 아코디언
        // 비밀번호       

        $(".common_input.pw").on("keyup", function (event) {
            if (this.value) {
                $(this).next(".pw_btn").addClass("on");
            } else {
                $(this).next(".pw_btn").removeClass("on");
            }
        });

        $('.pw_btn').on('click', function () {
            $(this).parent().toggleClass('on');
            if ($(this).parent().hasClass('on')) {
                $(this).prev().attr('type', "text");
            } else {
                $(this).prev().attr('type', "password");
            }
        });

        // END 비밀번호
		
		//비번변경
		$(".common_submit_btn").click(function(){

			if( $("#beforePwd").val() == "" ){
				alert("현재 비밀번호를 입력해주세요.");
				$("#beforePwd").focus();
				return false;
			}
			if( $("#newPwd").val() == "" ){
				alert("새로운 비밀번호를 입력해주세요.");
				$("#newPwd").focus();
				return false;
			}
			if ( $("#beforePwd").val() == $("#newPwd").val() ){
				alert("새로운 비밀번호를 다시 입력해주세요.");
				$("#newPwd").focus();
				return false;
			}
			$.ajax({
				url : "/common/json/member/mypagePwdFind.json.asp",
				type : "post",
				data : {NewPwd:$("#newPwd").val(), BeforePwd:$("#beforePwd").val()},
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("비밀번호가 변경 되었습니다.");
						location.href="/"
					}else if(result.DATA =="2"){
						alert("현재 비밀번호 다릅니다.");
					}else{
						alert("비밀번호 변경 실패 하였습니다.\n관리자에게 문의 해주세요.");
					}
					
				},				 
				error : function(){
					alert("서버요청실패");					
				} 
			});

		});

		//회원탈퇴
		$(".withdraw_btn").click(function(){
			if (confirm("탈퇴 하시겠습니까?")) {				
				$.ajax({
					url : "/common/json/member/memberOut.json.asp",
					type : "post",
					dataType : 'json',
					success : function(result){
						if(result.DATA =="0"){
							alert("탈퇴 처리 되었습니다.");
							location.href="/member/logout.asp"
						}else if(result.DATA =="2"){
							alert("정상적인 회원이 아닙니다..");
						}else{
							alert("탈퇴 처리 실패 하였습니다.\n관리자에게 문의 해주세요.");
						}
					},				 
					error : function(){
						alert("서버요청실패");					
					} 
				});
			}
		});
		
    });

    // test
    window.onload = function () {
        var scroll = $('.sub_menu_wrap');
        var box = $('.sub_menu_wrap li.on a').offset().left;
        var scrollX = box - 40;
        scroll.stop().animate({
            scrollLeft: (scrollX)
        }, 1200);

    };
    // END
</script>

<!-- #include file = '../include/footer.asp' -->