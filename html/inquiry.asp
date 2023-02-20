<!--#include virtual="/common/fun/fncSetup.asp"--><%
  Language="KO"
  PageName = "sub05"
  SubName = "ko"
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
                <div class="tit">개인정보 수집 및 이용 동의</div>
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
                    후원솔루션 이용 관련에서 <br />
                    궁금한사항이 있으시면 <br class="hide-default show-900">문의해주세요.
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
                            서울 구로구 디지털로 33길 11, 1401호
                        </div>
                    </div>
                </div>

                <form action="">
					<input type="hidden" name="memCode" value="<%=CKMemberCode%>" id="memCode">
                    <div class="application_box">
                        <div class="tit">정보를 입력해 주세요.</div>
                        <div class="label_box f">
                            <label for="groupName" class="common_input_box r">
                                단체명
                                <input type="text" class="common_input" id="groupName">
                            </label>
                            <div class="radio_box">
                                후원구분
                                <div class="box_wrap">
                                    <label for="n_1" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_1" checked value="0">
                                        <label for="n_1">후원단체</label>
                                    </label>

                                    <label for="n_2" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_2" value="1">
                                        <label for="n_2">종교단체</label>
                                    </label>

                                    <label for="n_3" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_3" value="2">
                                        <label for="n_3">교육단체</label>
                                    </label>

                                    <label for="n_4" class="radio_label">
                                        <input type="radio" name="GroupType" id="n_4" value="3">
                                        <label for="n_4">정치단체</label>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="label_box f">
                            <label for="userName" class="common_input_box r">
                                신청자 이름
                                <input type="text" class="common_input" id="userName" value="<%=CKUserName%>">
                            </label>

                            <label for="tell" class="common_input_box">
                                연락처
                                <input type="text" class="common_input" id="tell" placeholder="숫자만 입력해주세요." maxlength="20" onlyNumber>
                            </label>
                        </div>

                        <div class="label_box">
                            <label for="email" class="common_input_box">
                                이메일
                                <input type="text" class="common_input" id="email" value="<%=CKEmail%>">
                            </label>
                        </div>

                        <label for="t_area" class="common_input_box t_area">
                            문의내용
                            <textarea id="t_area" class="common_area"></textarea>
                        </label>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    개인정보 수집 및 이용에 동의합니다.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[약관내용보기]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn ladda-button" data-style="expand-left">문의하기</button>
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
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if( $("#t_area").val()==""){
				alert("문의내용을 입력해주세요.");
				$("#t_area").focus();
				return false;
			}
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test($("#email").val())){
				alert("이메일 형식이 아닙니다.");
				$("#email").focus();
				return false;
			}
			if( $('#use_2').is(':checked') == false ){
				alert("개인정보처리방침에 동의 하셔야 합니다.");
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
						alert("등록 완료 되었습니다.");
						location.href="/member/mypage.asp"						
					}else{
						alert("등록 실패 하였습니다.\n관리자에게 문의 해주세요.");
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