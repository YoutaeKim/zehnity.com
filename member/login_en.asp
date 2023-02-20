<!--#include virtual="/common/fun/fncSetup.asp"-->
<%
 

If Not(CKMemberCode = "" Or IsNull(CKMemberCode)) Then	
	Call MoveTop("/main_en.asp")
	Response.end
End If
Dim SaveId
SaveId = Request.Cookies("LoginInfo")("LoginID")
 
  Language="KO"
  PageName = "sub06"
  SubName = "en"
  header = "sub"
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
                    Login
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <label for="email" class="common_input_box">
                            E-mail
                            <input type="text" class="common_input" id="email">
                        </label>

                        <label for="pw" class="common_input_box">
                            Password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <div class="alt_form_box">
                            <input type="checkbox" id="login_chk" value="1"<%If Request.Cookies("LoginInfo")("uckSave") = "1" Then%> checked<%End If%>>
                            <label for="login_chk">
                                Maintain Login
                            </label>
                            <a href="find_pwd_en.asp" class="pw_link">Find Password</a>
                        </div>

                        <button type="button" class="common_submit_btn">Login</button>
                        <div class="sns_ment">Get started easily with SNS</div>
                        <div class="sns_link_box">
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                        </div>
                        <div class="sns_etc_ment">
                            Don't you have a Zehnity account yet?
                            <a href="sign_up_en.asp" class="pw_link">Sign Up</a>
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
		//로그인
		$(".common_submit_btn").click(function(){
			var uckSave;
			uckSave = "0";			
			if( $('#login_chk').is(':checked') == true ){
				uckSave = "1";
			}
			if( $("#email").val()==""){
				alert("Please enter your e-mail.");
				$("#email").focus();
				return false;
			}
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test($("#email").val())){
				alert("not email format.");
				$("#email").focus();
				return false;
			}	
			if( $("#pw").val()==""){
				alert("Please enter a password.");
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
						location.href="/main_en.asp";
					}else if(result.DATA == "3"){
						alert("Your password is different.");
						return false;
					}else if(result.DATA == "9"){
						alert("ID that has been withdrawn.");
						return false;
					}else if(result.DATA == "2"){
						alert("ID being approved.");
						return false;
					}else if(result.DATA == "4"){
						alert("There is no registered information.");
						return false;
					}else{
						alert("The wrong approach.");
						return false;
					}				 
				},
				error : function(){
					alert("Server request failed");					
				}
			});
		});
    });    
</script>

<!-- #include file = '../include/footer.asp' -->