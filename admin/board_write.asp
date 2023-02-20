<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)		: iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	
Dim iBType		: iBType		= fnSqlChk(Request("bType"), 0, 0)		
Dim iBCode		: iBCode		= fnSqlChk(Request("bCode"), 0, 0)		: iBCode = NullValue(iBCode,0)
'########## Request Paramas // ##########
If iBCode > 0 Then
	'게시판 상세정보 조회
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
		  
	Else
		Call MsgBack("잘못된 접근입니다.")
	End If

End If
Set objCommon = New clsCommon
Dim arrGroupList : arrGroupList = objCommon.GetAllSupportGroupList("", "", 1, 1000)

If Not(Cols_sgCode = "" Or IsNull(Cols_sgCode) Or Cols_sgCode = "0")  Then
	Cols_ReadOnly = " disabled"
	Dim arrProjectList : arrProjectList = objCommon.GetSupportProjectList(Cols_sgCode, 0)
End If
Set objCommon = Nothing

'공지사항, 뉴스룸, 자주묻는 질문 관리자 계정으로 등록
If iBType = "B0101" Or iBType = "B0102" Or iBType = "B0106" Then
	Cols_mCode = CkAdminCode
	Cols_writeName = CkAdminId
Else '그외 게시판은 해당 후원단체 계정으로 등록처리
	Cols_mCode = 0
	Cols_writeName = ""

End If

%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<script type="text/javascript" src="/common/lib/ckeditor/ckeditor.js"></script>
<style>
@media (max-width: 700px){
	.board-write th {
		display:none;
	}
	.board-write select{
		margin-bottom:10px;
	}
}
.field-form img{max-width:100%;height:auto}

</style>
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content">

		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href=""><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(3).addClass('select');">게시판</a></li>
					<li><a href="board_list.asp?bType=<%=iBType%>"><%=BoardTitleName(iBType)%></a></li>
				</ul>
			</div>
		</div>
		
		<div class="inner">	
			<input type="hidden" name="mCode" id="mCode" value="<%=Cols_mCode%>">
			<input type="hidden" name="writeName" id="writeName" value="<%=Cols_writeName%>">

			<input type="hidden" name="bCode" id="bCode" value="<%=iBCode%>">				
			<input type="hidden" name="fileName" id="fileName" value="<%=Cols_FileName%>">
			<input type="hidden" name="titleImg" id="titleImg" value="<%=Cols_TitleImg%>">
			<div class="white_box">
				<!-- board write -->
				<div class="board-write">
					<table>
						<%If Left(iBType,5) = "B0106" Then%>
						<tr>
							<th>구분</th>
							<td>
								<div class="field-form">
									<select name="bType" id="bType">
										<option value="B0106">전체</option>
										<option value="B010601"<%If Cols_bType = "B010601" Then%> selected<%End If%>>제니티서비스</option>
										<option value="B010602"<%If Cols_bType = "B010602" Then%> selected<%End If%>>기부활동</option>
										<option value="B010603"<%If Cols_bType = "B010603" Then%> selected<%End If%>>지원활동</option>
										<option value="B010604"<%If Cols_bType = "B010604" Then%> selected<%End If%>>기타</option>
									</select>
										
								</div>
							</td>
						</tr>
						<%Else%>
						<input type="hidden" name="bType" id="bType" value="<%=iBType%>">
						<%End If%>
						<%If iBType = "B0103" Or iBType = "B0104" OR iBType = "B0105" Then%>
						<tr>
							<th>후원단체/프로젝트</th>
							<td>
								<div class="field-form">									
									<select name="sgCode" id="sgCode"<%=Cols_ReadOnly%> style="width:200px;">
										<option value="0">후원단체 선택</option>
