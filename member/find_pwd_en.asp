<%
  Language="KO"
  PageName = "sub09"
  SubName = "en"
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
                    Find password
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <label for="email" class="common_input_box">
                            E-mail
                            <input type="text" class="common_input" id="email">
                        </label>
						<div class="alt_form_box">
                             
                        </div>
                        <button type="button" class="common_submit_btn ladda-button" data-style="expand-left">find password</button>
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
						alert("Your password has been changed.\n please try again after logging in.");
						location.href="/member/login_en.asp"						
					}else{
						alert("Password change failed.\n please contact the manager.");
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
				} 
			});

		});
    });    
</script>

<!-- #include file = '../include/footer.asp' -->