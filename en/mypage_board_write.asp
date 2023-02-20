<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
 
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iBCode		: iBCode		= fnSqlChk(Request("bCode"), 0, 0)	: iBCode = NullValue(iBCode,0)
Dim iBType		: iBType		= fnSqlChk(Request("bType"), 0, 0)
'BOARD 구분 BOARD - B0103 , PHOTO - B0104, VOD - B0105
'########## Request Paramas // ##########
 
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
Dim Cols_SgCode : Cols_SgCode = 0 '후원단체코드
Set objMember = New clsMember
Dim arrData : arrData = objMember.getMypageInfo(CKMemberCode)
Set objMember = Nothing
If IsArray(arrData) Then
	Cols_IngProject		= FormatNumber(arrData(0,0),0)
	Cols_EndProject		= FormatNumber(arrData(1,0),0)
	Cols_DonationSum	= FormatNumber(arrData(2,0),0)
	Cols_SgCode			= arrData(3,0)
End If


'게시판 상세정보 조회
Dim Cols_pCode : Cols_pCode = 0
Dim Cols_SubTitle : Cols_SubTitle = 0
Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonInfo(iBCode)
Set objBoard = Nothing
If IsArray(arrList) Then
	Cols_bType		= arrList(0,0)
	Cols_WriteCode	= arrList(1,0)
	Cols_WriteName	= arrList(2,0)
	Cols_Title		= arrList(3,0)	
	Cols_SubTitle	= arrList(4,0)
	Cols_TitleImg	= arrList(5,0)
	Cols_YoutubeUrl	= arrList(6,0)
	Cols_Contents	= arrList(7,0)
	Cols_ReadCnt	= arrList(8,0)
	Cols_Open		= arrList(9,0)	
	Cols_sgCode		= arrList(10,0)
	Cols_pCode		= arrList(11,0)
	Cols_RegDate	= arrList(12,0)
	Cols_FileName	= arrList(13,0)
	'	서브 타이틀 말머리(1-공지사항, 2-이벤트, 9-기타)
	If Cols_SubTitle = "1" Then
		Cols_SubTitleText = "Notice"
	ElseIf Cols_SubTitle = "2" Then 
		Cols_SubTitleText = "Event"
	ElseIf Cols_SubTitle = "9" Then 
		Cols_SubTitleText = "Etc"
	End If
	iBType = NullValue(iBType,Cols_bType)
End If

Cols_ListUrl = ""
Cols_WiteTitle = ""
If iBType = "B0103" Then
	Cols_ListUrl = "mypage_board.asp?page="&iPage
	Cols_WiteTitle = "BOARD"
ElseIf iBType = "B0104" Then
	Cols_ListUrl = "mypage_photo.asp?page="&iPage
	Cols_WiteTitle = "PHOTO"
ElseIf iBType = "B0105" Then
	Cols_ListUrl = "mypage_vod.asp?page="&iPage
	Cols_WiteTitle = "VOD"
End If 

 '프로젝트 리스트
