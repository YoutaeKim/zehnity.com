<!--#include virtual="/common/fun/fncSetup.asp"--><%
  Language="KO"
  PageName = "sub05"
  SubName = "en"
  Menu = "06"
  header = "sub"

%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<%
If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	CKMemberCode = 0
End If
%>
<link rel="stylesheet" href="/common/lib/ladda/ladda-themeless.min.css">
<script src="/common/lib/ladda/spin.min.js"></script>
<script src="/common/lib/ladda/ladda.min.js"></script>
<!-- modal -->
<div class="use_modal_wrap">
    <div class="modal">
        <div class="use_modal_box common_modal_box">
            <div class="top_box">
                <div class="tit">Terms and Conditions</div>
                <button type="button" class="close_btn" onclick="use_modalClose();"></button>
            </div>
            <div class="alt_box">
                <div class="alt">
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
    <!-- inquiry -->
    <div class="inquiry_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    If you have any questions <br />
                    about using the sponsorship solution, <br />please contact us.
                </div>

                <div class="company_info_box">
                    <div class="box">
                        <div class="img_box">
                            <div class="img">
                                <img src="/image/sub/c_info_01.png" alt="">
                            </div>
                            E-mail
                        </div>
                        <div class="alt">
                            aron@arongoup.co.kr
                        </div>
                    </div>

                    <div class="box">
                        <div class="img_box">
                            <div class="img">
                                <img src="/image/sub/c_info_02.png" alt="">
                            </div>
                            Tel
                        </div>
                        <div class="alt">
                            070-8691-0166
                        </div>
                    </div>

                    <div class="box">
                        <div class="img_box">
                            <div class="img">
                                <img src="/image/sub/c_info_03.png" alt="">
                            </div>
                            Address
                        </div>
                        <div class="alt">
                            Room 1401, Digital-ro 33-gil,<br /> Guro-gu, Seoul, Republic of Korea
                        </div>
                    </div>
                </div>

                <form action="">
					<input type="hidden" name="memCode" value="<%=CKMemberCode%>" id="memCode">
                    <div class="application_box">
                        <div class="tit">Please enter your information.</div>
                        <div class="label_box f en">
                            <label for="groupName" class="common_input_box r">
                                Group name
                                <input type="text" class="common_input" id="groupName">
                            </label>
                            <div class="radio_box">
                                Sponsorship classification
                                <div class="box_wrap">
                                    <label for="n_1" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_1" checked value="0">
                                        <label for="n_1">a sponsoring organization</label>
                                    </label>

                                    <label for="n_2" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_2" value="1">
                                        <label for="n_2">religious group</label>
                                    </label>

                                    <label for="n_3" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_3" value="2">
                                        <label for="n_3">an educational body</label>
                                    </label>

                                    <label for="n_4" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_4" value="3">
                                        <label for="n_4">a political organization</label>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="label_box f">
                            <label for="userName" class="common_input_box r">
                                Applicant Name
                                <input type="text" class="common_input" id="userName" value="<%=CKUserName%>">
                            </label>

                            <label for="tell" class="common_input_box">
                                Contact Us
                                <input type="text" class="common_input" id="tell" placeholder="Please enter only numbers." maxlength="20" onlyNumber>
                            </label>
                        </div>

                        <div class="label_box">
                            <label for="email" class="common_input_box">
                                E-mail
                                <input type="text" class="common_input" id="email" value="<%=CKEmail%>">
                            </label>
                        </div>

                        <label for="t_area" class="common_input_box t_area">
                            Contact details
                            <textarea id="t_area" class="common_area"></textarea>
                        </label>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    I agree to collect and use personal information.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[View terms and conditions]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn ladda-button" data-style="expand-left">Contact Us</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- END inquiry -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		//핸드폰번호 숫자만 입력
		$('input[onlyNumber]').on('keyup', function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

		$(".common_submit_btn").click(function(){
			if( $("#email").val()==""){
				alert("Please enter your e-mail.");
				$("#email").focus();
				return false;
			}
			if( $("#t_area").val()==""){
				alert("Please enter your inquiry details.");
				$("#t_area").focus();
				return false;
			}
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test($("#email").val())){
				alert("It is not an email format.");
				$("#email").focus();
				return false;
			}
			if( $('#use_2').is(':checked') == false ){
				alert("You must agree to the Privacy Policy.");
				return false;
			} 
			//버튼 로딩바
			var l = Ladda.create(this);
			$.ajax({
				url : "/common/json/board/inquiry.json.asp",
				type : "post",
				data : {WriteCode:$("#memCode").val(), GroupName:$("#groupName").val(), GroupType:$('input:radio[name="GroupType"]:checked').val(), UserName:$("#userName").val(), Tel:$("#tell").val() ,Email:$("#email").val(), Contents:$("#t_area").val() },
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("Registration is complete.");
						location.href="/member/mypage.asp"						
					}else{
						alert("Registration failed.\n Please contact the manager.");
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
    // modal
    function use_modalOpen() {
        $(".use_modal_wrap .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function use_modalClose() {
        $(".use_modal_wrap .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END modal
</script>

<!-- #include file = '../include/footer.asp' -->