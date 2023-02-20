<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsMember.asp"--><%
  Language="KO"
  PageName = "mypage"
  SubName = "en"
  header = "sub"

If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/en/main.asp")
	Response.end
End If
'########## // Request Paramas ##########
Dim iPcode      : iPcode        = fnSqlChk(Request("pcode"), 0, 0)  : iPcode = NullValue(iPcode,0)
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
'########## Request Paramas // ##########
If isNumeric(iPcode) = False Then '프로젝트 코드 숫자 체크
	Response.redirect "/en/main.asp"
	Response.end
End If 

'# 마이페이지 상단 프로젝트 갯수, 후원금 합계 정보
Dim arrProjectInfo
Dim Cols_IngProject : Cols_IngProject = 0
Dim Cols_EndProject : Cols_EndProject = 0
Dim Cols_DonationSum : Cols_DonationSum = 0
Set objMember = New clsMember
Dim arrData : arrData = objMember.getMypageInfo(CKMemberCode)
Set objMember = Nothing

If IsArray(arrData) Then
	Cols_IngProject = FormatNumber(arrData(0,0),0)
	Cols_EndProject = FormatNumber(arrData(1,0),0)
	Cols_DonationSum = FormatNumber(arrData(2,0),0)
End If

Set objCommon = New clsCommon
Dim arrGroupInfo : arrGroupInfo = objCommon.GetSupportGroupInfo(CKMemberCode)
If iPcode > 0 Then
	arrProjectInfo = objCommon.GetProjectInfo(iPcode)
End If
Set objCommon = Nothing

Dim Cols_sgCode
If IsArray(arrGroupInfo) Then
	Cols_sgCode				= arrGroupInfo(0,0)
Else
	MoveMsg "You must apply for the sponsorship system.","/en/system.asp"
End If

Dim Cols_Template : Cols_Template = "A"
If IsArray(arrProjectInfo) Then
	Cols_Template		= arrProjectInfo(2,0)
	Cols_ProjectImg		= arrProjectInfo(3,0)
	Cols_ProjectName	= arrProjectInfo(4,0)
	Cols_TargetMoney	= arrProjectInfo(5,0)
	Cols_TotlaMoney		= arrProjectInfo(6,0)
	Cols_ApplyCnt		= arrProjectInfo(7,0)
	Cols_PayMothod		= arrProjectInfo(8,0)
	Cols_Tel			= arrProjectInfo(9,0)
	Cols_Email			= arrProjectInfo(10,0)
	Cols_StartDate		= arrProjectInfo(11,0)
	Cols_EndDate		= arrProjectInfo(12,0)
	Cols_Menu			= arrProjectInfo(13,0)
	Cols_Description	= arrProjectInfo(14,0)
End If
 
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<script type="text/javascript" src="/common/lib/ckeditor/ckeditor.js"></script>
 
