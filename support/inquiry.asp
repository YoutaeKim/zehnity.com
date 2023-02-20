<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode       : sgCode         = fnSqlChk(Request("sgCode"), 0, 0)
'########## Request Paramas // ##########

Set objCommon = New clsCommon
Dim arrSupportInfo : arrSupportInfo = objCommon.GetSupportMainInfo(sgCode)
Set objCommon = Nothing
If IsArray(arrSupportInfo) Then 
	Cols_GroupName			= arrSupportInfo(0,0) 
	Cols_GroupType			= arrSupportInfo(1,0) 
	Cols_Homepage			= arrSupportInfo(2,0) 
	Cols_WorkerName			= arrSupportInfo(3,0) 
	Cols_Tel				= arrSupportInfo(4,0) 
	Cols_Email				= arrSupportInfo(5,0) 
	Cols_PayMethod			= arrSupportInfo(6,0) 
	Cols_LogoImg			= arrSupportInfo(7,0) 
	Cols_Addr				= arrSupportInfo(8,0) 
	Cols_Description		= arrSupportInfo(9,0) 		
	Cols_Template			= arrSupportInfo(10,0) 
	Cols_TitleImg1			= arrSupportInfo(11,0) 
	Cols_TitleImg2			= arrSupportInfo(12,0) 
	Cols_TitleImg3			= arrSupportInfo(13,0) 
	Cols_TitleName			= arrSupportInfo(14,0) 
	Cols_TitleDescription	= arrSupportInfo(15,0) 
	Cols_IntroImg1			= arrSupportInfo(16,0) 
	Cols_IntroImg2			= arrSupportInfo(17,0) 
	Cols_IntroImg3			= arrSupportInfo(18,0) 
	Cols_IntroTitle			= arrSupportInfo(19,0) 
	Cols_IntroDescription	= arrSupportInfo(20,0) 
	Cols_MapX				= arrSupportInfo(21,0) 
	Cols_MapY				= arrSupportInfo(22,0) 
Else
	Response.redirect "/"
End If

  Language="KO"
  PageName = "sub05"
  SubName = "ko"
  footer = "add"
%>
<!-- #include virtual = '/support/include/head.asp' -->
<!-- #include virtual = '/support/include/header.asp' -->
<!-- #include virtual = '/support/include/sub_title.asp' -->
<link rel="stylesheet" href="/common/lib/ladda/ladda-themeless.min.css">
<script src="/common/lib/ladda/spin.min.js"></script>
<script src="/common/lib/ladda/ladda.min.js"></script>
<input type="hidden" name="sgCode" id="sgCode" value="<%=sgCode%>">
<!-- container -->
<div id="container" class="">
    <div class="common_sub_wrap board_wrap inquiry_wrap">
        <div class="inner sub_inner">
            <div class="view_box">
                <div class="i_tit">
                    1:1 문의
                </div>
                <div class="common_input_box_wrap">
                    <label for="userName" class="common_input_box fir">
                         이름(*)
                        <input type="text" class="common_input" id="userName" placeholder="이름을 입력해주세요">
                    </label>
                    <label for="groupName" class="common_input_box">
                        단체명
                        <input type="text" class="common_input" id="groupName" placeholder="단체명이 있을경우 입력해주세요.">
                        <!-- <span class="ment">* 개인 후원은 시스템 신청이 불가능합니다.</span> -->
                    </label>
                </div>
                <div class="common_input_box_wrap">
                    <label for="tell" class="common_input_box fir">
                        연락처(*)
                        <input type="text" class="common_input" id="tell" placeholder="- 없이 숫자만 입력해주세요" maxlength="20" onlyNumber oninput="maxLengthCheck(this)"  pattern="\d*">
                        <!-- <span class="ment">* 신청 후 담당자가 연락드립니다.</span> -->
                    </label>
                    <label for="email" class="common_input_box">
                        이메일(*)
                        <input type="text" class="common_input" id="email" placeholder="이메일을 입력해주세요.">
                    </label>
                </div>
                <label for="text" class="common_input_box text">
                    문의내용(*)
                    <textarea   class="common_textarea_box" id="contents" placeholder="문의내용을 간략하게 입력해주세요."></textarea>
                </label>

                <div class="i_tit">
                    개인정보 수집 및 이용 동의
                </div>
                <div class="common_textarea_box agree">
                    <div class="text">
						개인정보 수집 및 이용 동의<br>
						- 수집 및 이용목적 : 시스템 사용 신청서 확인<br>
						- 수집항목(개인정보) : 성명, 단체명, 연락처, 이메일<br>
						- 보유 및 이용기간 : 수집, 이용 동의일로부터 5년<br><br>

						개인정보보호법 및 정보통신망이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 따라 시스템 신청인을 확인하기 위해 사전 수신동의를 받고 있으며, 신청인 정보로 시스템 사용 계약이 진행됩니다.<br>
						신청자는 개인정보 및 고유식별정보 수집,이용을 거부할 권리가 있으며, 권리행사 시 시스템 사용 신청 서비스 제공이 어려울 수 있습니다.
					</div>
                </div>
                <label for="chk" class="common_label_box">
                    <input type="checkbox" id="chk">
                    <label for="chk" class="common_label">
                        개인정보 수집 및 이용에 <span>동의</span>합니다.
                    </label>
                </label>
                <div class="back_btn_box">
                    <button type="button" class="common_h_btn inquiry_btn ladda-button" data-style="expand-left">문의하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		//핸드폰번호 숫자만 입력
		$('input[onlyNumber]').on('keyup', function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
		$(".common_h_btn.inquiry_btn").click(function(){
			if( $("#sgCode").val()==""){
				alert("잘못된 접근입니다.");
				return false;
			}
			if( $("#userName").val()==""){
				alert("이름을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if( $("#tell").val()==""){
				alert("연락처를 입력해주세요.");
				$("#tell").focus();
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
			if( $("#contents").val()==""){
				alert("문의내용을 입력해주세요.");
				$("#contents").focus();
				return false;
			}
			if( $('#chk').is(':checked') == false ){
				alert("개인정보처리방침에 동의 하셔야 합니다.");
				return false;
			}
			//버튼 로딩바
			var l = Ladda.create(this);
			$.ajax({
				url : "/common/json/support/inquiry.json.asp",
				type : "post",
				data : {sgCode:$("#sgCode").val(), userName:$("#userName").val(), groupName:$("#groupName").val(), tell:$("#tell").val() ,email:$("#email").val(), contents:$("#contents").val() },
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("문의 전송이 완료 되었습니다.");
						location.reload();
						
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
				}
			});
		});
    });
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
			object.value = object.value.slice(0, object.maxLength);
		}
	}
</script>

<!-- #include virtual = '/support/include/footer.asp' -->