<!--#include virtual="/common/fun/fncSetup.asp"--><%
  Language="KO"
  PageName = "sub07"
  SubName = "en"
  header = "sub"

If Not(CKMemberCode = "" Or IsNull(CKMemberCode)) Then	
	Call MoveTop("/en/main.asp")
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
                <div class="tit">privacy policy</div>
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
                    Sign Up
                </div>

                <form name="mForm" id="mForm" action="" autocomplete="off">
				<input type="hidden" name="emailchk" id="emailchk">
                    <div class="input_common_form_box">
                        <span class="nav_ment">Please enter your personal information.</span>
                        <label for="name" class="common_input_box">
                            Name
                            <input type="text" class="common_input" id="name" placeholder="Input your name, please." maxlength="50">
                        </label>
                        
                        <label for="email" class="common_input_box">
                            E-mail
                            <input type="text" class="common_input" id="email" placeholder="Please enter your e-mail." maxlength="100">
                        </label>
						<!-- 사용중인 id일 때 나오는 멘트 입니다. -->
                        <span class="used_id" id="email_chk">The ID is already in use.</span>
                        <!-- END -->

                        <label for="p_num" class="common_input_box">
                            Cell phone number
                            <input type="number" class="common_input" id="p_num" placeholder="Cell phone number - please exclude" maxlength="20" onlyNumber oninput="maxLengthCheck(this)"  pattern="\d*">
                        </label>

                        <label for="pw" class="common_input_box">
                            Password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw" placeholder="Password" maxlength="20">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            Confirm password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw_2" placeholder="Confirm password" maxlength="20">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <span class="nav_ment two">agreed to the terms and conditions</span>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_1">
                                <label for="use_1">
                                    I accept the terms and conditions.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen(1);">[View the terms and conditions]</a>
                            </div>
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    I agree with the privacy policy.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen(2);">[View the terms and conditions]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn ladda-button" data-style="expand-left">Sign Up</button>
                        <div class="sns_ment">Get started easily with SNS</div>
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
				$("#email_chk").html("Not in email format.");
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
						$("#email_chk").html("<font color=blue>This is an email you can sign up for.</font>");
						$("#emailchk").val('0');
					}else{
						$("#email_chk").html("This email is already in use.");
					}
					$("#email_chk").show();
				},
				
				error : function(){
					alert("Server request failed");
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
				alert("Input your name, please.");
				$("#name").focus();
				return false;
			}
			if( $("#email").val()==""){
				alert("Please enter your e-mail.");
				$("#email").focus();
				return false;
			}
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test($("#email").val())){
				alert("It is not an email format.");
				$("#email").focus();
				return false;
			}			
			if( $("#p_num").val()==""){
				alert("Please enter your mobile phone number.");
				$("#p_num").focus();
				return false;
			}
			if( $("#pw").val()==""){
				alert("Please enter a password.");
				$("#pw").focus();
				return false;
			}
			if( $("#pw_2").val()==""){
				alert("Please enter password confirmation.");
				$("#pw_2").focus();
				return false;
			}
			if(  $("#pw").val() != $("#pw_2").val() ){
				alert("Password and password confirmation are different.");
				$("#pw_2").focus();
				return false;
			}
			if( $('#use_1').is(':checked') == false ){
				alert("You must agree to the Terms of Use.");
				return false;
			}			
			if( $('#use_2').is(':checked') == false ){
				alert("You must agree to the Privacy Policy.");
				return false;
			}
			if( $("#emailchk").val()==""){
				alert("Please check email duplicates.");
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
						alert("Registration is complete.\n please try again after logging in.");
						location.href="login.asp"						
					}else{
						alert("Registration failed.\n please contact the manager.");
					}
					
				},
				beforeSend:function(){
					l.start();
				},
				complete:function(){
					l.stop();
				},
				error : function(){
					alert("Server request failed");
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
			$(".use_modal_wrap .tit").html("Terms of Use");
		}
		if(val=="2"){
			$(".use_modal_wrap .tit").html("privacy policy");
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
		alert("Not in email format.");
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