<!-- container -->
<div id="container" class="en"> 
    <!-- mypage -->
    <div class="mypage_wrap edit management">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">

                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name"><%=CKUserName%> </div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_IngProject%></span>
                                    cases
                                </div>
                                <div class="name">an ongoing<br class="hide-default show-700"/> project</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_EndProject%></span>
                                    cases
                                </div>
                                <div class="name">Project<br class="hide-default show-700"/> Ended</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_DonationSum%></span>
                                </div>
                                <div class="name">a donation received<br class="hide-default show-700"/> this month($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="mypage.asp">1:1 inquiry</a>
                        </li>
                        <li>
                            <a href="mypage_info_change.asp">Change information</a>
                        </li>
                        <li>
                            <a href="mypage_info_edit.asp">Sponsored organization information management</a>
                        </li>
                        <li class="on">
                            <a href="mypage_management.asp">Sponsored project management</a>
                        </li>
						<li>
                            <a href="mypage_board.asp">BOARD</a>
                        </li>
                        <li>
                            <a href="mypage_photo.asp">PHOTO</a>
                        </li>
                        <li>
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
                    </ul>

                    <div class="mypage_tit">Select Template</div> 

					<input type="hidden" name="page" id="page" value="<%=iPage%>">
					<input type="hidden" name="sgCode" id="sgCode" value="<%=Cols_sgCode%>">
					<input type="hidden" name="pCode" id="pCode" value="<%=iPcode%>">
					<input type="hidden" name="pTemplate" id="pTemplate" value="<%=Cols_Template%>">
					<input type="hidden" name="projectImg" id="projectImg" value="<%=Cols_ProjectImg%>">

                    <div class="t_edit_wrap">
                        <div class="box<%If Cols_Template = "A" Then%> on<%End If%>">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type A</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">Preview</button>
                                    <button type="button" class="use_btn" data-Template="A"><%If Cols_Template = "A" Then%>In Use<%Else%>Use<%End If%></button>
                                </div>
                            </div>
                        </div>

                        <div class="box<%If Cols_Template = "B" Then%> on<%End If%>">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type B</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">Preview</button>
                                    <button type="button" class="use_btn" data-Template="B"><%If Cols_Template = "B" Then%>In Use<%Else%>Use<%End If%></button>
                                </div>
                            </div>
                        </div>

                        <div class="box<%If Cols_Template = "C" Then%> on<%End If%>">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type C</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">Preview</button>
                                    <button type="button" class="use_btn" data-Template="C"><%If Cols_Template = "C" Then%>In Use<%Else%>Use<%End If%></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="info_edit_wrap common_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        Introduction of sponsoring organizations
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">Project Photos</div>
							<div class="file_box_wrap" style="margin-top:10px;"> 
								<div class="common_file_box result_box imgPreView">
                                    <div class="result_img"></div>    
									<button type="button" class="remove_btn" onclick="fn_ImgDel();"></button>
                                </div>
								<label for="projectfile" class="common_file_box imglabel">
									<input type="file" id="projectfile">
									<div class="img"></div>
									<div class="ment">Please register your image</div>
									<div class="sub_ment">Image size:   1920 * 460</div>
								</label>
							 </div>

                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="projectName" class="common_input_box">
                                    Project name
                                    <input type="text" class="common_input" id="projectName" value="<%=Cols_ProjectName%>">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="targetMoney" class="common_input_box r">
                                    Target amount ($)
                                    <input type="text" class="common_input" id="targetMoney" value="<%=Cols_TargetMoney%>" onlyNumber>
                                </label>
                                <label for="" class="common_input_box radio_box">
                                    a means of sponsorship
                                    <div class="box_wrap">
                                        <label for="n_1" class="radio_label">
                                            <input type="checkbox" name="payMothod" id="n_1" value="card"<%If Instr(Cols_PayMothod,"card") > 0 Then%> checked<%End If%>>
                                            <label for="n_1">card</label>
                                        </label>

                                        <label for="n_2" class="radio_label">
                                            <input type="checkbox" name="payMothod" id="n_2" value="bank"<%If Instr(Cols_PayMothod,"bank") > 0 Then%> checked<%End If%>>
                                            <label for="n_2">Bank</label>
                                        </label>
                                    </div>
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="tel" class="common_input_box r">
                                    Phone number
                                    <input type="text" class="common_input" id="tel" value="<%=Cols_Tel%>">
                                </label>
                                <label for="email" class="common_input_box">
                                    E-mail
                                    <input type="text" class="common_input" id="email" value="<%=Cols_Email%>">
                                </label>
                            </div>
                            <div class="label_box">
                                <label for="" class="common_input_box r">
                                    Operating period
                                    <div class="date_box">
                                        <div class="date"><input type="text" class="common_input" id="fromDate" name="startDate" value="<%=Cols_StartDate%>" readonly></div> <span>-</span>
                                        <div class="date"><input type="text" class="common_input" id="toDate" name="endDate" value="<%=Cols_EndDate%>" readonly>
                                        </div>
                                    </div>
                                </label>

                            </div>
                            <div class="label_box">
                                <label for="" class="common_input_box radio_box">
                                    Select Menu
                                    <div class="box_wrap">
                                        <label for="n_3" class="radio_label">
                                            <input type="checkbox" name="pMenu" id="n_3" value="photo"<%If Instr(Cols_Menu,"photo") > 0 Then%> checked<%End If%>>
                                            <label for="n_3">Photo</label>
                                        </label>

                                        <label for="n_4" class="radio_label">
                                            <input type="checkbox" name="pMenu" id="n_4" value="video"<%If Instr(Cols_Menu,"video") > 0 Then%> checked<%End If%>>
                                            <label for="n_4">Video</label>
                                        </label>
                                         
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn">Save</button>
                </div>

                <div class="info_edit_wrap common_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        Introduction of sponsoring organizations
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="manage_edit_box">
						<textarea name="description" id="description" style="width:100%;text-align:center;height:500px;"><%=Cols_Description%></textarea>
						<script>
							CKEDITOR.env.isCompatible = true;
							CKEDITOR.replace('description', {
								filebrowserUploadUrl: "/common/lib/ckeditor/upload_img.asp?type=common",
								height: 400
							} );	
						</script>
                    </div>

                    <button type="button" class="common_submit_btn">Save</button>
                </div>

            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
    $(document).ready(function () {
		 
		$(".imgPreView").hide();

        $.datepicker.setDefaults($.datepicker.regional['ko']);

        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

        //시작일.
        $('#fromDate').datepicker({
            showOn: "both", // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "../image/sub/d_icon.png", // 버튼 이미지
            buttonImageOnly: true, // 버튼 이미지만 표시할지 여부
            buttonText: "날짜선택", // 버튼의 대체 텍스트
            dateFormat: "yy-mm-dd", // 날짜의 형식
            changeMonth: true, // 월을 이동하기 위한 선택상자 표시여부
            //minDate: 0,      // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function (selectedDate) {
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#toDate").datepicker("option", "minDate", selectedDate);
            }
        });

        //종료일
        $('#toDate').datepicker({
            showOn: "both",
            buttonImage: "../image/sub/d_icon.png",
            buttonImageOnly: true,
            buttonText: "날짜선택",
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            //minDate: 0, // 오늘 이전 날짜 선택 불가
            onClose: function (selectedDate) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#fromDate").datepicker("option", "maxDate", selectedDate);
            }
        });
		//템플릿 선택
		$(".btm_box .common_edit_btn_box .use_btn").click(function(){
			$("#pTemplate").val($(this).attr("data-Template"))
			$(".t_edit_wrap .box").removeClass("on");
			$(".t_edit_wrap .use_btn").text("Use");
			$(this).parent().parent().parent().addClass("on");
			$(this).text("In Use");
		});
		
		//프로젝트 이미지 등록
		$("#projectfile").on("change", function(event) {
			//이미지 파일 체크
			var imgFile = $('#projectfile').val();
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
			if(imgFile != "" ) {
				if(!imgFile.toLowerCase().match(fileForm)) {
    				alert("Only image files can be uploaded.");
					return false;
				}
			}
			var formData = new FormData();
			formData.append("fileObj", $("#projectfile")[0].files[0]);
			$.ajax({
				url: "/common/json/member/memberImg.json.asp?saveType=project",
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType : 'json', 
				success: function(result){
					if(result.RESULT == "SUCCESS"){						
						$(".imgPreView .result_img").css({"background": "url("+result.DATAIMG+") no-repeat center ","width":"100%","height":"100%","border-radius":"calc(100vw * (14/1400))"});
						$(".imglabel").hide();
						$(".imgPreView").show();						
						$("#projectImg").val(result.DATAIMG);
					}else{
						if(result.DATA == "1"){
							alert("Upload file does not exist.");
						}else{
							alert("Only image files can be uploaded.");
						}
					}
				},
				error : function(){
					alert("Server request failed");
					
				}
			});

		});
		//저장하기
		$(".common_submit_btn").click(function(){
			var payMothodVal = "";
			$("input[name=payMothod]:checked").each(function(){
				if(payMothodVal){
					payMothodVal = payMothodVal + "," + $(this).val();
				}else{
					payMothodVal = $(this).val();
				}
			});
			var menuVal = "";
			$("input[name=pMenu]:checked").each(function(){
				if(menuVal){
					menuVal = menuVal + "," + $(this).val();
				}else{
					menuVal = $(this).val();
				}
			}); 
			if( $("#projectName").val() == "" ){
				alert("Please enter the project name.");
				$("#projectName").focus();
				return false;
			}
			if( $("#targetMoney").val() == "" ){
				alert("Please enter the target amount.");
				$("#targetMoney").focus();
				return false;
			}

			if( $("#fromDate").val() == "" ){
				alert("Please enter the operating period.");
				return false;
			}
			if( $("#toDate").val() == "" ){
				alert("Please enter the operating period.");
				return false;
			}
			if( $("#email").val() ){
				var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
				if(!regExp.test($("#email").val())){
					alert("Not in email format.");
					$("#email").focus();
					return false;
				}
			}
			//CKEDITOR textarea 데이터전달
			for ( instance in CKEDITOR.instances ){
				CKEDITOR.instances[instance].updateElement();
			}
			 
			$.ajax({
				url : "/common/json/member/mypage_management_add.json.asp",
				type : "post",
				data : {pCode:$("#pCode").val(), sgCode:$("#sgCode").val() ,template:$("#pTemplate").val(), projectImg:$("#projectImg").val(),  projectName:$("#projectName").val(), targetMoney:$("#targetMoney").val(), payMothod:payMothodVal, tel:$("#tel").val(),email:$("#email").val(), startDate:$("#fromDate").val(), endDate:$("#toDate").val(), menu:menuVal, description:$("#description").val() },
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("Saved.");
						location.href="mypage_management.asp?page="+ $("#page").val()						
					}else{
						alert("save failed.\n Please contact the manager.");
					}
					
				},
				error : function(){
					alert("Server request failed");
					
				}
			});
			 
            
		});
		if( $("#projectImg").val() ){
			$(".imgPreView .result_img").css({"background": "url("+$("#projectImg").val()+") no-repeat center","width":"100%","height":"100%","border-radius":"calc(100vw * (14/1400))"});
			$(".imglabel").hide();
			$(".imgPreView").show();
		}
 
		//숫자만 입력
		$('input[onlyNumber]').on('keyup', function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
    });


    window.onload = function () {
        var scroll = $('.sub_menu_wrap');
        var box = $('.sub_menu_wrap li.on a').offset().left;
        var scrollX = box - 40;
        scroll.stop().animate({
            scrollLeft: (scrollX)
        }, 1200); 
    };
	function fn_ImgDel(){
		$("#projectImg").val("");
		$("#projectfile").val("");
		$(".imgPreView").hide();
		$(".imglabel").show();
	}
    // END
</script>

<!-- #include file = '../include/footer.asp' -->