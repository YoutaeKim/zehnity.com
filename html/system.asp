<!--#include virtual="/common/fun/fncSetup.asp"-->
<%
  Language="KO"
  PageName = "sub05"
  SubName = "ko"
  Menu = "07"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->



<!-- container -->
<div id="container" class="">
    <!-- system -->
    <div class="system_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    온라인과 오프라인에서 <br />
                    사용가능한 제니티 후원시스템
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
 
                <form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
                    <div class="application_box">
                        <div class="tit">정보를 입력해 주세요.</div>
                        <div class="label_box f">
                            <label for="GroupName" class="common_input_box r">
                                기관/단체명
                                <input type="text" class="common_input" id="GroupName" name="GroupName">
                            </label>
                            <label for="Homepage" class="common_input_box ">
                                홈페이지 주소
                                <input type="text" class="common_input" id="Homepage" name="Homepage">
                            </label>                            
                        </div>

                        <div class="label_box f">
                            <label for="WorkerName" class="common_input_box r">
                                담당자 이름
                                <input type="text" class="common_input" id="WorkerName" name="WorkerName" value="<%=CKUserName%>">
                            </label>

                            <label for="Tel" class="common_input_box">
                                전화번호
                                <input type="text" class="common_input" id="Tel" name="Tel">
                            </label>
                        </div>

                        <div class="label_box f">
                            <label for="Email" class="common_input_box r">
                                이메일
                                <input type="text" class="common_input" id="Email" name="Email" value="<%=CKEmail%>">
                            </label>
                            <div class="radio_box">
                                결제수단
                                <div class="box_wrap">
                                    <label for="n_1" class="radio_label">
                                        <input type="radio" name="PayMethod" id="n_1" value="card" checked >
                                        <label for="n_1">CARD</label>
                                    </label>

                                    <label for="n_2" class="radio_label">
                                        <input type="radio" name="PayMethod" id="n_2" value="bank">
                                        <label for="n_2">MY ID</label>
                                    </label>                                   
                                </div>
                            </div>
                        </div>     
                        
                        <div class="label_box">
                            <label for="file" class="common_input_box">
                                첨부파일
                                <input type="text" class="common_input" id="file" name="files" readonly>
                            </label>

                            <input type="file" id="file_btn">
                            <label for="file_btn" class="file_btn">파일 찾기</label> 
                        </div>

                        <button type="button" class="common_submit_btn" >신청하기</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- END system -->
</div>
<!-- END container -->

<script>
    $(document).ready(function() {
		$("#file_btn").change(function(){
			$("#file").val($(this).val());
		});
		//신청하기
		$(".common_submit_btn").click(function(){
			if( $("#GroupName").val()=="" ){
				alert("기관/단체명을 입력해주세요.");
				$("#GroupName").focus();
				return false;
			}
			if( $("#Email").val() ){
				var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
				if(!regExp.test($("#Email").val())){
					alert("이메일 형식이 아닙니다.");
					$("#Email").focus();
					return false;
				}		
			} 

			var form = $("#uploadForm")[0];
			var formData = new FormData(form);
			formData.append("fileObj", $("#file_btn")[0].files[0]);
			$.ajax({
				url: "/common/json/system/system.json.asp",
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType : 'json',
				//enctype : 'multipart/form-data', 
				success: function(result){
					//alert("업로드 성공!!");
					
					if(result.RESULT == "SUCCESS"){
						alert("신청이 완료 되었습니다.");
						<%If CKMemberCode = "" Or IsNull(CKMemberCode) Then%>
						location.href="/";
						<%Else%>
						location.href="/member/mypage_info_edit.asp";
						<%End If%>
					}else{
						if(result.DATA =="5"){
							alert("기관/단체명  미입력");
						}else if(result.DATA =="2"){
							alert("신청한 정보가 있습니다.");
						}else{
							alert("신청이 실패 하였습니다.\n관리자에게 문의 해주세요.");
							location.reload();
						}
						
					}
				},
				error : function(){
					alert("서버요청실패");
					location.href="/"
				}
			});
		});
		
    });
</script>

<!-- #include file = '../include/footer.asp' -->