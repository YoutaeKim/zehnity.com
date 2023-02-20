<%
  Language="KO"
  PageName = "sub09"
  SubName = "ko"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<link rel="stylesheet" href="/common/lib/ladda/ladda-themeless.min.css">
<script src="/common/lib/ladda/spin.min.js"></script>
<script src="/common/lib/ladda/ladda.min.js"></script>

<!-- container -->
<div id="container" class="">
    <!-- login -->
    <div class="login_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    비밀번호 찾기
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <label for="email" class="common_input_box">
                            이메일
                            <input type="text" class="common_input" id="email">
                        </label>
						<div class="alt_form_box">
                             
                        </div>
                        <button type="button" class="common_submit_btn ladda-button" data-style="expand-left">비밀번호 찾기</button>
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
		
		$(".common_submit_btn").click(function(){
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
			//버튼 로딩바
			var l = Ladda.create(this);
	 		

			$.ajax({
				url : "/common/json/member/memberPwdFind.json.asp",
				type : "post",
				data : {email:$("#email").val()},
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("비밀번호가 변경 되었습니다.\n로그인후 이용해주세요.");
						location.href="/member/login.asp"						
					}else{
						alert("비밀번호 변경 실패 하였습니다.\n관리자에게 문의 해주세요.");
					}
					
				},
				beforeSend:function(){
					l.start();
				},
				complete:function(){
					l.stop();
				},
				error : function(){
					alert("서버요청실패");					
				} 
			});

		});
    });    
</script>

<!-- #include file = '../include/footer.asp' -->