<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)		
Dim iBCode		: iBCode		= fnSqlChk(Request("qCode"), 0, 0)
'########## Request Paramas // ##########
' 상세정보 조회
Set objBoard = New clsBoard
Dim arrInfo : arrInfo = objBoard.GetBoardQnAInfo(iBCode)
Set objBoard = Nothing
If IsArray(arrInfo) Then
		 
	Cols_GroupName	= arrInfo(1,0)
	Cols_Contents	= arrInfo(6,0)
	Cols_RegDate	= arrInfo(8,0)
	'후원구분(0 - 후원단체, 1-종교단체, 2-교육단체, 3-정치단체,9-기타)
	If arrInfo(2,0) = "0" Then
		Cols_GroupTypeName = "후원단체"
	ElseIf arrInfo(2,0) = "1" Then
		Cols_GroupTypeName = "종교단체"
	ElseIf arrInfo(2,0) = "2" Then
		Cols_GroupTypeName = "교육단체"
	ElseIf arrInfo(2,0) = "3" Then
		Cols_GroupTypeName = "정치단체"
	ElseIf arrInfo(2,0) = "9" Then
		Cols_GroupTypeName = "기타"
	End If
	Cols_UserName	= arrInfo(3,0)	
	Cols_Tel		= arrInfo(4,0)
	Cols_Email		= arrInfo(5,0)
	Cols_Replay		= arrInfo(7,0)
	If arrInfo(0,0) = "0" Then
		Cols_UserName = Cols_UserName &" [비회원]"
		Cols_EmailCheck = " checked"
	End If
Else
	Call MsgBack("잘못된 접근입니다.")
End If
%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<script type="text/javascript" src="/common/lib/ckeditor/ckeditor.js"></script>
<style>
.search_wrap ul li .wrap .subreplay{padding:10px;width:100%;}
#cke_replay{width:100%;}
.board-view-btns{height:40px}
</style>
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content ">
		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href="/admin"><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(3).addClass('select');">게시판</a></li>
					<li><a href="qna_list.asp">1:1문의</a></li>
				</ul>
			</div>
		</div>			
		<div class="inner">	
			<!-- 검색 옵션 -->
			<div class="white_box">
				<div class="search_wrap">
					<ul>	
						<li class="col02">	
							<div class="wrap">
								<div class="tit">단체명</div>
								<div class="sub"><%=Cols_GroupName%></div>
							</div>
							<div class="wrap">
								<div class="tit">업체ID</div>
								<div class="sub"><%=Cols_GroupTypeName%></div>
							</div>
						</li>
						<li class="col02">	
							<div class="wrap">
								<div class="tit">신청자 이름</div>
								<div class="sub"><%=Cols_UserName%></div>
							</div>
							<div class="wrap">
								<div class="tit">연락처</div>
								<div class="sub"><%=Cols_Tel%></div>
							</div>
						</li>
						<li class="col02">
							<div class="wrap">
								<div class="tit">이메일</div>
								<div class="sub"><%=Cols_Email%></div>
							</div>
							<div class="wrap">
								<div class="tit">작성일</div>
								<div class="sub"><%=Cols_RegDate%></div>
							</div>
						</li>
						<li class="col01">
							<div class="wrap">
								<div class="tit">문의내용</div>
								<div class="sub">
									<%=Cols_Contents%>
								</div>
							</div>
						</li>
						<li class="">
							<div class="wrap">
								<div class="tit">답변</div>
								<div class="subreplay">
									<textarea name="replay" id="replay" cols="30" rows="15"><%=Cols_Replay%></textarea>
									<script>
										CKEDITOR.env.isCompatible = true;
										CKEDITOR.replace('replay', {
											filebrowserUploadUrl: "/common/lib/ckeditor/upload_img.asp?type=board",
											height: 300 

										} );	
									</script>
								</div>
							</div>
						</li>
						<li class="">
							<div class="wrap">
								<div class="tit">답변 메일발송</div>
								<div class="sub">
									<input type="checkbox" name="emailCheck" id="emailCheck"<%=Cols_EmailCheck%>>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="align-c mt30 btn">
					<a href="javascript:fn_save(0);">답변 저장</a>
					<a href="qna_list.asp?page=<%=iPage%>&schType=<%=iSchType%>&schText=<%=iSchText%>" class="bor ml10">취소</a>					
				</div>

				<div class="board-view-btns">
					<div class="right btn gray">						
						<a href="javascript:fn_del();">삭제</a>
					</div>					
				</div>
			</div>
			
		</div>

	</div>	
	<!-- END content -->
</div>
<!-- END container -->
<script>
	function fn_save(val){
		for ( instance in CKEDITOR.instances ){
			CKEDITOR.instances[instance].updateElement();
		}
		var emailCheck = 1;
		if($("#emailCheck").is(":checked") == true){
			emailCheck = 0;
		}
		$.ajax({
			url : "/common/json/board/qna.update.json.asp",
			type : "post",
			data : { qCode:<%=iBCode%>, aCode:<%=CkAdminCode%>, isDel:val, replay:$("#replay").val(), email:'<%=Cols_Email%>', emailCheck:emailCheck  },
			dataType : 'json',
			success : function(result){
				//console.log(result);
				if(result.DATA =="0"){					
					location.href="qna_list.asp?page=<%=iPage%>&schType=<%=iSchType%>&schText=<%=iSchText%>";
				}else{
					alert("변경 실패 하였습니다.\n관리자에게 문의 해주세요.");
				}					
			},				
			error : function(){
				alert("서버요청실패");					
			}
		});
	}
	function fn_del(){
		if (confirm("삭제하시겠습니까?")) {
			fn_save(1);
		}
	}

</script>

<!-- #include file = './include/footer.asp' -->
  