Set objCommon = New clsCommon
Dim arrProjectList : arrProjectList = objCommon.GetProjectList(CKMemberCode, 1, 1000)
Set objCommon = Nothing
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<script type="text/javascript" src="/common/lib/ckeditor/ckeditor.js"></script>
<style>
.edit{
	height:auto !important;
	min-height:280px;
}
</style>
<!-- container -->
<div id="container" class="">
    <!-- mypage -->
    <div class="mypage_wrap management">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">

                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name"><%=CKUserName%> 님</div>
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
                        <li >
                            <a href="mypage_management.asp">Sponsored project management</a>
                        </li>
						<li<%If iBType = "B0103" Then%> class="on"<%End If%>>
                            <a href="mypage_board.asp">BOARD</a>
                        </li>
                        <li<%If iBType = "B0104" Then%> class="on"<%End If%>>
                            <a href="mypage_photo.asp">PHOTO</a>
                        </li>
                        <li<%If iBType = "B0105" Then%> class="on"<%End If%>>
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
                    </ul>

                    <div class="my_board_write_box">
                        <div class="tit"><%=Cols_WiteTitle%></div>

                        <form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="subTitle" id="subTitle" value="<%=Cols_SubTitle%>">
						<input type="hidden" name="pCode" id="pCode" value="<%=Cols_pCode%>">
						<input type="hidden" name="sgCode" id="sgCode" value="<%=Cols_SgCode%>">
						<input type="hidden" name="bCode" id="bCode" value="<%=iBCode%>">
						<input type="hidden" name="bType" id="bType" value="<%=iBType%>">
						<input type="hidden" name="listUrl" id="listUrl" value="<%=Cols_ListUrl%>">
						<input type="hidden" name="fileName" id="fileName" value="<%=Cols_FileName%>">
						<input type="hidden" name="titleImg" id="titleImg" value="<%=Cols_TitleImg%>">
						
						
                            <div class="write_box">
                                <%If iBType = "B0103" Then%>
                                <div class="write_form">
                                    <div class="name">Select</div>
                                    <div class="select_box common_write board">
                                        <input type="text" placeholder="Select" readonly value="<%=Cols_SubTitleText%>">
                                        <ul>
                                            <li data-value="1">Notice</li>
                                            <li data-value="2">Event</li>
                                            <li data-value="9">Ect</li>
                                        </ul>
                                    </div>
                                </div>
								<%End If%>
								<%If iBType = "B0104" OR iBType = "B0105" Then%>
                                <!-- vod_select박스 -->
                                <div class="write_form">
                                    <div class="name">Project selection</div>
                                    <div class="box_wrap_2 flex">
                                        <div class="select_box common_write vod">
                                            <input type="text" placeholder="Project selection" readonly id="project">
                                            <ul>
											<%
											If IsArray(arrProjectList) Then
												For i = 0 To UBound(arrProjectList,2)													 
											%>
                                                <li data-value="<%=arrProjectList(0, i)%>"><%=CutString(arrProjectList(1, i),20)%></li>
                                                 
											<%
												Next
											End If%>
                                            </ul>
                                        </div>
                                        <div class="box_wrap radio_box">
                                            <label for="bOpen" class="radio_label">
                                                <input type="checkbox" name="bOpen" id="bOpen" <%If Cols_Open = "0" Then%> checked<%End If%>>
                                                <label for="bOpen">Share Zenity homepage posts</label>
                                            </label>

                                        </div>
                                    </div>
                                </div>
                                <!-- END vod_select박스 -->
								<%End If%>
                                <div class="write_form">
                                    <div class="name">Title</div>
                                    <div class="common_write">
                                        <input type="text" id="title" name="title" value="<%=Cols_Title%>">
                                    </div>
                                </div>

                                <div class="edit">
                                    <textarea name="contents" id="contents" style="width:100%;text-align:center;height:500px;"><%=Cols_Contents%></textarea>
									<script>
										CKEDITOR.env.isCompatible = true;
										CKEDITOR.replace( 'contents', {
											filebrowserUploadUrl: "/common/lib/ckeditor/upload_img.asp?type=board",
											height: 420
										} );
									</script>
                                </div>
								<%If iBType = "B0103" OR iBType = "B0104" Then%>
                                <!-- board,photo 파일첨부박스 -->
                                <!-- photo 에서는 텍스트가 파일첨부 -> 리스트 이미지로 변경 됩니다. -->
                                <div class="write_form">
                                    <div class="name">File</div>
                                    <div class="wrap_box flex">
										 
                                        <div class="common_write">
                                            <input type="text" id="fileInput" readonly value="<%=Cols_FileName%>">
                                        </div>
                                        <div class="file_btn">
                                            <input type="file" id="file">
                                            <label for="file">attach</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- END board,photo 파일첨부박스 -->
								<%End If%>
								<%If iBType = "B0105" Then%>
                                <!-- vod url 입력 박스 -->
                                <div class="write_form">
                                    <div class="name">VOD URL </div>
                                    <div class="common_write">
                                        <input type="text" id="youtubeUrl" name="youtubeUrl" value="<%=Cols_YoutubeUrl%>">
                                    </div>
                                </div>
                                <!-- END vod url 입력 박스 -->
								<%End If%>

                                <div class="btn_box">
                                    <!-- vod와 photo에서는 텍스트가 작성하기 -> 등록하기로 변경 됩니다. -->
                                    <a href="javascript:;" class="add_btn common_submit_btn">Save</a>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		$("#file").change(function(){
			var uploadUrl = "/common/json/member/memberFile.json.asp?saveType=board"
			if( $("#bType").val() == "B0104"){
				//이미지 파일 체크
				var imgFile = $('#file').val();
				var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
				if(imgFile != "" ) {
					if(!imgFile.toLowerCase().match(fileForm)) {
						alert("Save Only image files can be uploaded.");
						return false;
					}
				}
				uploadUrl = "/common/json/member/memberImg.json.asp?saveType=board"
			}
			var formData = new FormData();
			formData.append("fileObj", $("#file")[0].files[0]);
			$.ajax({
				url: uploadUrl,
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType : 'json', 
				success: function(result){
					console.log(result);
					if(result.RESULT == "SUCCESS"){
						$("#titleImg").val(result.DATAIMG);
						$("#fileName").val(result.IMGNAME)
					}else{
						if(result.DATA == "1"){
							alert("Upload file does not exist.");
						}else{
							alert("Save Only image files can be uploaded.");
						}
					}
				},
				error : function(){
					alert("서버요청실패");
					location.href="/en/main.asp"
				}
			});
			$("#fileInput").val($(this).val());
		});

        // select test
        $(document).on('click', '.select_box', function () {
            if (!$(this).hasClass('on')) {
                $(".select_box").removeClass('on');
                $(this).addClass('on');
            } else {
                $(this).removeClass('on');
            }
        });

        $(document).on('click', ".select_box ul li", function () {
            var v = $(this).text();            
            $(this).closest("ul").prev('input').val(v);
			if( $("#bType").val() == "B0103"){
				$("#subTitle").val($(this).attr("data-value"));
			}else{
				$("#pCode").val($(this).attr("data-value"));
			}
			 
        });
        // END select test
		//프로젝트 선택 보여주기
		if($("#pCode").val()){ 
			$(".common_write.vod ul li").each(function(){
				if($("#pCode").val() == $(this).attr("data-value") ){					
					$("#project").val($(this).text());
				}
			});
		}
		//저장하기
		$(".common_submit_btn").click(function(){			

			if( $("#bType").val() == "B0103"){//BOARCD
				if( $("#subTitle").val() =="0"){	
					alert("please select sub title.");
					return false;
				}
			}
			if( $("#title").val() ==""){
				alert("Please enter the subject.");
				$("#title").focus();
				return false;
			}
			if( $("#bType").val() == "B0105"){//VOD
				if( $("#youtubeUrl").val() ==""){
					alert("Please enter VOD URL.");
					$("#youtubeUrl").focus();
					return false;
				}
				 
				if (!$("#youtubeUrl").val().match("youtu")) {
					alert("Please enter youtube URL.");
					$("#youtubeUrl").focus();
					return false;
				}
				 
			}
			if( $("#bType").val() == "B0104"){//PHOTO
				if( $("#titleImg").val() ==""){
					alert("Please upload the attached file image.");					 
					return false;
				}
			}

			//CKEDITOR textarea 데이터전달
			for ( instance in CKEDITOR.instances ){
				CKEDITOR.instances[instance].updateElement();
			}
			var openVal = 1;
			if($("#bOpen").is(":checked") == true){
				openVal = 0;
			}
			$.ajax({
				url : "/common/json/board/board.update.json.asp",
				type : "post",
				data : {bCode:$("#bCode").val(), bType:$("#bType").val(), mCode:<%=CKMemberCode%>, writeName:'<%=CKUserName%>', title:$("#title").val(), subTitle:$("#subTitle").val(), titleImg:$("#titleImg").val(), fileName:$("#fileName").val(), youtubeUrl:$("#youtubeUrl").val(), contents:$("#contents").val(), open:openVal, sgCode:$("#sgCode").val(), pCode:$("#pCode").val() },
				dataType : 'json',
				success : function(result){
					//console.log(result);
					if(result.DATA =="0"){
						alert("Saved.");
						location.href=$("#listUrl").val();
					}else{
						alert("Save failed.\n Please contact the manager.");
					}					
				},				
				error : function(){
					alert("Server request failed");					
				}
			});
		});
		 
		 
		 
		

    });

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

	function fn_projectVal(val){
		console.log(val);
	}

</script>

<!-- #include file = '../include/footer.asp' -->