<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
  Language="KO"
  PageName = "mypage"
  SubName = "en"
  header = "sub"

If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/en/main.asp")
	Response.end
End If

'# 마이페이지 상단 프로젝트 갯수, 후원금 합계 정보
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
Dim arrGroupInfo : arrGroupInfo = objCommon.GetSupportGroupInfo(CKsgCode)
Set objCommon = Nothing
If IsArray(arrGroupInfo) Then
	Cols_sgCode				= arrGroupInfo(0,0)

	Cols_GroupName			= arrGroupInfo(1,0)
	Cols_GroupType			= arrGroupInfo(2,0)
	Cols_Homepage			= arrGroupInfo(3,0)
	Cols_WorkerName			= arrGroupInfo(4,0)
	Cols_Tel				= arrGroupInfo(5,0)
	
	Cols_Email				= arrGroupInfo(6,0)
	Cols_PayMethod			= arrGroupInfo(7,0)
	Cols_LogoImg			= arrGroupInfo(8,0)
	Cols_Addr				= arrGroupInfo(9,0)
	Cols_Description		= arrGroupInfo(10,0)
	
	Cols_Template			= arrGroupInfo(11,0)
	Cols_TitleImg1			= arrGroupInfo(12,0)
	Cols_TitleImg2			= arrGroupInfo(13,0)
	Cols_TitleImg3			= arrGroupInfo(14,0)
	Cols_TitleName			= arrGroupInfo(15,0) 

	Cols_TitleDescription	= arrGroupInfo(16,0) 
	Cols_IntroImg1			= arrGroupInfo(17,0) 
	Cols_IntroImg2			= arrGroupInfo(18,0) 
	Cols_IntroImg3			= arrGroupInfo(19,0) 
	Cols_IntroTitle			= arrGroupInfo(20,0) 

	Cols_IntroDescription	= arrGroupInfo(21,0)
	Cols_MapX				= arrGroupInfo(22,0)
	Cols_MapY				= arrGroupInfo(23,0) 

Else

	MoveMsg "You must apply for the sponsorship system.","/en/system.asp"
