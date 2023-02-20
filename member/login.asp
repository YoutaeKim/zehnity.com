<!--#include virtual="/common/fun/fncSetup.asp"-->
<%
  Language="KO"
  PageName = "sub06"
  SubName = "ko"
  header = "sub"

If Not(CKMemberCode = "" Or IsNull(CKMemberCode)) Then	
	Call MoveTop("/")
	Response.end
End If
Dim SaveId
SaveId = Request.Cookies("LoginInfo")("LoginID")

%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- login -->
    <div class="login_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    로그인
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <label for="email" class="common_input_box">
                            이메일
                            <input type="text" class="common_input" id="email" value="<%=SaveId%>">
                        </label>

                        <label for="pw" class="common_input_box">
                            비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <div class="alt_form_box">
                            <input type="checkbox" id="login_chk" value="1"<%If Request.Cookies("LoginInfo")("uckSave") = "1" Then%> checked<%End If%>>
                            <label for="login_chk">
                                아이디 저장
                            </label>
                            <a href="find_pwd.asp" class="pw_link">비밀번호 찾기</a>
                        </div>

                        <button type="button" class="common_submit_btn">로그인</button>
                        <div class="sns_ment">SNS로 간편하게 시작하기</div>
                        <div class="sns_link_box">
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                        </div>
                        <div class="sns_etc_ment">
                            아직 제니티 계정이 없으신가요?
                            <a href="sign_up.asp" class="pw_link">회원가입 하기</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END login -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		$("#email").focus();

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
		//검색 엔터 실행
		$(".common_input.pw").keydown(function(key) {
			if( key.keyCode == 13 ){
				 $(".common_submit_btn").trigger("click");
			}
		});
		//로그인
		$(".common_submit_btn").click(function(){
			var uckSave;
			uckSave = "0";			
			if( $('#login_chk').is(':checked') == true ){
				uckSave = "1";
			}
			if( $("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test($("#email").val())){
				alert("이메일 형식이 아닙니다.");
				$("#email").focus();
				return false;
			}	
			if( $("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			console.log(uckSave);
			$.ajax({
				url : "/common/json/member/login.json.asp",
				type : "post",
				data : {uckSave:uckSave, email:$("#email").val(), upw:$("#pw").val()},
				dataType : 'json',
				success : function(result){					
					if(result.DATA == "0"){
						location.href="/";
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