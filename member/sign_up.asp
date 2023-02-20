<!--#include virtual="/common/fun/fncSetup.asp"--><%
  Language="KO"
  PageName = "sub07"
  SubName = "ko"
  header = "sub"

If Not(CKMemberCode = "" Or IsNull(CKMemberCode)) Then	
	Call MoveTop("/")
	Response.end
End If
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<link rel="stylesheet" href="/common/lib/ladda/ladda-themeless.min.css">
<script src="/common/lib/ladda/spin.min.js"></script>
<script src="/common/lib/ladda/ladda.min.js"></script>

<!-- modal -->
<div class="use_modal_wrap">
    <div class="modal">
        <div class="use_modal_box common_modal_box">
            <div class="top_box">
                <div class="tit">이용약관</div>
                <button type="button" class="close_btn" onclick="use_modalClose();"></button>
            </div>
            <div class="alt_box">
                <div class="alt alt_1">
                    이용약관 내용이 들어갑니다.
                </div>
				<div class="alt alt_2">
                    개인정보 수집 및 이용 동의<br>
					- 수집 및 이용목적 :  시스템 사용 신청서 확인<br>
					- 수집항목(개인정보) : 성명, 단체명, 연락처, 이메일<br>
					- 보유 및 이용기간 : 수집, 이용 동의일로부터 5년<br><br>
					개인정보보호법 및 정보통신망이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 따라 시스템 신청인을 확인하기 위해
					사전 수신동의를 받고 있으며, 신청인 정보로 시스템 사용 계약이 진행됩니다.<br>
					신청자는 개인정보 및 고유식별정보 수집,이용을 거부할 권리가 있으며, 권리행사 시 시스템 사용 신청 서비스 제공이 어려울 수 있습니다.
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END modal -->

<!-- container -->
<div id="container" class="">
    <!-- sign -->
    <div class="login_wrap sgin_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    회원가입
                </div>

                <form name="mForm" id="mForm" action="" autocomplete="off">
				<input type="hidden" name="emailchk" id="emailchk">
                    <div class="input_common_form_box">
                        <span class="nav_ment">개인정보를 입력해 주세요.</span>
                        <label for="name" class="common_input_box">
                            이름
                            <input type="text" class="common_input" id="name" placeholder="이름을 입력해주세요." maxlength="50">
                        </label>
                        
                        <label for="email" class="common_input_box">
                            이메일
                            <input type="text" class="common_input" id="email" placeholder="이메일을 입력해주세요." maxlength="100">
                        </label>
						<!-- 사용중인 id일 때 나오는 멘트 입니다. -->
                        <span class="used_id" id="email_chk">이미 사용중인 이메일입니다.</span>
                        <!-- END -->

                        <label for="p_num" class="common_input_box">
                            핸드폰번호
                            <input type="number" class="common_input" id="p_num" placeholder="핸드폰번호 -는 제외해주세요" maxlength="20" onlyNumber oninput="maxLengthCheck(this)"  pattern="\d*">
                        </label>

                        <label for="pw" class="common_input_box">
                            비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw" placeholder="비밀번호" maxlength="20">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            비밀번호 확인
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw_2" placeholder="비밀번호 확인" maxlength="20">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <span class="nav_ment two">약관동의</span>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_1">
                                <label for="use_1">
                                    이용약관에 동의합니다.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen(1);">[약관내용보기]</a>
                            </div>
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    개인정보처리방침에 동의합니다.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen(2);">[약관내용보기]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn ladda-button" data-style="expand-left">회원가입</button>
                        <div class="sns_ment">SNS로 간편하게 시작하기</div>
                        <div class="sns_link_box">
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END sign -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
        // 비밀번호   
		$("#email_chk").hide();

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
   
		//이메일 중복체크
		$('#email').focusout(function(){
			$("#emailchk").val('');
			let userId = $("#email").val();
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test(userId)){				 
				$("#email_chk").html("이메일 형식이 아닙니다.");
				$("#email_chk").show();
				return false;
			}
			
			$.ajax({
				url : "/common/json/member/emailCheck.json.asp",
				type : "post",
				data : {email: userId},
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						$("#email_chk").html("<font color=blue>가입 가능한 이메일입니다.</font>");
						$("#emailchk").val('0');
					}else{
						$("#email_chk").html("이미 사용중인 이메일입니다.");
					}
					$("#email_chk").show();
				},
				
				error : function(){
					alert("서버요청실패");
					$("#email_chk").hide();
				}
			});
		});

		//핸드폰번호 숫자만 입력
		$('input[onlyNumber]').on('keyup', function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

		//회원가입
		$(".common_submit_btn").click(function(){
			if( $("#name").val()==""){
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
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
			if( $("#p_num").val()==""){
				alert("휴대폰번호를 입력해주세요.");
				$("#p_num").focus();
				return false;
			}
			if( $("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			if( $("#pw_2").val()==""){
				alert("비밀번호확인을 입력해주세요.");
				$("#pw_2").focus();
				return false;
			}
			if(  $("#pw").val() != $("#pw_2").val() ){
				alert("비밀번호와 비밀번호확인이 다릅니다.");
				$("#pw_2").focus();
				return false;
			}
			if( $('#use_1').is(':checked') == false ){
				alert("이용약관에 동의 하셔야 합니다.");
				return false;
			}			
			if( $('#use_2').is(':checked') == false ){
				alert("개인정보처리방침에 동의 하셔야 합니다.");
				return false;
			}
			if( $("#emailchk").val()==""){
				alert("이메일을 확인해주세요.");
				return false;
			}
			//버튼 로딩바
			var l = Ladda.create(this);
			$.ajax({
				url : "/common/json/member/memberJoin.json.asp",
				type : "post",
				data : {email:$("#email").val(), userName:$("#name").val(), upw:$("#pw").val(), upwRe:$("#pw_2").val(), userPhone:$("#p_num").val() ,emailchk:$("#emailchk").val() },
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("가입이 완료 되었습니다.\n로그인후 이용해주세요.");
						location.href="/member/login.asp"						
					}else{
						alert("가입 실패 하였습니다.\n관리자에게 문의 해주세요.");
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
					$("#email_chk").hide();
				}
			});
		});

    });

    // modal
    function use_modalOpen(val) {
        $(".use_modal_wrap .modal").fadeIn();
        $('body, html').addClass('on');
		$(".alt").hide();
		$(".alt_"+val).show();
		if(val=="1"){
			$(".use_modal_wrap .tit").html("이용약관");
		}
		if(val=="2"){
			$(".use_modal_wrap .tit").html("개인정보처리방침");
		}
    }

    function use_modalClose() {
        $(".use_modal_wrap .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END modal
	function fn_emailChk(email){		
	  var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	  if(!regExp.test(email)){
		alert("이메일 형식이 아닙니다.");
		$("#email").focus();
		return false;
	  }
	  return true;
	}
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
			object.value = object.value.slice(0, object.maxLength);
		}
	}
</script>

<!-- #include file = '../include/footer.asp' -->