End If
 
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<style>
#google-map{display:none;width:100%;height:300px;margin-top:20px;}
.sub_box{padding: 0 20px;}
.photo_box .result_box{display:none;}
.file_box_wrap .result_box{display:none;}
.mapTitle{color:black;background-color:white;padding:10px;border-radius:5px;}
.s_edit_wrap .file_box_wrap .result_box {margin-top:0px;}
</style>
<!-- container -->
<div id="container" class="en">
    <!-- mypage -->
    <div class="mypage_wrap edit">
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
                                <div class="name">a donation received<br class="hide-default show-700"/>this month($)</div>
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
                        <li class="on">
                            <a href="mypage_info_edit.asp">Sponsored organization information management</a>
                        </li>
                        <li>
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

                    <div class="mypage_tit">
                        Template select
                    </div>
					<input type="hidden" name="sgCode" id="sgCode" value="<%=Cols_sgCode%>">
					<input type="hidden" name="sgTemplate" id="sgTemplate" value="<%=Cols_Template%>">
					<input type="hidden" name="sgLogoImg" id="sgLogoImg" value="<%=Cols_LogoImg%>">
					<input type="hidden" name="groupType" id="groupType" value="<%=Cols_GroupType%>">
					<input type="hidden" name="payMethod" id="payMethod" value="<%=Cols_PayMethod%>">
					<input type="hidden" name="workerName" id="workerName" value="<%=Cols_WorkerName%>">

					<input type="hidden" name="titleImg1" id="titleImg1" value="<%=Cols_TitleImg1%>">
					<input type="hidden" name="titleImg2" id="titleImg2" value="<%=Cols_TitleImg2%>">
					<input type="hidden" name="titleImg3" id="titleImg3" value="<%=Cols_TitleImg3%>">

					
					<input type="hidden" name="introImg1" id="introImg1" value="<%=Cols_IntroImg1%>">
					<input type="hidden" name="introImg2" id="introImg2" value="<%=Cols_IntroImg2%>">
					<input type="hidden" name="introImg3" id="introImg3" value="<%=Cols_IntroImg3%>">

					

                    <div class="t_edit_wrap">
                        <div class="box<%If Cols_Template = "A" Then%> on<%End If%>">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type A</div>
                                <div class="common_edit_btn_box">
                                    <button type="button" onclick="alert('Coming soon.');">Preview</button>
                                    <button type="button" class="use_btn" data-Template="A"><%If Cols_Template = "A" Then%>In Use<%Else%>사용하기<%End If%></button>
                                </div>
                            </div>
                        </div>
                        <div class="box<%If Cols_Template = "B" Then%> on<%End If%>">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type B</div>
                                <div class="common_edit_btn_box">
                                    <button type="button" onclick="alert('Coming soon.');">Preview</button>
                                    <button type="button" class="use_btn" data-Template="B"><%If Cols_Template = "B" Then%>In Use<%Else%>Use<%End If%></button>
                                </div>
                            </div>
                        </div>
                        <div class="box<%If Cols_Template = "C" Then%> on<%End If%>">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type C</div>
                                <div class="common_edit_btn_box">
                                    <button type="button" onclick="alert('Coming soon.');">Preview</button>
                                    <button type="button" class="use_btn" data-Template="C"><%If Cols_Template = "C" Then%>In Use<%Else%>Use<%End If%></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="info_edit_wrap common_edit_wrap">
                    <div class="mypage_tit">
                        Basic information
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">Logo registration</div>
							<div class="common_file_box result_box logoPreView">
								<div class="result_img"></div>								
							</div>
                            <label for="logofile" class="common_file_box logolabel">
                                <input type="file" id="logofile">
                                <div class="img"></div>
                                <div class="ment">Please register your image</div>
                                <div class="sub_ment">Image size: 140 * 40</div>
                            </label>
                            <div class="common_edit_btn_box">
                                <button type="button" class="fir" id="change_logo">Logo change</button>
                                <button type="button" class="use_btn" id="del_logo">Delete</button>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="name" class="common_input_box">
                                    Name of sponsor organization
                                    <input type="text" class="common_input" id="groupName" value="<%=Cols_GroupName%>">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="tell" class="common_input_box r">
                                    Phone number
                                    <input type="text" class="common_input" id="tell" value="<%=Cols_Tel%>">
                                </label>
                                <label for="email" class="common_input_box">
                                    E-mail
                                    <input type="text" class="common_input" id="email" value="<%=Cols_Email%>">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="address" class="common_input_box r">
                                    Home page address
                                    <input type="text" class="common_input" id="homePage" value="<%=Cols_Homepage%>">
                                </label>
                                <label for="address_2" class="common_input_box">
                                    Group address
                                    <input type="text" class="common_input" id="address" value="<%=Cols_Addr%>">
                                </label>
                            </div>
                            <div class="label_box">
                                <label for="description" class="common_input_box">
                                    brief description
                                    <textarea id="description" class="common_area"><%=Cols_Description%></textarea>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn" data-saveType="default">Save</button>
                </div>

                <div class="title_edit_wrap common_edit_wrap">
                    <div class="mypage_tit">
                        Title design
                    </div>

                    <div class="photo_box">
					<%For i = 1 To 3%>
						<div class="common_file_box result_box i_result_<%=i%>">
                            <div class="result_img"></div>
                            <button type="button" class="remove_btn" onclick="fn_tImgDel(<%=i%>);"></button>
                        </div>						 
                        <label for="i_file_<%=i%>" class="common_file_box i_label_<%=i%>">
                            <input type="file" id="i_file_<%=i%>" class="title_img" data-num="<%=i%>">
                            <div class="img"></div>
                            <div class="ment">Please register your image</div>
                            <div class="sub_ment">Image size: 1920 * 820</div>
                        </label>		
					<%Next%>                         
                    </div>

                    <div class="label_box">
                        <label for="titleName" class="common_input_box">
                            a title phrase
                            <textarea id="titleName" class="common_area one"><%=Cols_TitleName%></textarea>
                        </label>
                    </div>

                    <div class="label_box">
                        <label for="titleDesc" class="common_input_box">
                            an explanatory statement
                            <textarea id="titleDesc" class="common_area two"><%=Cols_TitleDescription%></textarea>
                        </label>
                    </div>
                    <button type="button" class="common_submit_btn" data-saveType="addInfo">Save</button>
                </div>

                <div class="info_edit_wrap common_edit_wrap title_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        Introduction of sponsoring organizations
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">Introduction image</div>
                            <div class="sub_name">You have to use at least one.</div>

                            <div class="file_box_wrap" style="margin-top:10px;">
							 
							<%For i = 1 To 3%>
								<div class="common_file_box result_box s_result_<%=i%>">
                                    <div class="result_img"></div>    
									<button type="button" class="remove_btn" onclick="fn_iImgDel(<%=i%>);"></button>
                                </div>
								<label for="s_file_<%=i%>" class="common_file_box s_label_<%=i%>">
                                    <input type="file" class="intro_img" id="s_file_<%=i%>" data-num="<%=i%>">
                                    <div class="img"></div>
                                    <div class="ment">Please register your image</div>
                                    <div class="sub_ment">Image size: 1920 * 820</div>
                                </label>
							<%Next%>                                 
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="introTitle" class="common_input_box">
                                    Introduction Title Phrase
                                    <textarea id="introTitle" class="common_area two"><%=Cols_IntroTitle%></textarea>
                                </label>
                            </div>

                            <div class="label_box m">
                                <label for="introDesc" class="common_input_box">
                                    an explanatory statement
                                    <textarea id="introDesc" class="common_area three"><%=Cols_IntroDescription%></textarea>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn" data-saveType="addInfo">Save</button>

                </div>

                <div class="common_edit_wrap map_edit_wrap last">
                    <div class="mypage_tit">
                        Google Maps Coordinates
                    </div>
                    <div class="map_edit_box">
                        <div class="box fir">
                            <input type="text" class="txt_box fir" id="mapAddress">
                            <button type="button" class="search_btn" id="googleMapSearch">Search</button>
                        </div>
                        <div class="box">
                            <div class="txt_box">
                                <input type="text" class="sub_box" id="mapX" readonly value="<%=Cols_MapX%>">
                                <span>/</span>
                                <input type="text" class="sub_box" id="mapY" readonly  value="<%=Cols_MapY%>">
                            </div>
                            <button type="button" class="search_btn" id="googleMapShow">
                                <div class="icon"></div>
                                Google Maps
                            </button>
                        </div>
						
                    </div>
					<div id="google-map"></div>
                    <button type="button" class="common_submit_btn" data-saveType="addInfo">Save</button>
                </div>

            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->
 
