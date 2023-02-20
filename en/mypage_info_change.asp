<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"--><%
  Language="KO"
  PageName = "mypage"
  SubName = "en"
  header = "sub"
  
If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/en/main.asp")
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
<div id="container" class="en">
    <!-- mypage -->
    <div class="mypage_wrap login_wrap info">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">
                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name"><%=CKUserName%> </div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_IngProject%></span>
                                    cases
                                </div>
                                <div class="name">an ongoing<br class="hide-default show-700"/> project</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_EndProject%></span>
                                    cases
                                </div>
                                <div class="name">Project<br class="hide-default show-700"/> Ended</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_DonationSum%></span>
                                </div>
                                <div class="name">a donation received<br class="hide-default show-700"/>this month($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="mypage.asp">1:1 inquiry</a>
                        </li>
                        <li class="on">
                            <a href="mypage_info_change.asp">Change information</a>
                        </li>
						<%If Cols_SgCode <> "0" Then%>
                        <li>
                            <a href="mypage_info_edit.asp">Sponsored organization information management</a>
                        </li>
                        <li>
                            <a href="mypage_management.asp">Sponsored project management</a>
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
                        <div class="cg_tit">Change password</div>
                        <label for="pw" class="common_input_box">
                            Current password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="beforePwd">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            New password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="newPwd">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <button type="button" class="common_submit_btn">Check</button>

                        <div class="withdraw_box">
                            <div class="name">Withdrawal</div>
                            <div class="alt">
                                Delete the membership information if you no longer use the Zehnity service. <br />
                                If you have a sponsoring organization or a sponsoring project, you can delete it and withdraw it.
                            </div>
                            <a href="javascript:;" class="withdraw_btn">Withdrawal</a>
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
				alert("Please enter your current password.");
				$("#beforePwd").focus();
				return false;
			}
			if( $("#newPwd").val() == "" ){
				alert("Please enter a new password.");
				$("#newPwd").focus();
				return false;
			}
			if ( $("#beforePwd").val() == $("#newPwd").val() ){
				alert("Please re-enter your new password.");
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
						alert("Password has been changed.");
						location.href="/en/main.asp"
					}else if(result.DATA =="2"){
						alert("Current password is different.");
					}else{
						alert("Password change failed.\n please contact the manager.");
					}
					
				},				 
				error : function(){
					alert("Server request failed");					
				} 
			});

		});

		//회원탈퇴
		$(".withdraw_btn").click(function(){
			if (confirm("Are you sure you want to unsubscribe?")) {				
				$.ajax({
					url : "/common/json/member/memberOut.json.asp",
					type : "post",
					dataType : 'json',
					success : function(result){
						if(result.DATA =="0"){
							alert("withdrawal has been processed.");
							location.href="/en/logout.asp"
						}else if(result.DATA =="2"){
							alert("not a regular member.");
						}else{
							alert("failed.\n please contact the manager.");
						}
					},				 
					error : function(){
						alert("Server request failed");					
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