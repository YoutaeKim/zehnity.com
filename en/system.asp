<!--#include virtual="/common/fun/fncSetup.asp"-->
<%
  Language="KO"
  PageName = "sub05"
  SubName = "en"
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
                    Zenit Sponsorship System <br />
                    Available Online and Offline 
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
 
                <form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
                    <div class="application_box">
                        <div class="tit">Please enter your information.</div>
                        <div class="label_box f">
                            <label for="GroupName" class="common_input_box r">
                                Organization/organization name
                                <input type="text" class="common_input" id="GroupName" name="GroupName">
                            </label>
                            <label for="Homepage" class="common_input_box ">
                                Home page address
                                <input type="text" class="common_input" id="Homepage" name="Homepage">
                            </label>                            
                        </div>

                        <div class="label_box f">
                            <label for="WorkerName" class="common_input_box r">
                                Contact Name
                                <input type="text" class="common_input" id="WorkerName" name="WorkerName" value="<%=CKUserName%>">
                            </label>

                            <label for="Tel" class="common_input_box">
                                Phone number
                                <input type="text" class="common_input" id="Tel" name="Tel">
                            </label>
                        </div>

                        <div class="label_box f">
                            <label for="Email" class="common_input_box r">
                                이메일
                                <input type="text" class="common_input" id="Email" name="Email" value="<%=CKEmail%>">
                            </label>
                            <div class="radio_box">
                                Payment method
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
                                The attached file
                                <input type="text" class="common_input" id="file" name="files" readonly>
                            </label>

                            <input type="file" id="file_btn">
                            <label for="file_btn" class="file_btn">Find a file</label> 
                        </div>

                        <button type="button" class="common_submit_btn" >To apply</button>
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
				alert("Please enter the institution/organization name.");
				$("#GroupName").focus();
				return false;
			}
			if( $("#Email").val() ){
				var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
				if(!regExp.test($("#Email").val())){
					alert("It is not an email format.");
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
						alert("Your application is complete.");
						<%If CKMemberCode = "" Or IsNull(CKMemberCode) Then%>
						location.href="/en/main.asp";
						<%Else%>
						location.href="/member/mypage_info_edit.asp";
						<%End If%>
					}else{
						if(result.DATA =="5"){
							alert("Institution/organization name not entered");
						}else if(result.DATA =="2"){
							alert("I have requested information.");
						}else{
							alert("Application failed.\n Please contact the manager.");
							location.reload();
						}
						
					}
				},
				error : function(){
					alert("Server request failed");
					location.href="/en/main.asp"
				}
			});
		});
		
    });
</script>

<!-- #include file = '../include/footer.asp' -->