<!-- Google Map API -->
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvnnHgaQdVLIfcsXWOlI0bcoMh3gqmF6Y&callback=initMap">
</script>
<script>
	function initMap(){
		//console.log('Map is initialized.');
		var map = new google.maps.Map(document.getElementById('google-map'), {
			zoom: 18,
			center: {
				lat: <%=NullValue(Cols_MapX,"37.4856641")%> ,
				lng: <%=NullValue(Cols_MapY,"126.8955021")%>
			}
			 
		});
		var cityHall = {lat: <%=NullValue(Cols_MapX,"37.4856641")%>, lng: <%=NullValue(Cols_MapY,"126.8955021")%>};		
		var marker = new google.maps.Marker({
			position: cityHall, 
			map: map,
			info : "<%=Cols_GroupName%>",
			title : "<%=Cols_GroupName%>"
		});
		var geocoder = new google.maps.Geocoder();
		$("#googleMapSearch").click(function(){
			if( $("#mapAddress").val()=="" ){
				alert("Please enter your address.");
				$("#mapAddress").focus();
				return false
			}
			geocodeAddress(geocoder, map);
		});
		function geocodeAddress(geocoder, resultMap) {
			//console.log('geocodeAddress 함수 실행'); 
			// 주소 설정
			var address = document.getElementById('mapAddress').value;
			geocoder.geocode({'address': address}, function(result, status) {
				/*console.log(result);
				console.log(status);*/

				if (status === 'OK') {
					// 맵의 중심 좌표를 설정한다.
					resultMap.setCenter(result[0].geometry.location);
					// 맵의 확대 정도를 설정한다.
					resultMap.setZoom(18);
					// 맵 마커
					var marker = new google.maps.Marker({
						map: resultMap,
						position: result[0].geometry.location
					});
					$("#mapX").val(marker.position.lat());
					$("#mapY").val(marker.position.lng());
					// 위도
					//console.log('위도(latitude) : ' + marker.position.lat());
					// 경도
					//console.log('경도(longitude) : ' + marker.position.lng());
					$("#google-map").show();
				} else {
					alert('word search failed : ' + status);
				}
			});
		}
	}
    $(document).ready(function () {
		//저장하기 
		$(".common_submit_btn").click(function(){
			$.ajax({
				url : "/common/json/member/mypage_info_edit.json.asp",
				type : "post",
				data : {sgMode:$(this).attr("data-saveType") ,sgCode:$("#sgCode").val(), groupType:$("#groupType").val(), payMethod:$("#payMethod").val(), sgTemplate:$("#sgTemplate").val(), sgLogoImg:$("#sgLogoImg").val(), groupName:$("#groupName").val(), tell:$("#tell").val() ,email:$("#email").val(), homePage:$("#homePage").val(), address:$("#address").val(), description:$("#description").val(), workerName:$("#workerName").val(), titleImg1:$("#titleImg1").val(), titleImg2:$("#titleImg2").val(), titleImg3:$("#titleImg3").val(), titleName:$("#titleName").val(), titleDesc:$("#titleDesc").val(), introImg1:$("#introImg1").val(), introImg2:$("#introImg2").val(), introImg3:$("#introImg3").val(), introTitle:$("#introTitle").val(), introDesc:$("#introDesc").val(), mapX:$("#mapX").val(), mapY:$("#mapY").val() },
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("Saved.");
					}else{
						alert("save failed.\n please contact the manager.");
					}					
				},				
				error : function(){
					alert("Server request failed");					
				}
			});
		});

		//템플릿 선택
		$(".btm_box .common_edit_btn_box .use_btn").click(function(){
			$("#sgTemplate").val($(this).attr("data-Template"))
			$(".t_edit_wrap .box").removeClass("on");
			$(".t_edit_wrap .use_btn").text("Use");
			$(this).parent().parent().parent().addClass("on");
			$(this).text("In Use");
		});
		
		$(".logoPreView").hide();
		//로고변경
		$("#change_logo").click(function(){
			$("#logofile").click();
		});
		$("#googleMapShow").click(function(){
			$("#google-map").toggle();
		});
		//로고삭제
		$("#del_logo").click(function(){
			if (confirm("Are you sure you want to delete?")) {
				//삭제처리
				//console.log("삭제처리");
				$("#sgLogoImg").val('');
				$("#logofile").val('');
				$(".logolabel").show();
				$(".logoPreView").hide();	
				
			}
		});
		$("#logofile").on("change", function(event) {
			//이미지 파일 체크
			var imgFile = $('#logofile').val();
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
			if(imgFile != "" ) {
				if(!imgFile.toLowerCase().match(fileForm)) {
    				alert("Only image files can be uploaded.");
					return false;
				}
			}
			var formData = new FormData();
			formData.append("fileObj", $("#logofile")[0].files[0]);
			$.ajax({
				url: "/common/json/member/memberImg.json.asp?saveType=system",
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType : 'json', 
				success: function(result){
					if(result.RESULT == "SUCCESS"){						
						$(".logoPreView .result_img").css({"background": "url("+result.DATAIMG+") no-repeat center ","width":"100%","height":"100%","border-radius":"calc(100vw * (14/1400))"});
						$(".logolabel").hide();
						$(".logoPreView").show();
						//$(".logoPreView").css({"padding":"0px"});
						$("#sgLogoImg").val(result.DATAIMG);
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

		if( $("#sgLogoImg").val() ){
			$(".logoPreView .result_img").css({"background": "url("+$("#sgLogoImg").val()+") no-repeat center","width":"100%","height":"100%","border-radius":"calc(100vw * (14/1400))"});
			$(".logolabel").hide();
			$(".logoPreView").show();
		}
		if( $("#titleImg1").val() ){
			$(".i_result_1").show();
			$(".i_result_1 .result_img").css({"background": "url("+$("#titleImg1").val()+") no-repeat center / cover"});
			$(".i_label_1").hide();
		}
		if( $("#titleImg2").val() ){
			$(".i_result_2").show();
			$(".i_result_2 .result_img").css({"background": "url("+$("#titleImg2").val()+") no-repeat center / cover"});
			$(".i_label_2").hide();
		}
		if( $("#titleImg3").val() ){
			$(".i_result_3").show();
			$(".i_result_3 .result_img").css({"background": "url("+$("#titleImg3").val()+") no-repeat center / cover"});
			$(".i_label_3").hide();
		}
		if( $("#introImg1").val() ){
			$(".s_result_1").show();
			$(".s_result_1 .result_img").css({"background": "url("+$("#introImg1").val()+") no-repeat center / cover"});
			$(".s_label_1").hide();
		}
		if( $("#introImg2").val() ){
			$(".s_result_2").show();
			$(".s_result_2 .result_img").css({"background": "url("+$("#introImg2").val()+") no-repeat center / cover"});
			$(".s_label_2").hide();
		}
		if( $("#introImg3").val() ){
			$(".s_result_3").show();
			$(".s_result_3 .result_img").css({"background": "url("+$("#introImg3").val()+") no-repeat center / cover"});
			$(".s_label_3").hide();
		}
		//타이틀 디자인 이미지 업로드		
		$(".title_img").on("change", function(event) {
			var ImgNum = $(this).attr("data-num");
			var imgFile = $(this).val(); 
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
			if(imgFile != "" ) {
				if(!imgFile.toLowerCase().match(fileForm)) {
    				alert("Only image files can be uploaded.");
					return false;
				}
			}
			var formData = new FormData();
			formData.append("fileObj", $(this)[0].files[0]);
			$.ajax({
				url: "/common/json/member/memberImg.json.asp?saveType=title",
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType : 'json', 
				success: function(result){
					//console.log(result);
					if(result.RESULT == "SUCCESS"){						
						$("#titleImg"+ImgNum).val(result.DATAIMG);
						$(".i_result_"+ImgNum + " .result_img").css({"background": "url("+result.DATAIMG+") no-repeat center / cover"});
						$(".i_result_"+ImgNum).show();
						$(".i_label_"+ImgNum).hide();						
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
		//소개 이미지 업로드
		$(".intro_img").on("change", function(event) {
			var ImgNum = $(this).attr("data-num");
			var imgFile = $(this).val(); 
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
			if(imgFile != "" ) {
				if(!imgFile.toLowerCase().match(fileForm)) {
    				alert("Only image files can be uploaded.");
					return false;
				}
			}
			var formData = new FormData();
			formData.append("fileObj", $(this)[0].files[0]);
			$.ajax({
				url: "/common/json/member/memberImg.json.asp?saveType=info",
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType : 'json', 
				success: function(result){
					//console.log(result);
					if(result.RESULT == "SUCCESS"){						
						$("#introImg"+ImgNum).val(result.DATAIMG);
						$(".s_result_"+ImgNum + " .result_img").css({"background": "url("+result.DATAIMG+") no-repeat center / cover"});
						$(".s_result_"+ImgNum).show();
						$(".s_label_"+ImgNum).hide();						
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

    });
	//타이틀 디자인 이미지 삭제
	function fn_tImgDel(num){
		$("#titleImg"+num).val("");
		$(".i_result_"+num).hide();
		$(".i_label_"+num).show();		
	}
	//소개 이미지 삭제
	function fn_iImgDel(num){
		$("#introImg"+num).val('');
		$(".s_result_"+num).hide();
		$(".s_label_"+num).show();
	}

    // test
    window.onload = function () {
        var scroll = $('.sub_menu_wrap');
        var box = $('.sub_menu_wrap li.on a').offset().left;
        var scrollX = box - 40;
        scroll.stop().animate({
            scrollLeft: (scrollX)
        }, 1200);
    };
    // END
</script>

<!-- #include file = '../include/footer.asp' -->
 