<%
										If IsArray(arrGroupList) Then
											For i = 0 To UBound(arrGroupList,2)
												If Cols_sgCode = arrGroupList(0,i) Then
													Response.Write "<option value="""&arrGroupList(0,i)&""" selected>"&arrGroupList(2,i)&"</option>"
												Else
													Response.Write "<option value="""&arrGroupList(0,i)&""">"&arrGroupList(2,i)&"</option>"
												End If
											Next
										End If										
%> 
									</select>
									<%If iBType = "B0104" OR iBType = "B0105" Then%>
									&nbsp;&nbsp;/&nbsp;&nbsp;
									<select name="pCode" id="pCode" style="width:300px;">
										<option value="0">프로젝트 선택</option>
<%
										If IsArray(arrProjectList) Then
											For i = 0 To UBound(arrProjectList,2)
												If Cols_pCode = arrProjectList(0,i) Then
													Response.Write "<option value="""&arrProjectList(0,i)&""" selected>"&arrProjectList(2,i)&"</option>"
												Else
													Response.Write "<option value="""&arrProjectList(0,i)&""">"&arrProjectList(2,i)&"</option>"
												End If
											Next
										End If										
%> 
									</select>
									&nbsp;&nbsp;
									<label for="bOpen" class="radio_label">
										<input type="checkbox" name="bOpen" id="bOpen" <%If Cols_Open = "0" Then%> checked<%End If%>>
										<label for="bOpen">제니티홈페이지 게시물 공유</label>
									</label>
									<%End If%>
								</div>
							</td>
						</tr>
						<%End If%>
						<%If iBType = "B0103" Then%>
						<tr>
							<th>말머리</th>
							<td>
								<div class="field-form">
									<select name="subTitle" id="subTitle">
										<option value="0">말머리 선택</option>
										<option value="1"<%If Cols_SubTitle = "1" Then%> selected<%End If%>>공지사항</option>
										<option value="2"<%If Cols_SubTitle = "2" Then%> selected<%End If%>>이벤트</option>
										<option value="9"<%If Cols_SubTitle = "9" Then%> selected<%End If%>>기타</option>
									</select>
								</div>
							</td>
						</tr>
						<%Else%>
							<input type="hidden" name="subTitle" id="subTitle" value="<%=Cols_SubTitle%>">
						<%End If%>
						<tr>
							<th>제목</th>
							<td>
								<div class="field-form">
									<input type="text" id="title" class="img-w100" placeholder="제목을 입력해주세요" value="<%=Cols_Title%>">
								</div>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div class="field-form">
									<textarea name="contents" id="contents" cols="30" rows="15"><%=Cols_Contents%></textarea>
									<script>
										CKEDITOR.env.isCompatible = true;
										CKEDITOR.replace('contents', {
											filebrowserUploadUrl: "/common/lib/ckeditor/upload_img.asp?type=board",
											height: 400 

										} );	
									</script>
								</div>
							</td>
						</tr>
						<%If iBType = "B0105" Then%>
						<tr>
							<th>VOD URL 입력</th>
							<td>
								<div class="field-form">
									<input type="text" id="youtubeUrl" name="youtubeUrl" class="img-w100" placeholder="VOD URL 입력을 입력해주세요" value="<%=Cols_YoutubeUrl%>">
								</div>
							</td>
						</tr>
						<%ElseIf (Left(iBType,5) <>"B0106") Then%>
						<tr>
							<th>첨부파일</th>
							<td>
								<div class="field-form">
									<input type="file" id="file">
									<%If Not(Cols_FileName = "" Or IsNull(Cols_FileName)) Then%>
									<div class="edtFileName">첨부파일 : 	<%=Cols_FileName%>	</div>
									<%End If%>
								</div>
							</td>
						</tr>
						<%End If%>
					</table>
					
					<!-- Buttons -->
					<div class="align-c mt30 btn">
						<a href="javascript:fn_save();">저장</a>
						<a href="board_list.asp?bType=<%=iBType%>&page=<%=iPage%>&schText=<%=iSchText%>&schType=<%=iSchType%>" class="bor ml10">취소</a>
					</div><!-- END Buttons -->

				</div><!-- END board write -->

			</div>

		</div>

	</div>	
	<!-- END content -->

</div>
<!-- END container -->
<script>
	$(document).ready(function(){
		//후원단체 선택시 프로젝트 select 가져오기
		$("#sgCode").on("change", function(event) {			
			$.ajax({
				url : "/common/json/admin/project.select.asp",
				type : "post",
				data : {gsCode:$(this).val()},
				success : function(result){
					$("#pCode").html(result);
				},				
				error : function(){
					alert("서버요청실패");					
				}
			});
		});
		//파일 업로드
		$("#file").change(function(){
			var uploadUrl = "/common/json/member/memberFile.json.asp?saveType=board"
			if( $("#bType").val() == "B0104" || $("#bType").val() == "B0101"){
				//이미지 파일 체크
				var imgFile = $('#file').val();
				var fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
				if(imgFile != "" ) {
					if(!imgFile.toLowerCase().match(fileForm)) {
						alert("이미지 파일만 업로드 가능합니다.");
						$('#file').val('');
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
						$("#fileName").val(result.IMGNAME);
						$(".edtFileName").hide();
					}else{
						if(result.DATA == "1"){
							alert("업로드 파일이 존재하지 않습니다.");
						}else{
							alert("이미지 파일을 올려주세요.");
						}
					}
				},
				error : function(){
					alert("서버요청실패");					
				}
			});
		});
	});
	function fn_save(){
		if($("#bType").val() == "B0106"){
			alert("구분을 선택해주세요.");
			return false;
		}
		<%If iBType = "B0103" Or iBType = "B0104" OR iBType = "B0105" Then%>
		if( $("#sgCode").val() == "0"){
			alert("후원단체를 선택해주세요.");
			return false;
		}
		<%End If%>
		<%If iBType = "B0104" OR iBType = "B0105" Then%>
		if( $("#pCode").val() == "0"){
			alert("프로젝트를 선택해주세요.");
			return false;
		}
		<%End If%>
		if( $("#bType").val() == "B0103"){//BOARCD
			if( $("#subTitle").val() =="0"){	
				alert("말머리를 선택해주세요.");
				$("#subTitle").focus();
				return false;
			}
		}
		if($("#title").val()==""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		//CKEDITOR textarea 데이터전달
		for ( instance in CKEDITOR.instances ){
			CKEDITOR.instances[instance].updateElement();
		}
		var openVal = 1;
		if($("#bOpen").is(":checked") == true){
			openVal = 0;
		}
		//이미지 필수 체크
		<%If iBType = "B0101" OR iBType = "B0104" Then%>
		if( $("#fileName").val() == ""){	
			alert("이미지를 선택해주세요.");
			return false;
		}
		<%End If%>
		//vod 필수 입력 체크
		if( $("#bType").val() == "B0105"){//VOD
			if( $("#youtubeUrl").val() ==""){
				alert("VOD URL을 입력해주세요.");
				$("#youtubeUrl").focus();
				return false;
			}			 
			if (!$("#youtubeUrl").val().match("youtu")) {
				alert("youtube URL을 입력해주세요.");
				$("#youtubeUrl").focus();
				return false;
			}			 
		}
		$.ajax({
			url : "/common/json/board/board.update.json.asp",
			type : "post",
			data : {bCode:$("#bCode").val(), bType:$("#bType").val(), mCode:$("#mCode").val(), writeName:$("#writeName").val(), title:$("#title").val(), subTitle:$("#subTitle").val(), titleImg:$("#titleImg").val(), fileName:$("#fileName").val(), youtubeUrl:$("#youtubeUrl").val(), contents:$("#contents").val(), open:openVal, sgCode:$("#sgCode").val(), pCode:$("#pCode").val() },
			dataType : 'json',
			success : function(result){
				//console.log(result);
				if(result.DATA =="0"){
					alert("저장 되었습니다.");
					location.href="board_list.asp?bType="+$("#bType").val();
				}else{
					alert("저장 실패 하였습니다.\n관리자에게 문의 해주세요.");
				}					
			},				
			error : function(){
				alert("서버요청실패");					
			}
		});
	}
</script>
<!-- #include file = './include/footer.asp' -->
  